# Terceira Forma Normal (3FN)

> **Projeto:** Hold Fit — Sistema de Gestão (ERP) para Academia
> **Documento:** Normalização · Parte 3 de 3
> **Navegação:** [1FN](1fn.md) · [2FN](2fn.md) · **3FN** · [Voltar ao README](../../README.md)

---

## 1. Contexto

Este é o último documento da normalização do banco de dados da **Hold Fit**, uma academia de bairro que está substituindo planilhas e controles informais por um sistema relacional. Aqui se verifica e se corrige o modelo para atender à **Terceira Forma Normal (3FN)**, partindo de tabelas que já estão na [2FN](2fn.md).

## 2. Definição

Uma tabela está na **3FN** quando:

1. já está na 2FN; e
2. **não existem dependências transitivas**: nenhum atributo não chave depende de outro atributo não chave.

> **Pergunta-chave:** o atributo depende **diretamente da chave** ou depende de outro atributo?

## 3. Critérios de verificação

Para cada tabela foram feitas as seguintes perguntas:

1. Existe algum atributo não chave que determine outro atributo não chave?
2. Algum dado sobre uma entidade relacionada está sendo guardado na tabela errada?

---

## 4. Análise 1 — Contas a pagar e fornecedores (violação encontrada)

### Estrutura analisada (antes)

```
CONTA_PAGAR (id_pagamento, id_despesa, id_fornecedor, num_parcela,
             dt_vencimento, dt_pagamento, valor, tipo)
  PK: id_pagamento
```

### Dependências funcionais

| Dependência | Tipo |
| :--- | :--- |
| `id_pagamento → id_despesa, num_parcela, dt_vencimento, dt_pagamento, valor, tipo` | Direta |
| `id_despesa → id_fornecedor` | A despesa possui um único fornecedor |
| `id_pagamento → id_despesa → id_fornecedor` | **Transitiva** |

### Problema identificado

O fornecedor depende da **despesa**, e não da parcela. Se `id_fornecedor` for armazenado em `CONTA_PAGAR`, nada impede que a parcela aponte para um fornecedor e a despesa para outro, gerando dados contraditórios.

### Correção aplicada (depois)

```
CONTA_PAGAR (id_conta_pagar, id_despesa, num_parcela,
             dt_vencimento, dt_pagamento, valor, tipo)
  PK: id_conta_pagar
  FK: id_despesa → DESPESAS.id_despesas
```

O fornecedor passa a ser obtido **somente por meio da despesa**, que é o único lugar onde essa informação é guardada. O mesmo raciocínio vale para o maquinário, que se relaciona ao fornecedor por sua própria tabela.

### Como consultar o fornecedor após a correção

```sql
SELECT cp.id_conta_pagar, cp.valor, d.id_fornecedor
FROM CONTA_PAGAR cp
JOIN DESPESAS d ON d.id_despesas = cp.id_despesa;
```

---

## 5. Análise 2 — Contas a receber e contratos (violação encontrada)

### Estrutura analisada (antes)

```
CONTA_RECEBER (id_recebimento, id_contrato, rgm, id_plano,
               dt_vencimento, dt_pagamento, valor, tipo)
  PK: id_recebimento
```

### Dependências funcionais

| Dependência | Tipo |
| :--- | :--- |
| `id_recebimento → id_contrato` | Direta |
| `id_contrato → rgm, id_plano` | O contrato já define o aluno e o plano |
| `id_recebimento → id_contrato → rgm, id_plano` | **Transitiva** |

### Problema identificado

Se `rgm` e `id_plano` forem guardados em `CONTA_RECEBER`, podem contradizer o contrato que originou a cobrança. Era exatamente a redundância apontada na primeira entrega, quando contas a receber estavam ligadas diretamente a aluno e plano.

### Correção aplicada (depois)

```
CONTA_RECEBER (id_recebimento, id_contrato, dt_vencimento,
               dt_pagamento, valor, tipo)
  PK: id_recebimento
  FK: id_contrato → CONTRATO.id_contrato
```

Aluno e plano são consultados por meio de `CONTRATO`. Isso também facilita o controle de inadimplência: basta cruzar `CONTA_RECEBER` com `CONTRATO` para saber quem deve o quê.

---

## 6. Análise 3 — Pagamento (verificação)

A tabela `PAGAMENTO` é usada na consulta de auditoria (conciliação com `CONTA_PAGAR`). Para estar na 3FN, ela deve guardar apenas **dados do pagamento em si** (data, valor, meio), referenciando a conta por chave estrangeira, **sem repetir** dados da conta, como fornecedor ou vencimento. Caso repetisse, aplicar-se-ia a mesma correção das análises anteriores.

> **Pendência:** a estrutura completa de `PAGAMENTO` precisa constar no DER e no dicionário de dados, e sua 3FN deve ser confirmada ali.

---

## 7. Resumo

| Tabela analisada | Dependência transitiva | Correção |
| :--- | :--- | :--- |
| `CONTA_PAGAR` | `id_pagamento → id_despesa → id_fornecedor` | Remoção de `id_fornecedor`; acesso via `DESPESAS` |
| `CONTA_RECEBER` | `id_recebimento → id_contrato → rgm, id_plano` | Remoção de `rgm` e `id_plano`; acesso via `CONTRATO` |
| `PAGAMENTO` | Nenhuma identificada | A confirmar com a estrutura final |

---

## 8. Conclusão da normalização

| Forma normal | Critério | Principal correção |
| :--- | :--- | :--- |
| [1FN](1fn.md) | Atributos atômicos | `programacao` → `TURMA_HORARIO` |
| [2FN](2fn.md) | Sem dependência parcial | `CONTRATACAO` → `PLANO` + `CONTRATO`; PK de `FREQUENCIA` |
| 3FN | Sem dependência transitiva | `CONTA_PAGAR` e `CONTA_RECEBER` apontam só para `DESPESAS` e `CONTRATO` |

Cada decisão partiu de um problema real do modelo, e não de um exemplo artificial. O resultado é um banco sem redundâncias que possam gerar dados contraditórios, com o histórico financeiro protegido (como o preço pactuado em `CONTRATO`) e com a base consistente para as consultas gerenciais e de auditoria.
