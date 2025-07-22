# OpenShift App Inventory Script

Este script em Bash foi desenvolvido para coletar informações detalhadas sobre aplicações em execução em um cluster OpenShift, ignorando os namespaces padrão do sistema. Ele retorna os dados em formato tabular, ideais para exportação e análise em ferramentas como Excel.

## 🔧 Funcionalidade

O script coleta e exibe as seguintes informações para cada aplicação:

- **Namespace** da aplicação
- **Nome da aplicação (label `app`)**
- **Nome dos Pods**
- **Nome dos Services**
- **IP do nó onde o Pod está executando**
- **Porta(s) exposta(s) pelo Service**
- **Rota (host) associada**
- **Porta(s) da rota**

## 🚫 Namespaces Ignorados

São ignorados automaticamente os namespaces padrão do OpenShift:

- `openshift-*`
- `kube-*`
- `default`
- `redhat-*`

## 💡 Exemplo de Saída

```text
NAMESPACE                 APP                  POD                            NODE IP            SERVICE          SERVICE PORT(S)      ROUTE HOST                   ROUTE PORT(S)
dev-apps                 my-app               my-app-1234-abcd                10.0.1.45         my-app-service   8080/TCP              app.example.com              443
```

## ▶️ Como Executar

1. Salve o script com um nome, por exemplo: `app-inventory.sh`.

2. Dê permissão de execução:

   ```bash
   chmod +x app-inventory.sh
   ```

3. Execute com o `oc` já autenticado:

   ```bash
   ./app-inventory.sh
   ```

## 📥 Exportar para CSV/Excel

Caso deseje exportar para um `.csv` compatível com Excel:

```bash
./app-inventory.sh > apps.csv
```

Depois, abra o arquivo no Excel e selecione o delimitador correto (espaço ou TAB).

## 🧱 Requisitos

* `oc` CLI (ferramenta da OpenShift CLI)
* Permissões para listar namespaces, pods, services e routes no cluster

## 📌 Observações

* A detecção de aplicações é feita com base na label `app`, que deve estar corretamente configurada nos recursos.
* O script trata múltiplos pods, services e rotas por aplicação.


