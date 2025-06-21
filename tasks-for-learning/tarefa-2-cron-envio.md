
# 🧪 Tarefa 2: Cron + Ação automatizada (mensagem ou log)

**Objetivo:** Agendar uma tarefa que roda automaticamente em um horário definido, como um aviso ou log.

## Etapas:

1. Crie um novo workflow no painel do n8n.
2. Adicione o nó **Cron**:
   - Tipo de repetição: `Every minute` (para testes) ou `Every day` (produção).
   - Você pode configurar hora, dia da semana, etc.
3. Conecte a um nó de ação. Exemplos:
   - **Set** para montar uma mensagem de teste.
   - **Function** para gerar um log.
   - **E-mail**, **Telegram** ou **Discord**, se quiser um alerta real.

### Exemplo com `Set` + `Webhook response`

4. Após o nó Cron, adicione um **Set**:
   - Adicione um campo chamado `mensagem` com valor `"Executado com sucesso!"`.

5. Adicione um nó **Function** (opcional) com o seguinte código para gerar log:
   ```js
   return [{ json: { timestamp: new Date().toISOString(), evento: 'Tarefa Cron executada' } }];
   ```

6. (Opcional) Para ver em tempo real, conecte com um **Webhook Response** e acione manualmente o workflow clicando em “Executar uma vez”.

## ✅ Resultado esperado

A cada execução agendada, será criado um log ou enviada uma mensagem automaticamente.

## 🔄 Extensões possíveis

- Trocar `Set` por nó de envio (e-mail, Discord, Telegram).
- Acionar um script externo via HTTP Request.
- Criar entrada em planilha.

---

Essa tarefa mostra como usar o n8n como **agendador inteligente**, que pode substituir `cron` tradicional com muito mais possibilidades.
