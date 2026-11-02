# O que faz o arquivo Consultas.sql?

Esse arquivo junta as principais consultas (`SELECT`) que a gente usa no dia a dia da academia Hold Fit. Ele foi dividido em duas partes: buscas diretas simples e consultas mais completas cruzando tabelas (`JOIN`).

---

## 1. Consultas Simples (Filtros Diretos)

* **Alunos Ativos:**  
  `SELECT rgm, cpf, status_al FROM ALUNO WHERE status_al = 'A';`  
  *Servidão:* Puxa rapidamente só os alunos que estão com a matrícula ativa no sistema.

* **Contas Pendentes:**  
  `SELECT id_pagamento, dt_pagamento, dt_vencimento, tipo, valor FROM CONTAS_PAGAR WHERE status = 'pendente';`  
  *Servidão:* Mostra para o financeiro tudo o que a academia tem para pagar e que ainda está em aberto.

---

## 2. Consultas Cruzadas (JOINs)

* **Lista de Professores e CREF:**  
  Cruza as tabelas `PROFESSOR`, `FUNCIONARIO` e `PESSOA`. Serve para ver o nome completo do professor junto com o número do registro profissional dele (CREF).

* **Nome do Aluno pelo RGM:**  
  Cruza `ALUNO` com `PESSOA`. Serve para identificar quem é o aluno de verdade, associando o número de matrícula (`RGM`) ao nome da pessoa.

* **Ficha dos Funcionários:**  
  Cruza `FUNCIONARIO`, `PESSOA` e `PROFESSOR` (usando `LEFT JOIN`). Mostra todos os funcionários da academia. Se a pessoa for instrutor, traz a especialidade e o CREF; se for recepcionista ou gerente, deixa esses campos em branco sem sumir com o cadastro.

* **Contratos dos Alunos:**  
  Cruza `ALUNO`, `PESSOA` e `CONTRATO`. Serve para consultar o histórico do aluno, vendo qual plano ele contratou e se o contrato dele está ativo ou encerrado.

* **Equipamentos e Fornecedores:**  
  Cruza `EQUIPAMENTO` com `FORNECEDOR` (usando `RIGHT JOIN`). Mostra quais aparelhos pertencem a cada empresa parceira. Como usa `RIGHT JOIN`, também lista fornecedores que não vendem máquinas, mas prestam serviços (como água, luz ou internet).