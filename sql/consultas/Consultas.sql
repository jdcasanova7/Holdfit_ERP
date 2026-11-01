-- -------------- SELECT ------------- --
SELECT rgm, cpf, status_al FROM ALUNO where status_al ='A';
SELECT id_pagamento, dt_pagamento, dt_vencimento, tipo, valor FROM CONTAS_PAGAR where status = 'pendente';


-- -------------- JOIN ------------- --
-- Mostra apenas o nome e o cref
SELECT PESSOA.nome, PROFESSOR.id_cref
FROM PROFESSOR
INNER JOIN FUNCIONARIO ON PROFESSOR.id_funcionario = FUNCIONARIO.id_funcionario
INNER JOIN PESSOA ON FUNCIONARIO.cpf = PESSOA.cpf;

-- Mostra o rgm, o status e o nome do aluno
SELECT a.rgm, a.status_al, p.nome
FROM ALUNO AS a
INNER JOIN PESSOA AS p ON a.cpf = p.cpf;

-- Mostra as infos dos professores (id, nome, função, cref e especialidade)
SELECT f.id_funcionario, p.nome AS nome_funcionario, f.funcao, pr.id_cref, pr.especialidade
FROM FUNCIONARIO AS f INNER JOIN PESSOA AS p ON f.cpf = p.cpf
LEFT JOIN PROFESSOR AS pr ON f.id_funcionario = pr.id_funcionario;

-- Mostra as infos dos alunos (rgm, nome, status, id do plano, do contrato e o status dele)
SELECT a.rgm, p.nome AS nome_aluno, a.status_al, c.id_contrato, c.id_plano, c.status AS status_contrato
FROM ALUNO AS a INNER JOIN PESSOA AS p ON a.cpf = p.cpf
LEFT JOIN CONTRATO AS c ON a.rgm = c.rgm;

-- Mostra o id do equipamento, o nome dele, do fornecedor dele e qual serviço este fornecedor presta
SELECT eq.id_equipamento, eq.nome AS nome_equipamento, f.nome_fantasia AS nome_fornecedor, f.servico_prestado
FROM EQUIPAMENTO AS eq RIGHT JOIN FORNECEDOR AS f ON eq.cnpj = f.cnpj;
