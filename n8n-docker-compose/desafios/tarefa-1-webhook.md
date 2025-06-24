
# 🧪 Tarefa 1: Webhook + Mensagem de resposta

**Objetivo:** Criar um endpoint HTTP que recebe requisições e responde algo.

## Etapas:

1. Criar um novo workflow no painel do n8n.
2. Adicionar o nó **Webhook**:
   - HTTP Método: `GET`
   - Path: `/test`
   - Authentication #ignora
   - Respond: `Respond to webhook`
3. Adicionar o nó **Respond to Webhook**.
4. Conectar o Webhook ao Respond.
5. No Respond, seleciona "Respond with JSON" e configure o corpo da resposta como:

```json
{
  "mensagem": "Recebido com sucesso!"
}
```

6. Salve e ative o workflow e depois execute o workflow, **(lembre de ativar a licença se nao, nao ira funcionar)**.
7. Teste com curl ou navegador:

```bash
curl http://localhost:5678/webhook-test/test  #se atebtar pra url que aparecer no primeiro nó
```

## ✅ Resultado esperado

Resposta:

```json
{
  "mensagem": "Recebido com sucesso!"
}
```

---

Essa tarefa é útil para testar se o ambiente está operacional e serve como base para fluxos mais avançados (formulários, automações, notificações, etc).
