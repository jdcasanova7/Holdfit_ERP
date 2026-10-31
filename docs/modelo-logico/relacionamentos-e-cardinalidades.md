# **Relacionamentos e Cardinalidades**

| ENTIDADE | RELACIONAMENTO | ENTIDADE | CARDINALIDADE |
| :---- | :---- | :---- | :---- |
| EMPRESA | **POSSUI** | CONTAS | **1:N** |
| EMPRESA | **CADASTRA** | PESSOA | **1:N** |
| CONTAS | **GERA** | CONTAS A PAGAR | **1:N** |
| CONTAS | **PRODUZ** | CONTAS A RECEBER | **1:N** |
| CONTAS A PAGAR | **PAGA** | PAGAMENTO | **N:N** |
| CONTAS A RECEBER | **RECEBE** | PAGAMENTO | **N:N** |
| ALUNO | **REALIZA** | PAGAMENTO | **1:N** |
| PAGAMENTO | **COBRE** | DESPESAS | **1:N** |
| PAGAMENTO | **ADQUIRE** | MAQUINARIO | **1:N** |
| PESSOA | **É** | ALUNO | **1:1** |
| PESSOA | **TORNA** | RESPONSÁVEL | **1:1** |
| PESSOA | **VIRA** | DEPENDENTE | **1:N** |
| ALUNO | **TEM** | RESPONSÁVEL | **1:1** |
| ALUNO | **PARTICIPA (Se torna PLANO)** | MODALIDADE | **N:N** |
| FUNCIONARIO | **TRABALHA** | PROFESSOR | **1:1** |
| FUNCIONÁRIO | **DETÉM** | DEPENDENTE | **1:N** |
| FUNCIONÁRIO | **PERTENCE** | DEPARTAMENTO | **1:N** |
| PROFESSOR | **LECIONA (Se torna TURMA)** | ALUNO | **N:N** |
| PESSOA | **É** | DEPENDENTE | **0:N** |
| DEPENDENTE | **CONTÉM** | RESPONSÁVEL | **1:N** |
| DEPENDENTE | **É** | ALUNO | **1:1** |

# 

