# O que faz o arquivo Auditoria.sql?

Esse arquivo traz as consultas de auditoria do banco da Hold Fit. A ideia aqui não é puxar relatórios normais do dia a dia, mas sim **encontrar erros, dados soltos ou furos no sistema** antes que eles virem um problema de verdade.

---

## 1. Auditoria de Contas a Pagar vs. Pagamentos Efetivos

### O que essa consulta faz?
Ela bate a tabela de contas a pagar (`CONTAS_PAGAR`) com a tabela onde ficam registrados os pagamentos que saíram da conta bancária (`PAGAMENTO`). Para facilitar a leitura, ela usa um `CASE` que já escreve na tela exatamente qual é o erro encontrado.

### Quais problemas ela pega?
* **Conta marcada como paga sem registro:** A conta tá com status de 'Pago', mas não existe nenhum comprovante registrado na tabela de pagamentos.
* **Pagamento feito com status pendente:** O dinheiro já saiu e tá registrado em `PAGAMENTO`, mas a conta continua marcada como 'Pendente' ou 'Atrasado'.
* **Falta de data:** A conta tá como 'Pago', mas esqueceram de preencher a data em que o pagamento foi feito.
* **Valores diferentes:** O valor que estava na conta a pagar não bate com o valor real que foi pago no banco.
* **Datas diferentes:** A data informada na conta a pagar tá diferente da data real do comprovante de pagamento.

---

## 2. Auditoria de Alunos Activos Sem Contrato Vigente

### O que essa consulta faz?
Ela cruza o cadastro dos alunos (`ALUNO`) com a tabela de contratos (`CONTRATO`). 

### Qual regra ela testa?
Pelas regras da academia, qualquer aluno com status ativo ('A') **precisa ter um contrato ativo** e dentro do prazo de validade (entre a data de início `dt_i` e a data de fim `dt_f`).

### Para que serve na prática?
Essa busca serve para pegar alunos que estão frequentando a academia ou passando na catraca, mas que estão com o contrato vencido ou sem nenhuma assinatura ativa no financeiro.