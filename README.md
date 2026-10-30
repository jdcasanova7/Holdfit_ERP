#  Hold Fit — Sistema de Gestão (ERP) para Academia

> **Projeto Integrador — Modelagem de Dados | Entrega Final**
> Disciplina: Banco de Dados — Prof. Clovis Jose Ramos Ferraro
> Grupo 3

Trabalho realizado com fins de estudo e pesquisa. Este repositório reúne a documentação, os modelos, os scripts SQL, a massa de dados, as consultas e as evidências do banco de dados da **Hold Fit Atividades de Condicionamento Físico LTDA**.

---

##  Sumário

1. [Identificação do projeto](#1-identificação-do-projeto)
2. [Integrantes](#2-integrantes)
3. [Empresa e problema](#3-empresa-e-problema)
4. [Solução proposta](#4-solução-proposta)
5. [Requisitos e regras de negócio](#5-requisitos-e-regras-de-negócio)
6. [DER atualizado](#6-der-atualizado)
7. [Modelo lógico](#7-modelo-lógico)
8. [Normalização](#8-normalização)
9. [Dicionário de Dados](#9-dicionário-de-dados)
10. [Implementação SQL](#10-implementação-sql)
11. [Massa de Dados](#11-massa-de-dados)
12. [Consultas Gerenciais](#12-consultas-gerenciais)
13. [Consultas de Auditoria](#13-consultas-de-auditoria)
14. [Potencial para BI e IA](#14-potencial-para-bi-e-ia)
15. [Histórico e evolução do projeto](#15-histórico-e-evolução-do-projeto)
16. [Estrutura do repositório](#16-estrutura-do-repositório)
17. [Como executar o projeto](#17-como-executar-o-projeto)
18. [Conclusão](#18-conclusão)

---

## 1. Identificação do projeto

| Item | Descrição |
| :--- | :--- |
| **Projeto** | Modelagem e implementação do banco de dados da Hold Fit |
| **Empresa** | Hold Fit Atividades de Condicionamento Físico LTDA |
| **Disciplina** | Banco de Dados |
| **Professor** | Clovis Jose Ramos Ferraro |
| **Equipe** | Grupo 3 |
| **Etapa** | Entrega Final (evolução da primeira entrega) |

## 2. Integrantes

| Nome | RGM |
| :--- | :---: |
| Lucas de Oliveira | 50040731 |
| Clara Costa Gonçalves | 50038303 |
| Kaio da Silva Oliveira | 48926086 |
| Vinicius do Nascimento Silva | 49787098 |
| Alefe Richard Silva | 49884816 |
| João Victor de Almeida Ferreira | 049704524 |
| Jesus David Casanova Molano | 49410091 |

A divisão de responsabilidades por parte do trabalho está em [`docs/participacoes.md`](docs/participacoes.md).

## 3. Empresa e problema

A Hold Fit é uma academia de bairro, aberta em 10/02/2023 e sediada na Zona Leste. Seu público principal são adultos de 20 a 40 anos, mas também atende jovens de 16 a 18 anos e idosos que buscam atividades mais leves.

A gestão era antiga e fragmentada: planilhas, documentos espalhados e decisões tomadas apenas pelo diálogo. A empresa decidiu estruturar um sistema para gerenciar alunos, professores, finanças e acesso físico.

**Principais problemas identificados:**

- Cadastro de alunos redundante e descentralizado.
- Preenchimento manual, sem validação de CREF de professores e responsáveis técnicos.
- Dados financeiros (contas a pagar e a receber) dispersos e sem integração.
- Falta de categorização de despesas e fornecedores.
- Ausência de integração entre o financeiro e o controle de acesso, o que impede o bloqueio diário automático (até 23:59) de inadimplentes ou demitidos.
- Impossibilidade de uma mesma pessoa ter múltiplos papéis, como professor que também é aluno.
- Decisões baseadas em processos informais, sem relatórios gerenciais confiáveis (por exemplo, evasão de alunos).

 Detalhes: [`docs/requisitos/empresa-e-problemas.md`](docs/requisitos/empresa-e-problemas.md)

## 4. Solução proposta

Um sistema do tipo **ERP** com banco de dados relacional que:

- **Centraliza o cadastro de pessoas** na entidade `PESSOA`, permitindo múltiplos papéis (aluno, funcionário, professor, dependente).
- **Integra financeiro e controle de acesso**, aplicando as regras de bloqueio e liberação.
- **Valida credenciais técnicas** (CREF) e a figura do Responsável Técnico.
- **Controla contratos, planos e cobranças** sem redundância (`PLANO` + `CONTRATO` + `CONTA_RECEBER`).
- **Registra frequência** dos alunos e **gerencia turmas e modalidades**.
- **Organiza despesas, fornecedores e maquinário**, apoiando a manutenção preventiva.

Os processos de negócio modelados foram:

1. Cadastro e matrícula de aluno
2. Contratação e alocação de funcionário
3. Gestão de turmas e aulas (corpo técnico)
4. Contas a pagar (despesas e maquinário)
5. Contas a receber (mensalidades)

 Detalhes: [`docs/requisitos/processos-de-negocio.md`](docs/requisitos/processos-de-negocio.md)

## 5. Requisitos e regras de negócio

O projeto define **16 requisitos funcionais (RF01–RF16)**, **15 requisitos não funcionais (RNF01–RNF15)** e **14 regras de negócio (RN01–RN14)**.

Alguns destaques:

| Código | Resumo |
| :--- | :--- |
| **RF01** | Cadastro único de pessoas com múltiplos papéis |
| **RF04** | Controle de acesso baseado no status do aluno/funcionário |
| **RF13** | Validação de idade mínima (14 anos) para dependentes |
| **RNF03** | Liberação da catraca em menos de 1 segundo |
| **RNF05 / RNF13** | Chaves estrangeiras com regras explícitas e `NOT NULL` em `FK_Responsavel`, evitando registros órfãos |
| **RN02** | CREF obrigatório (categorias G, P ou AE) para professores |
| **RN05** | Bloqueio de acesso até 23:59 por inadimplência ou demissão |
| **RN07** | Tabela de planos: Mensal R$ 120,00; Trimestral R$ 108,00/mês (10%); Anual R$ 96,00/mês (20%) |
| **RN09** | O cancelamento não afeta o período já pago |
| **RN14** | Um e-mail por usuário, e único no sistema |

O projeto também define **restrições e políticas organizacionais**: controle de acesso e permissões, políticas financeiras, inadimplência e cancelamento, e habilitação profissional (CREF e RT).

 Documentação completa:
- [`docs/requisitos/requisitos-funcionais.md`](docs/requisitos/requisitos-funcionais.md)
- [`docs/requisitos/requisitos-nao-funcionais.md`](docs/requisitos/requisitos-nao-funcionais.md)
- [`docs/requisitos/regras-de-negocio.md`](docs/requisitos/regras-de-negocio.md)
- [`docs/requisitos/restricoes-e-politicas.md`](docs/requisitos/restricoes-e-politicas.md)

## 6. DER atualizado

O DER foi revisado em relação à primeira entrega. Ele descreve as entidades (fortes, fracas e associativas), seus atributos, as chaves e as cardinalidades. Principais entidades: `EMPRESA`, `PESSOA`, `ALUNO`, `FREQUÊNCIA`, `FUNCIONARIO`, `PROFESSOR`, `DEPENDENTE`, `MODALIDADE`, `TURMA`, `TURMA_ALUNO`, `FORNECEDOR`, `DEPARTAMENTO`, `DESPESAS`, `MAQUINARIO`, `CONTA BANCÁRIA`, `CONTA PAGAR`, `CONTA RECEBER` e `PLANOS`.

### Principais correções em relação à primeira entrega

| O que? | Como era | Como ficou | Por que? |
| :--- | :--- | :--- | :--- |
| **Entidade fraca** | Classificação usada em excesso | Fracas: Frequência, Dependente e Despesas | Entidade fraca não se identifica sozinha e exige PK composta com a entidade pai |
| **Frequência** | Sem controle de frequência | Nova entidade fraca `FREQUÊNCIA` | Permite controlar a presença dos alunos matriculados |
| **Modalidades acessadas** | Atributo `char` | Entidade associativa que liga modalidade e plano | A informação passa a ter lugar próprio |
| **Cobrança do plano** | Contas a receber ligadas a aluno e plano, com redundância | `PLANO` + `CONTRATO` + `CONTA_RECEBER` | Evita redundância e melhora o controle de inadimplência |

 Documentação e diagramas:
-  Fluxograma e DER: [`docs/diagramas/`](docs/diagramas/)

## 7. Modelo lógico

O modelo lógico converte o DER em tabelas relacionais, definindo atributos, chaves primárias (inclusive compostas), chaves estrangeiras, tabelas associativas para relacionamentos N:N (como `TURMA_ALUNO` e `CONTRATO`) e restrições de integridade referencial.

 Veja o modelo lógico completo em [`docs/modelo-logico/`](docs/modelo-logico/).
-  Entidades e atributos: [`docs/modelo-logico/entidades-e-atributos.md`](docs/modelo-logico/entidades-e-atributos.md)
-  Relacionamentos e cardinalidades: [`docs/modelo-logico/relacionamentos-e-cardinalidades.md`](docs/modelo-logico/relacionamentos-e-cardinalidades.md)
-  Principais decisões de modelagem (justificativas sobre entidades, PKs, relacionamentos): [`docs/modelagem/principais-decisoes.md`](docs/modelagem/principais-decisoes.md)

## 8. Normalização

A normalização foi documentada com situações reais do projeto, seguindo o formato *estrutura analisada → dependência funcional → problema → correção*.

| Forma normal | Situação analisada | Correção |
| :--- | :--- | :--- |
| **1FN** | O campo `programacao` de `MODALIDADE` guardava vários dias e horários e misturava a característica da turma com a da modalidade | Criação de `TURMA_HORARIO(id_turma, dia_semana, hora_inicio, hora_fim)`, com uma linha por ocorrência |
| **2FN** | `CONTRATACAO` misturava dados do plano com dados do contrato, gerando dependência parcial da chave composta | Separação em `PLANO` e `CONTRATO`. O `valor_mensal_contratado` registra o preço na data da assinatura, que é um fato diferente do preço atual do plano |
| **3FN** | Dependência transitiva em `CONTA_PAGAR`: o fornecedor depende da despesa, não da parcela | `CONTA_PAGAR` aponta apenas para `DESPESA`, e o fornecedor é obtido por ela. O mesmo raciocínio faz `CONTA_RECEBER` apontar só para `CONTRATO` |

 Documentação detalhada: [`docs/normalizacao/`](docs/normalizacao/)

## 9. Dicionário de Dados

O dicionário descreve a estrutura efetivamente implementada. Para cada atributo, registra: tabela, nome, descrição, tipo, tamanho, PK, FK, `NULL`, `UNIQUE`, `DEFAULT` e regra/restrição.

 Consulte: [`docs/dicionario-dados/`](docs/dicionario-dados/)

## 10. Implementação SQL

O script SQL implementa o modelo lógico normalizado e cobre:

`CREATE DATABASE` · `CREATE TABLE` · `PRIMARY KEY` · `FOREIGN KEY` · `NOT NULL` · `UNIQUE` · `CHECK` · `DEFAULT` · `INSERT` · `SELECT` · `JOIN` · `UPDATE` · `DELETE`

As restrições protegem diretamente as regras de negócio. Por exemplo, a unicidade de CPF/RNM e de e-mail (RN01, RN14), a obrigatoriedade da FK do responsável (RNF13) e as regras do CREF (RN02).

| Arquivo / pasta | Conteúdo |
| :--- | :--- |
| [`sql/ddl/`](sql/ddl/) | Criação do banco, tabelas, chaves e restrições |
| [`sql/dados/`](sql/dados/) | Inserção da massa de dados |
| [`sql/consultas/`](sql/consultas/) | Consultas gerenciais e operações `SELECT`, `JOIN`, `UPDATE` e `DELETE` |
| [`sql/auditoria/`](sql/auditoria/) | Consultas de auditoria |

## 11. Massa de Dados

A massa de dados foi construída para ser coerente e permitir testar relacionamentos, restrições, consultas e regras de negócio, incluindo casos de inadimplência, professores que também são alunos, dependentes e contas com inconsistências intencionais para a auditoria.

> Se uma IA foi usada para gerar dados em escala, os registros foram validados quanto a PKs, FKs, constraints e coerência com o negócio (**gerar → testar → validar → corrigir**). Os prompts utilizados estão documentados no repositório.

 Consulte:
- Scripts de inserção: [`sql/dados/`](sql/dados/)
- Prompts de IA e validação: [`docs/massa-de-dados/prompts-ia.md`](docs/massa-de-dados/prompts-ia.md)

## 12. Consultas Gerenciais

As consultas gerenciais respondem a perguntas reais do negócio. Cada uma é documentada como **pergunta do negócio + SQL + informação para decisão**.

 Consulte: [`sql/consultas/`](sql/consultas/) e a explicação em [`docs/consultas/consultas-gerenciais.md`](docs/consultas/consultas-gerenciais.md)

## 13. Consultas de Auditoria

As consultas de auditoria verificam a qualidade e a consistência dos dados.

**Auditoria implementada: conciliação entre `CONTAS_PAGAR` e `PAGAMENTO`.** A consulta compara as duas tabelas, usando `LEFT JOIN` para manter no resultado as contas sem registro de pagamento correspondente. Ela identifica:

- **Status inconsistente:** contas pendentes ou atrasadas que possuem registro em `PAGAMENTO`, ou contas pagas sem esse registro.
- **Data inconsistente:** data de `CONTAS_PAGAR` diferente da data de `PAGAMENTO`.
- **Valor inconsistente:** valores diferentes entre as duas tabelas.
- **Data ausente:** contas pagas sem data de pagamento.

A massa de dados inclui casos concretos para essa auditoria, como contas com status pendente, mas com data de pagamento e registro em `PAGAMENTO`, e contas com data de pagamento sem registro correspondente.

**Limitações conhecidas:** a consulta assume que todo registro em `PAGAMENTO` é um pagamento efetivamente realizado, então pagamentos parciais ou estornos exigiriam ajuste das regras. Além disso, o `CASE` mostra apenas a primeira inconsistência encontrada em cada registro.

 Consulte: [`sql/auditoria/`](sql/auditoria/) e [`docs/consultas/auditoria.md`](docs/consultas/auditoria.md)

## 14. Potencial para BI e IA

###  BI: Painel de monitoramento de inadimplência e controle de acesso

- **Problema:** se o financeiro e o controle de acesso não estiverem sincronizados, um inadimplente pode continuar entrando e um aluno em dia pode ser bloqueado indevidamente.
- **Dados:** matrículas, mensalidades e status de pagamento, registros e tentativas de acesso, datas de pagamento e de alteração de status, histórico de bloqueios e liberações.
- **Análise:** cruzamento de dados financeiros e de acesso para encontrar inconsistências, medir o tempo entre a confirmação do pagamento e a liberação do acesso e contar as entradas negadas por motivo financeiro.
- **Benefício:** identificar falhas de integração e verificar o cumprimento da regra de bloqueio até 23:59.
- **Requisitos relacionados:** RF04, RF05, RF08, RN05 e RN09.

###  IA: Detecção de anomalias em pagamentos e registros financeiros

- **Problema:** lançamentos duplicados, valores divergentes entre cobrança e pagamento e operações atípicas.
- **Dados:** histórico de contas a pagar e a receber, valores e datas, identificadores, estornos e cancelamentos, logs de auditoria.
- **Análise:** um modelo que aprende padrões históricos e sinaliza ocorrências incomuns, como duas mensalidades idênticas para o mesmo aluno e período.
- **Benefício:** conferência mais rápida e dados mais confiáveis. As ocorrências vão para análise humana, **sem excluir ou alterar registros automaticamente**.
- **Requisitos relacionados:** RF05, RF06, RF08, RNF04 e RNF09.

| Critério | BI | IA |
| :--- | :--- | :--- |
| Problema | Falta de visibilidade sobre divergências entre financeiro e acesso | Dificuldade de identificar padrões financeiros anormais |
| Como funciona | Cruza dados existentes e mostra indicadores e inconsistências | Aprende padrões históricos e sinaliza operações suspeitas |
| Resultado | Painel para monitorar falhas e apoiar correções | Alertas para investigação |
| Depende do ERP? | Sim, precisa de registros integrados | Sim, precisa de histórico confiável e dados suficientes |

 Detalhes: [`docs/bi-ia/`](docs/bi-ia/)

## 15. Histórico e evolução do projeto

O histórico de commits do repositório registra a evolução do projeto e a colaboração de todos os integrantes. As correções em relação à primeira entrega estão na [seção 6](#6-der-atualizado), e as evidências colaborativas ficam em [`evidencias/`](evidencias/).

## 16. Estrutura do repositório

```
Hold-Fit-ERP/
│
├── README.md
│
├── docs/
│   ├── requisitos/            # Empresa, processos, RF, RNF, RN e políticas
│   ├── diagramas/             # Fluxograma, DER
│   ├── modelagem/             # Principais decisões de modelagem
│   ├── modelo-logico/         # Modelo lógico relacional, entidades e relacionamentos, etc
│   ├── normalizacao/          # 1FN, 2FN e 3FN documentadas
│   ├── dicionario-dados/      # Dicionário de Dados
│   ├── massa-de-dados/        # Prompts de IA e validação dos dados
│   ├── consultas/             # Explicação das consultas gerenciais e de auditoria
│   ├── bi-ia/                 # Propostas de BI e IA
│   └── participacoes.md       # Divisão de responsabilidades
│
├── sql/
│   ├── ddl/                   # CREATE DATABASE, CREATE TABLE, constraints
│   ├── dados/                 # INSERT (massa de dados)
│   ├── consultas/             # Consultas gerenciais, SELECT, JOIN, UPDATE, DELETE
│   └── auditoria/             # Consultas de auditoria
│
├── evidencias/                # Prints de execução e evidências colaborativas
│
└── apresentacao/              # Material da defesa final
```

## 17. Como executar o projeto

1. Crie um banco vazio no SGBD utilizado.
2. Execute os scripts de [`sql/ddl/`](sql/ddl/) para criar o banco, as tabelas e as restrições.
3. Execute os scripts de [`sql/dados/`](sql/dados/) para inserir a massa de dados.
4. Execute as consultas de [`sql/consultas/`](sql/consultas/) e [`sql/auditoria/`](sql/auditoria/).
5. Confira os resultados com as evidências em [`evidencias/`](evidencias/).

## 18. Conclusão

O projeto da Hold Fit partiu de um problema concreto: uma academia de bairro que operava com planilhas, documentos dispersos e decisões informais, sem integração entre o financeiro, o cadastro de pessoas e o controle de acesso. A partir desse cenário, a equipe percorreu todo o ciclo de modelagem: levantou processos de negócio, problemas e necessidades, formalizou requisitos e regras e construiu o modelo conceitual (DER). Depois o converteu em um modelo lógico relacional normalizado até a 3FN.

A revisão da primeira entrega foi parte essencial do trabalho. A criação da entidade fraca `FREQUÊNCIA`, a substituição do atributo de modalidades por uma entidade associativa e a separação `PLANO` + `CONTRATO` + `CONTA_RECEBER` eliminaram redundâncias e melhoraram o controle de inadimplência. A normalização foi demonstrada com casos reais do projeto, como a decomposição do campo multivalorado de programação, a separação entre plano e contrato (preservando o preço pactuado na data da assinatura) e a eliminação da dependência transitiva entre parcela, despesa e fornecedor.

Do ponto de vista de negócio, o modelo sustenta as regras que mais importam para a academia. Cada pessoa tem um cadastro único com múltiplos papéis. A habilitação técnica é garantida pelo CREF e pelo Responsável Técnico. A política de planos e descontos é aplicada sobre a mensalidade base de R$ 120,00. A responsabilidade financeira dos dependentes recai sobre o responsável, e o acesso é bloqueado até as 23:59 em casos de inadimplência ou demissão.

Por fim, os dados estruturados abrem caminho para a tomada de decisão. O painel de BI de inadimplência e controle de acesso permite verificar se financeiro e catraca estão sincronizados, e a detecção de anomalias por IA pode apoiar a identificação de lançamentos duplicados ou divergentes, sempre com validação humana. A consulta de auditoria entre contas a pagar e pagamentos já demonstra, com casos reais da massa de dados, como o próprio SQL pode proteger a qualidade da informação.

Como evolução futura, o sistema pode ampliar seus indicadores, por exemplo para acompanhar a evasão de alunos, e integrar o painel de BI e os modelos de IA diretamente ao ERP. A Hold Fit passa assim de uma operação baseada em planilhas para uma base de dados integrada, auditável e pronta para apoiar o crescimento do negócio.

---

<p align="center"><i>Grupo 3 — Projeto Integrador de Banco de Dados · Prof. Clovis Jose Ramos Ferraro</i></p>
