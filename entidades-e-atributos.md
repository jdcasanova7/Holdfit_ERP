# **Entidades e atributos**

| ENTIDADE | TIPO | PK e FK | ATRIBUTOS |
| ----- | ----- | ----- | ----- |
| **EMPRESA** | Entidade Forte | id\_cnpj (PK) | endereco, nome\_fantasia, horario\_ab , horario\_fc, telefone, email |
| **PESSOA** | Entidade Forte | id\_cpf (PK) | nome, dt\_nasc, endereco, telefone, email, genero |
| **ALUNO** | Entidade Forte | id\_cpf (PK/FK) id\_rgm (PK/FK) | data\_in, data \_f, status\_al |
| **FREQUÊNCIA** | Entidade Fraca | PK composta (id\_cpf \+  | dt\_aula, presenca, hr\_checkin |
| **FUNCIONARIO** | Entidade Forte | id\_cpf (PK/FK) | cargo, salario, funcao, carga\_h, h\_entrada, h\_saida |
| **PROFESSOR** | Entidade Forte | id\_cref (PK) id\_funcionario (FK) | id\_funcionário FK, especialidade |
| **DEPENDENTE** | Entidade Fraca | id\_cpf (FK) | id\_cpf (FK), parentesco |
| **MODALIDADE** | Entidade Forte | id\_modalidade (PK) | nome, duracao, status, programacao |
| **TURMA**  | Entidade Associativa | id\_modalidade (FK) id\_cref (FK) id\_turma (PK) | horario\_i, horario\_f, dia\_semana, local, limitealunos |
| **TURMA\_ALUNO** | Entidade Associativa | id\_turma (FK/PK) id\_rgm (FK/PK) |  |
| **FORNECEDOR** | Entidade Forte | id\_fornecedor (PK) id\_cpf (FK) | tipo\_pessoa, documento  |
| **DEPARTAMENTO** | Entidade Forte | id\_depto (PK) | email, telefone, descricao, hr\_func |
| **DESPESAS** | Entidade Fraca | id\_despesas (PK) | nome, descricao, validade, valor, quantidade |
| **MAQUINARIO** | Entidade Forte | id\_maquinario (PK) | nome, descricao, preco, estoque |
| **CONTA BANCÁRIA** | Entidade Forte | id\_numconta (PK) | saldo, qnt\_pendente, qnt\_pago |
| **CONTA PAGAR** | Entidade Forte | id\_pagamento (PK) | dt\_pagamento, dt\_vencimento, tipo |
| **CONTA RECEBER** | Entidade Forte | id\_recebimento (PK) | dt\_pagamento, dt\_vencimento, tipo |
| **PLANOS** | Entidade Associativa | id\_rgm (FK) id\_modalidade (FK) | dt\_i, dt\_f, valor, nome, descricao, desconto, moda\_acessadas |

# 

