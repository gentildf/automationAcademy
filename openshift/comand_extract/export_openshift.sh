#!/bin/bash

IGNORE_NAMESPACES="^(openshift|kube|default|redhat-).*"

# Cabeçalho CSV filtrado por ;
echo "NAMESPACE;APP;POD;NODE-IP;SVC-PORT;ROUTE-PORT;SERVICE;ROUTE"

for ns in $(oc get ns --no-headers -o custom-columns=":metadata.name"); do
  if [[ "$ns" =~ $IGNORE_NAMESPACES ]]; then
    continue
  fi

  apps=$(oc get pods -n "$ns" --no-headers -o custom-columns=":metadata.labels.app" | sort -u | grep -v '^$')

  for app in $apps; do
    if [[ -z "$app" ]] || echo "$app" | grep -q '[<>]'; then
      continue
    fi

    mapfile -t pod_info < <(oc get pods -n "$ns" -l app="$app" -o jsonpath='{range .items[*]}{.metadata.name}{";"}{.status.hostIP}{"\n"}{end}')
    [[ ${#pod_info[@]} -eq 0 ]] && pod_info=("---;---")

    mapfile -t svc_info < <(oc get svc -n "$ns" -l app="$app" -o jsonpath='{range .items[*]}{.metadata.name}{";"}{range .spec.ports[*]}{.port}{"|"}{end}{"\n"}{end}')
    [[ ${#svc_info[@]} -eq 0 ]] && svc_info=("---;---")

    mapfile -t route_info < <(oc get route -n "$ns" -l app="$app" -o jsonpath='{range .items[*]}{.spec.host}{";"}{.spec.port.targetPort}{"\n"}{end}')
    [[ ${#route_info[@]} -eq 0 ]] && route_info=("---;---")

    for pod_line in "${pod_info[@]}"; do
      pod_name=$(echo "$pod_line" | cut -d';' -f1)
      node_ip=$(echo "$pod_line" | cut -d';' -f2)

      for svc_line in "${svc_info[@]}"; do
        svc_name=$(echo "$svc_line" | cut -d';' -f1)
        svc_ports=$(echo "$svc_line" | cut -d';' -f2 | sed 's/|$//')

        for route_line in "${route_info[@]}"; do
          route_host=$(echo "$route_line" | cut -d';' -f1)
          route_port=$(echo "$route_line" | cut -d';' -f2)

          echo "${ns};${app};${pod_name};${node_ip};${svc_ports};${route_port};${svc_name};${route_host}"
        done
      done
    done
  done
done
