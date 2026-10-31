# Primeira Forma Normal (1FN)

> **Projeto:** Hold Fit — Sistema de Gestão (ERP) para Academia
> **Documento:** Normalização · Parte 1 de 3
> **Navegação:** **1FN** · [2FN](2fn.md) · [3FN](3fn.md) · [Voltar ao README](../../README.md)

---

## 1. Contexto

A **Hold Fit** é uma academia de bairro que passou a estruturar um banco de dados relacional para gerenciar alunos, professores, turmas, planos e finanças. Este documento mostra como o modelo foi verificado e corrigido para atender à **Primeira Forma Normal (1FN)**, partindo das tabelas definidas no modelo lógico.

## 2. Definição

Uma tabela está na **1FN** quando todos os seus atributos são **atômicos**: cada campo armazena **um único valor**, e não existem listas dentro de uma célula nem grupos repetitivos.

> **Regra prática:** um campo → um valor.

## 3. Critérios de verificação

Para cada tabela do modelo foram feitas as seguintes perguntas:

1. Algum campo contém uma lista de valores (separados por vírgula, ponto e vírgula, barra etc.)?
2. Existem colunas repetidas, como `telefone1`, `telefone2`, `telefone3`?
3. Algum atributo tenta armazenar várias ocorrências de um mesmo tipo de informação?

---

## 4. Análise 1 — Horários das modalidades (violação encontrada)

### Estrutura analisada (antes)

```
MODALIDADE (id_modalidade, nome, duracao, status, programacao)
```

Exemplo de dado armazenado:

```
programacao = 'Seg e Qua 18h - 19h; Sex 7h - 8h'
```

### Dependências funcionais

| Dependência | Situação |
| :--- | :--- |
| `id_modalidade → nome, duracao, status` | Adequada |
| `programacao` | Contém várias ocorrências de `(dia da semana, hora de início, hora de fim)` |

### Problemas identificados

1. **Campo multivalorado e grupo repetitivo.** Um único campo guarda três horários distintos.
2. **Consultas inviáveis.** Não é possível filtrar "todas as aulas de quarta-feira" nem calcular a ocupação por horário sem interpretar texto.
3. **Atributo na entidade errada.** O horário é característica da **turma** (grupo concreto, com professor e horário), e não da modalidade. Uma mesma modalidade pode ter várias turmas em horários diferentes.

### Correção aplicada (depois)

Criou-se uma tabela com **uma linha por ocorrência** e removeu-se `programacao` de `MODALIDADE`:

```
MODALIDADE    (id_modalidade, nome, duracao, status)

TURMA_HORARIO (id_turma, dia_semana, hora_inicio, hora_fim)
  PK: (id_turma, dia_semana, hora_inicio)
  FK: id_turma → TURMA.id_turma
```

### Restrições associadas

| Restrição | Justificativa |
| :--- | :--- |
| `CHECK (dia_semana IN ('Seg','Ter','Qua','Qui','Sex','Sab','Dom'))` | Impede valores inválidos no dia da semana |
| `CHECK (hora_fim > hora_inicio)` | Garante que o intervalo seja coerente |
| PK composta `(id_turma, dia_semana, hora_inicio)` | Uma turma pode ter vários horários, mas nunca dois idênticos |

### Resultado

Cada campo guarda um único valor. O horário de uma turma passa a ser consultado diretamente, por exemplo com `WHERE dia_semana = 'Qua'`.

---

## 5. Análise 2 — Contatos da pessoa (verificação preventiva)

### Estrutura analisada

```
PESSOA (id_cpf, nome, dt_nasc, endereco, telefone, email, genero)
```

### Verificação

- `telefone` guarda **um único número principal**.
- `email` guarda **um único endereço**. Isso é exigido pela regra de negócio **RN14** (um usuário não pode ter mais de um e-mail, e o e-mail é único no sistema).

A tabela **está na 1FN**, desde que o campo `telefone` receba apenas um número. Se a academia precisar registrar vários telefones (por exemplo, celular e contato de emergência), a solução correta **não** é gravar `'9999-1111, 9888-2222'` no mesmo campo, e sim criar uma tabela própria:

```
TELEFONE_PESSOA (id_cpf, numero, tipo)
  PK: (id_cpf, numero)
  FK: id_cpf → PESSOA.id_cpf
```

> **Decisão de projeto:** nesta versão o modelo mantém um único telefone por pessoa. A tabela acima fica registrada como evolução possível, caso surja a necessidade.

---

## 6. Análise 3 — Endereço (decisão de projeto)

Os campos `endereco` de `EMPRESA` e `PESSOA` armazenam o endereço completo em um único atributo. Isso **não viola a 1FN**, pois o endereço é tratado como um único dado lógico. No entanto, se no futuro forem necessários filtros por cidade, bairro ou CEP, recomenda-se separá-lo em atributos distintos. Não houve correção obrigatória.

---

## 7. Resumo

| Tabela analisada | Problema | Resultado |
| :--- | :--- | :--- |
| `MODALIDADE` | Campo `programacao` multivalorado | Corrigido com a tabela `TURMA_HORARIO` |
| `PESSOA` | Possível lista de telefones | Em conformidade (um telefone por pessoa) |
| `EMPRESA` / `PESSOA` (endereço) | Atributo composto | Mantido como decisão de projeto |

Após as correções, **todas as tabelas do modelo atendem à 1FN**. A normalização continua em [2FN](2fn.md).
