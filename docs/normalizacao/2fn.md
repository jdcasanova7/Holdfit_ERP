# Segunda Forma Normal (2FN)

> **Projeto:** Hold Fit — Sistema de Gestão (ERP) para Academia
> **Documento:** Normalização · Parte 2 de 3
> **Navegação:** [1FN](1fn.md) · **2FN** · [3FN](3fn.md) · [Voltar ao README](../../README.md)

---

## 1. Contexto

Este documento dá continuidade à normalização do banco de dados da **Hold Fit**, uma academia de bairro que está substituindo planilhas e controles informais por um sistema relacional. Aqui se verifica e se corrige o modelo para atender à **Segunda Forma Normal (2FN)**, partindo de tabelas que já estão na [1FN](1fn.md).

## 2. Definição

Uma tabela está na **2FN** quando:

1. já está na 1FN; e
2. **todo atributo não chave depende da chave primária completa**, e não apenas de uma parte dela.

A 2FN só é relevante em tabelas com **chave primária composta**. Em tabelas com PK simples, a condição é atendida automaticamente.

> **Pergunta-chave:** o atributo depende da chave **toda**?

## 3. Critérios de verificação

Para cada tabela do modelo foram feitas as seguintes perguntas:

1. A PK é composta?
2. Em caso afirmativo, cada atributo não chave depende da PK inteira ou somente de uma parte dela?

---

## 4. Análise 1 — Contratação de planos (violação encontrada)

### Estrutura analisada (antes)

Em uma versão preliminar, os dados do plano e os da contratação estavam misturados:

```
CONTRATACAO (rgm, id_plano, dt_i, nome_plano, valor, duracao_meses, desconto, dt_f)
  PK: (rgm, id_plano, dt_i)
```

### Dependências funcionais

| Dependência | Tipo |
| :--- | :--- |
| `id_plano → nome_plano, valor, duracao_meses` | **Parcial** (depende só de parte da chave) |
| `(rgm, id_plano, dt_i) → desconto, dt_f` | Total (depende da chave inteira) |

### Problema identificado

**Dependência parcial.** Os dados do plano (nome, valor, duração) seriam repetidos para cada aluno que o contrata. Alterar o nome ou o preço de um plano exigiria atualizar várias linhas, com risco de deixar valores diferentes para o mesmo plano.

### Correção aplicada (depois)

Separaram-se dois fatos distintos: **o que é o plano** e **o fato de um aluno ter contratado esse plano**.

```
PLANO (id_plano, nome, duracao_meses, valor_mensal)
  PK: id_plano

CONTRATO (id_contrato, id_aluno, id_plano, dt_inicio, dt_fim,
          valor_mensal_contratado, desconto_pct)
  PK: id_contrato
  FK: id_aluno → ALUNO
  FK: id_plano → PLANO.id_plano
```

- `PLANO` descreve o produto oferecido pela academia.
- `CONTRATO` registra a adesão de um aluno a um plano. Sua PK é simples (`id_contrato`), portanto não há mais risco de dependência parcial.

### Justificativa: `valor_mensal_contratado` não é redundância

O campo `CONTRATO.valor_mensal_contratado` guarda o **preço vigente na data da assinatura**, enquanto `PLANO.valor_mensal` guarda o **preço atual**. São fatos diferentes: se o plano ficar mais caro, os contratos antigos devem manter o valor pactuado.

### Onde fica o desconto

O desconto fica em `CONTRATO` (`desconto_pct`), pois depende da modalidade de pagamento escolhida na contratação (mensal, trimestral ou anual), conforme a regra **RN07**:

| Plano | Valor por mês | Desconto |
| :--- | :--- | :--- |
| Mensal (1 mês) | R$ 120,00 | 0% |
| Trimestral (3 meses) | R$ 108,00 | 10% |
| Anual (12 meses) | R$ 96,00 | 20% |

> **Atenção:** a Segunda Entrega apresentava `desconto` dentro da entidade `PLANOS`. A decisão de mantê-lo em `CONTRATO` deve ser refletida no DER e no dicionário de dados.

---

## 5. Análise 2 — Frequência (violação encontrada)

### Estrutura analisada (antes)

```
FREQUENCIA (id_cpf, id_rgm, dt_aula, presenca, hr_checkin)
  PK: (id_cpf, id_rgm, dt_aula)
```

### Dependências funcionais

| Dependência | Tipo |
| :--- | :--- |
| `id_rgm → id_cpf` | **Parcial** (o RGM já identifica a pessoa) |
| `(id_cpf, id_rgm, dt_aula) → presenca, hr_checkin` | Total |

### Problemas identificados

1. `id_cpf` é redundante, pois `id_rgm` já determina a pessoa.
2. A chave não identifica **qual aula** foi frequentada. Um aluno pode assistir a várias turmas no mesmo dia.

### Correção aplicada (depois)

```
FREQUENCIA (id_rgm, id_turma, dt_aula, presenca, hr_checkin)
  PK: (id_rgm, id_turma, dt_aula)
  FK: id_rgm   → ALUNO.id_rgm
  FK: id_turma → TURMA.id_turma
```

`FREQUENCIA` é uma **entidade fraca**: depende do aluno e da turma para existir e ser identificada. Por isso sua PK é composta, e agora todos os atributos não chave dependem da chave inteira.

---

## 6. Análise 3 — Matrícula em turmas (verificação)

```
TURMA_ALUNO (id_turma, id_rgm)
  PK: (id_turma, id_rgm)
  FK: id_turma → TURMA.id_turma
  FK: id_rgm   → ALUNO.id_rgm
```

A tabela tem PK composta e **nenhum atributo não chave**. Portanto, não há como existir dependência parcial, e ela já atende à 2FN. Foi documentada para mostrar que a verificação foi feita em todas as tabelas com chave composta.

---

## 7. Resumo

| Tabela analisada | Problema | Resultado |
| :--- | :--- | :--- |
| `CONTRATACAO` | Dados do plano dependiam de parte da chave | Separada em `PLANO` e `CONTRATO` |
| `FREQUENCIA` | `id_cpf` dependia de `id_rgm`; faltava a turma na chave | PK passou a ser `(id_rgm, id_turma, dt_aula)` |
| `TURMA_ALUNO` | Nenhum | Já em conformidade |

Após as correções, **todas as tabelas atendem à 2FN**. A normalização continua em [3FN](3fn.md).
