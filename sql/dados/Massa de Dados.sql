-- -------------- Massa de Dados --------------- --
-- EMPRESA
INSERT INTO EMPRESA (cnpj, endereco, nome_fantasia, horario_ab, horario_fc, telefone, email) VALUES
  ('12.123.456/0001-12', 'Rua exemplo, bairro exemplo', 'holdfit', '06:00:00', '22:00:00', '11 91234-1234', 'atendimento@holdfit.com.br');

-- PESSOA 
INSERT INTO PESSOA (cpf, nome, endereco, telefone, email, genero, dt_nasci) VALUES
  ('111.222.333-01', 'Mariana Alves Costa', 'Rua das Flores, Pinheiros, n° 210', '(11) 98111-0001', 'mariana.costa@email.com', 'Feminino', '1998-03-14'),
  ('111.222.333-02', 'Rafael Lima Santos', 'Rua Augusta, Consolação, n° 1022', '(11) 98111-0002', 'rafael.santos@email.com', 'Masculino', '1995-07-22'),
  ('111.222.333-03', 'Juliana Pereira Rocha', 'Rua Haddock Lobo, Cerqueira César, n° 45', '(11) 98111-0003', 'juliana.rocha@email.com', 'Feminino', '2001-11-05'),
  ('111.222.333-04', 'Bruno Henrique Dias', 'Al. Santos, Jardim Paulista, n° 870', '(11) 98111-0004', 'bruno.dias@email.com', 'Masculino', '1989-01-30'),
  ('111.222.333-05', 'Camila Fernandes', 'Rua Teodoro Sampaio, Pinheiros, n° 330', '(11) 98111-0005', 'camila.fernandes@email.com', 'Feminino', '1993-09-18'),
  ('111.222.333-06', 'Lucas Martins Oliveira', 'Rua Bela Cintra, Consolação, n° 512', '(11) 98111-0006', 'lucas.oliveira@email.com', 'Masculino', '2003-04-12'),
  ('111.222.333-07', 'Patrícia Gomes Nunes', 'Rua Frei Caneca, Bela Vista, n° 76', '(11) 98111-0007', 'patricia.nunes@email.com', 'Feminino',  '1985-12-02'),
  ('111.222.333-08', 'Thiago Barbosa', 'Rua Cardeal Arcoverde, Pinheiros, n° 901', '(11) 98111-0008', 'thiago.barbosa@email.com', 'Masculino', '1997-06-27'),
  ('111.222.333-09', 'Fernanda Ribeiro Melo', 'Rua Oscar Freire, Jardins, n° 154', '(11) 98111-0009', 'fernanda.melo@email.com', 'Feminino',  '2000-02-09'),
  ('111.222.333-10', 'Gustavo Carvalho', 'Rua Vergueiro, Paraíso, n° 2300', '(11) 98111-0010', 'gustavo.carvalho@email.com', 'Masculino', '1991-10-15'),
  ('111.222.333-11', 'Beatriz Gomes Nunes', 'Rua Frei Caneca, Bela Vista, n° 76', '(11) 98111-0011', 'beatriz.nunes@email.com', 'Feminino', '2009-05-21'),
  ('111.222.333-12', 'Pedro Henrique Dias', 'Al. Santos, Jardim Paulista, n° 870', '(11) 98111-0012', 'pedro.dias@email.com', 'Masculino', '2010-08-03'),
  ('111.222.333-13', 'Larissa Teixeira', 'Rua Mourato Coelho, Vila Madalena, n° 88', '(11) 98111-0013', 'larissa.teixeira@email.com', 'Feminino', '1999-03-28'),
  ('111.222.333-14', 'Diego Cardoso', 'Rua Pamplona, Jardim Paulista, n° 640', '(11) 98111-0014', 'diego.cardoso@email.com', 'Masculino', '1987-07-07'),
  ('111.222.333-15', 'Aline Correia Pinto', 'Rua Joaquim Floriano, Itaim Bibi, n° 300', '(11) 98111-0015', 'aline.pinto@email.com', 'Feminino', '2002-12-19'),
  ('222.333.444-01', 'Ricardo Souza Mendes', 'Rua Tutóia, Paraíso, n° 120', '(11) 98222-0001', 'ricardo.mendes@holdfit.com.br', 'Masculino', '1982-04-10'),
  ('222.333.444-02', 'Vanessa Lopes', 'Rua Apinajés, Perdizes, n° 455', '(11) 98222-0002', 'vanessa.lopes@holdfit.com.br', 'Feminino', '1990-06-14'),
  ('222.333.444-03', 'André Luiz Freitas', 'Rua Cayowaá, Perdizes, n° 1010', '(11) 98222-0003', 'andre.freitas@holdfit.com.br', 'Masculino', '1988-09-01'),
  ('222.333.444-04', 'Tatiane Ramos', 'Rua Harmonia, Vila Madalena, n° 230', '(11) 98222-0004', 'tatiane.ramos@holdfit.com.br', 'Feminino',  '1992-01-25'),
  ('222.333.444-05', 'Felipe Nascimento', 'Rua Turiassu, Perdizes, n° 780', '(11) 98222-0005', 'felipe.nascimento@holdfit.com.br','Masculino','1994-11-11'),
  ('222.333.444-06', 'Carla Monteiro', 'Rua Domingos de Morais, Vila Mariana, n° 1500', '(11) 98222-0006', 'carla.monteiro@holdfit.com.br', 'Feminino', '1996-03-03'),
  ('222.333.444-07', 'Renata Vieira', 'Rua Afonso Celso, Vila Mariana, n° 610', '(11) 98222-0007', 'renata.vieira@holdfit.com.br', 'Feminino', '1986-08-20'),
  ('222.333.444-08', 'Marcos Antônio Silva', 'Rua Sena Madureira, Vila Mariana, n° 95', '(11) 98222-0008', 'marcos.silva@holdfit.com.br', 'Masculino', '1984-02-17'),
  ('222.333.444-09', 'Jéssica Prado', 'Rua Machado Bittencourt, Vila Clementino, n° 44', '(11) 98222-0009', 'jessica.prado@email.com', 'Feminino', '1997-05-30'),
  ('333.444.555-01', 'Sofia Lopes Andrade', 'Rua Apinajés, Perdizes, n° 455', NULL, NULL, 'Feminino',  '2015-04-04');
 
 
-- ALUNO 
-- status_al: A = ativo / I = inativo
INSERT INTO ALUNO (rgm, cpf, cod_matricula, data_in, data_f, status_al) VALUES
  (1, '111.222.333-01', '2025-0001', '2025-12-15', NULL, 'A'),
  (2, '111.222.333-02', '2026-0001', '2026-01-20', NULL, 'A'),
  (3, '111.222.333-03', '2026-0002', '2026-02-03', NULL, 'A'),
  (4, '111.222.333-04', '2026-0003', '2026-02-10', NULL, 'A'),
  (5, '111.222.333-05', '2026-0004', '2026-03-02', NULL, 'A'),
  (6, '111.222.333-06', '2026-0005', '2026-03-12', NULL, 'A'),
  (7, '111.222.333-07', '2026-0006', '2026-04-07', NULL, 'A'),
  (8, '111.222.333-08', '2026-0007', '2026-04-22', NULL, 'A'),
  (9, '111.222.333-09', '2026-0008', '2026-05-05', NULL, 'A'),
  (10,'111.222.333-10', '2026-0009', '2026-06-02', NULL, 'A'),
  (11, '111.222.333-11', '2026-0010', '2026-06-02', NULL, 'A'),
  (12, '111.222.333-12', '2026-0011', '2026-07-01', NULL, 'A'),
  (13, '111.222.333-13', '2026-0012', '2026-08-11', NULL, 'A'),
  (14, '111.222.333-14', '2026-0013', '2026-01-08', '2026-07-31', 'I'),
  (15, '111.222.333-15', '2026-0014', '2026-09-15', NULL, 'A');
 
 
-- DEPARTAMENTO
INSERT INTO DEPARTAMENTO (id_depto, nome_dp, email, telefone, descricao, hr_i, hr_f) VALUES
  (1, 'Instrução',  'instrucao@holdfit.com.br', '(11) 3456-7891', 'Responsável por ministrar aulas e orientar alunos.', 6, 23),
  (2, 'Recepção',  'recepcao@holdfit.com.br', '(11) 3456-7890', 'Responsável pelo atendimento e cadastros.',          6, 23),
  (3, 'Administração', 'administracao@holdfit.com.br', '(11) 3456-7892', 'Responsável pela gestão da academia.',               8, 17),
  (4, 'Nutrição', 'nutricao@holdfit.com.br', '(11) 3456-7893', 'Responsável pela orientação nutricional.',           13, 17),
  (5, 'Fisioterapia', 'fisioterapia@holdfit.com.br', '(11) 3456-7894', 'Responsável por avaliação e reabilitação.',          8, 12);
 
 
-- FUNCIONARIO
INSERT INTO FUNCIONARIO (id_funcionario, cpf, id_depto, salario, funcao, carga_h, h_entrada, h_saida, data_admissao, data_demissao) VALUES
  (1, '222.333.444-01', 3, 6500.00, 'Gerente', 44.00, '08:00:00', '17:00:00', '2022-02-01', NULL),
  (2, '222.333.444-02', 1, 3200.00, 'Instrutor', 40.00, '06:00:00', '15:00:00', '2022-03-15', NULL),
  (3, '222.333.444-03', 1, 3400.00, 'Instrutor', 40.00, '14:00:00', '23:00:00', '2022-06-01', NULL),
  (4, '222.333.444-04', 1, 3100.00, 'Instrutor', 30.00, '07:00:00', '13:00:00', '2023-01-09', NULL),
  (5, '222.333.444-05', 1, 2900.00, 'Instrutor', 30.00, '16:00:00', '22:00:00', '2023-08-14', NULL),
  (6, '222.333.444-06', 2, 2100.00, 'Recepcionista', 44.00, '06:00:00', '15:00:00', '2024-02-05', NULL),
  (7, '222.333.444-07', 4, 4200.00, 'Nutricionista', 20.00, '13:00:00', '17:00:00', '2023-05-02', NULL),
  (8, '222.333.444-08', 5, 4500.00, 'Fisioterapeuta', 20.00, '08:00:00', '12:00:00', '2023-05-02', NULL),
  (9, '222.333.444-09', 2, 2000.00, 'Recepcionista', 44.00, '14:00:00', '23:00:00', '2024-03-01', '2025-12-20');
 
 
-- CARGO
INSERT INTO CARGO (id_cargo, nome_cargo, descricao_cargo) VALUES
  (1, 'Instrutor', 'Responsável por ministrar aulas e orientar alunos.'),
  (2, 'Recepcionista', 'Responsável pelo atendimento e cadastros.'),
  (3, 'Gerente', 'Responsável pela gestão da academia.'),
  (4, 'Nutricionista', 'Responsável pela orientação nutricional.'),
  (5, 'Fisioterapeuta', 'Responsável por avaliação e reabilitação.');
 
 
-- PROFESSOR
INSERT INTO PROFESSOR (id_cref, id_funcionario, especialidade, categoria_cref, responsavel_tecnico) VALUES
  ('045123-G/SP', 2, 'Musculação', 'G', 1),
  ('051987-G/SP', 3, 'Crossfit', 'G', 0),
  ('062345-G/SP', 4, 'Pilates e Yoga', 'G', 0),
  ('070456-G/SP', 5, 'Dança', 'G', 0);
 
 
-- DEPENDENTE
INSERT INTO DEPENDENTE (cpf_dependente, cpf_responsavel, parentesco) VALUES
  ('111.222.333-11', '111.222.333-07', 'Filha'),
  ('111.222.333-12', '111.222.333-04', 'Filho'),
  ('333.444.555-01', '222.333.444-02', 'Filha');
 
 
-- MODALIDADE
INSERT INTO MODALIDADE (id_modalidade, nome, duracao, descricao, status) VALUES
  (1, 'Musculação', 60, 'Fortalecimento muscular com acompanhamento.', 'Ativa'),
  (2, 'Pilates', 50, 'Flexibilidade, postura e fortalecimento do core.', 'Ativa'),
  (3, 'Yoga', 60, 'Relaxamento, respiração e equilíbrio mental.', 'Ativa'),
  (4, 'Zumba', 45, 'Dança e exercícios aeróbicos.', 'Ativa'),
  (5, 'Crossfit', 60, 'Treinamento funcional de alta intensidade.', 'Ativa'),
  (6, 'Funcional', 45, 'Circuito com peso corporal e acessórios.', 'Ativa'),
  (7, 'Spinning', 45, 'Ciclismo indoor.', 'Inativa');
 
 
-- TURMA
INSERT INTO TURMA (id_turma, id_modalidade, id_cref, horario_i, horario_f, sala, limitealunos) VALUES
  (1, 1, '045123-G/SP', '06:00:00', '07:00:00', 'Sala de Musculação', 30),
  (2, 1, '045123-G/SP', '07:00:00', '08:00:00', 'Sala de Musculação', 30),
  (3, 5, '051987-G/SP', '18:00:00', '19:00:00', 'Box Crossfit', 15),
  (4, 5, '051987-G/SP', '19:00:00', '20:00:00', 'Box Crossfit', 15),
  (5, 2, '062345-G/SP', '08:00:00', '08:50:00', 'Estúdio 1', 10),
  (6, 3, '062345-G/SP', '09:00:00', '10:00:00', 'Estúdio 1', 15),
  (7, 4, '070456-G/SP', '19:00:00', '19:45:00', 'Sala de Dança', 25),
  (8, 6, '051987-G/SP', '17:00:00', '17:45:00', 'Área Externa', 20),
  (9, 2, '062345-G/SP', '12:00:00', '12:50:00', 'Estúdio 1', 10);
 
 
-- MATRICULA
INSERT INTO MATRICULA (id_matricula, id_turma, rgm, dt_matricula) VALUES
  (1, 1, 1, '2025-12-15'),
  (2, 5, 1, '2026-01-15'),
  (3, 3, 2, '2026-01-20'),
  (4, 1, 2, '2026-01-20'),
  (5, 6, 3, '2026-02-03'),
  (6, 9, 3, '2026-02-03'),
  (7, 2, 4, '2026-02-10'),
  (8, 4, 4, '2026-02-10'),
  (9, 5, 5, '2026-03-02'),
  (10, 6, 5, '2026-03-02'),
  (11, 7, 6, '2026-03-12'),
  (12, 1, 6, '2026-03-12'),
  (13, 7, 7, '2026-04-07'),
  (14, 5, 7, '2026-04-07'),
  (15, 3, 8, '2026-04-22'),
  (16, 8, 8, '2026-04-22'),
  (17, 6, 9, '2026-05-05'),
  (18, 2, 10, '2026-06-02'),
  (19, 4, 10, '2026-06-02'),
  (20, 7, 11, '2026-06-02'),
  (21, 8, 12, '2026-07-01'),
  (22, 1, 13, '2026-08-11'),
  (23, 9, 13, '2026-08-11'),
  (24, 3, 14, '2026-01-08'),
  (25, 7, 15, '2026-09-15'),
  (26, 2, 15, '2026-09-15');

 
-- PLANOS
INSERT INTO PLANOS (id_plano, nome, descricao, duracao_meses, valor_plano, dt_i, dt_f)
VALUES
  (1, 'Básico Musculação', 'Acesso livre à sala de musculação.', 1, 99.90, '2025-01-01', NULL),
  (2, 'Fit Total', 'Acesso a todas as modalidades ativas.', 12, 189.90, '2025-01-01', NULL),
  (3, 'Studio Pilates & Yoga', 'Aulas de pilates e yoga no estúdio.', 12, 229.90, '2025-01-01', NULL),
  (4, 'Cross Performance', 'Crossfit, funcional e musculação.', 12, 179.90, '2025-01-01', NULL),
  (5, 'Dança', 'Aulas de zumba.', 6,  119.90, '2025-06-01', NULL),
  (6, 'Promo Verão', 'Plano promocional de musculação para novos alunos.', 1, 79.90, '2025-12-01', '2026-02-28');
 
 
-- LANO_MODALIDADE
INSERT INTO PLANO_MODALIDADE (id_plano, id_modalidade)
VALUES
  (1, 1), (2, 1), (2, 2), (2, 3), (2, 4), (2, 5), (2, 6), (3, 2), (3, 3), (4, 1), (4, 5), (4, 6), (5, 4), (6, 1);
 

-- CONTRATO
-- status: A = ativo | E = encerrado | C = cancelado
INSERT INTO CONTRATO (id_contrato, rgm, id_plano, valor_mensal_contratado, desconto, status, dt_i, dt_f) VALUES
  (1, 1, 6, 79.90,  0.00, 'E', '2025-12-15', '2026-01-14'),
  (2, 1, 2, 189.90, 0.00, 'A', '2026-01-15', '2027-01-14'),
  (3, 2, 4, 179.90, 0.00, 'A', '2026-01-20', '2027-01-19'),
  (4, 3, 3, 229.90, 0.00, 'A', '2026-02-03', '2027-02-02'),
  (5, 4, 4, 179.90, 0.00, 'A', '2026-02-10', '2027-02-09'),
  (6, 5, 3, 229.90, 10.00, 'A', '2026-03-02', '2027-03-01'),
  (7, 6, 2, 189.90, 0.00, 'A', '2026-03-12', '2027-03-11'),
  (8, 7, 2, 189.90, 0.00, 'A', '2026-04-07', '2027-04-06'),
  (9, 8, 4, 179.90, 0.00, 'A', '2026-04-22', '2027-04-21'),
  (10, 9, 3, 229.90, 5.00, 'A', '2026-05-05', '2027-05-04'),
  (16, 15, 2, 189.90, 15.00, 'A', '2026-09-15', '2027-09-14');
 
 
-- FORNECEDOR
INSERT INTO FORNECEDOR (cnpj, nome_fantasia, status, servico_prestado) VALUES
  ('23.456.789/0001-10', 'Iron Equipamentos Fitness', 'Ativo', 'Venda e manutenção de aparelhos de musculação.'),
  ('34.567.890/0001-21', 'Limpa Tudo Serviços', 'Ativo', 'Limpeza e higienização diária.'),
  ('45.678.901/0001-32', 'Energia Paulista S.A.', 'Ativo', 'Fornecimento de energia elétrica.'),
  ('56.789.012/0001-43', 'Águas Claras Saneamento', 'Ativo', 'Fornecimento de água e coleta de esgoto.'),
  ('67.890.123/0001-54', 'SuplePro Distribuidora', 'Inativo', 'Venda de suplementos para revenda.'),
  ('78.901.234/0001-65', 'NetFibra Telecom', 'Ativo', 'Internet e telefonia.');
 
 
-- EQUIPAMENTO
INSERT INTO EQUIPAMENTO (id_equipamento, cnpj, nome, descricao, preco, estoque) VALUES
  (1, '23.456.789/0001-10', 'Esteira ergométrica profissional', 'Velocidade até 20 km/h, inclinação de 15%.', 12500.00, 6),
  (2, '23.456.789/0001-10', 'Bicicleta ergométrica', 'Bicicleta vertical com 16 níveis de carga.', 4800.00, 4),
  (3, '23.456.789/0001-10', 'Leg press 45°', 'Capacidade de 400 kg.', 9800.00, 2),
  (4, '23.456.789/0001-10', 'Kit halteres 1 a 30 kg', 'Halteres emborrachados com rack.', 6200.00, 1),
  (5, '23.456.789/0001-10', 'Anilha olímpica 20 kg (par)', 'Anilhas emborrachadas.', 890.00, 10),
  (6, '23.456.789/0001-10', 'Kettlebell 16 kg', 'Ferro fundido com pintura eletrostática.', 280.00, 12),
  (7, NULL, 'Tapete de yoga', 'Tapete antiderrapante de 6 mm.', 89.90, 25),
  (8, NULL, 'Bola suíça 65 cm', 'Bola de pilates antiestouro.', 120.00, 8);
 
 
-- DESPESAS
INSERT INTO DESPESAS (id_despesas, cnpj, nome, descricao, validade, valor, quantidade) VALUES
  (1, '45.678.901/0001-32', 'Conta de energia', 'Energia elétrica - setembro/2026.', '2026-10-10', 4850.75, 1),
  (2, '56.789.012/0001-43', 'Conta de água','Água e esgoto - setembro/2026.', '2026-10-12', 980.40,  1),
  (3, '34.567.890/0001-21', 'Serviço de limpeza', 'Limpeza mensal - outubro/2026.', '2026-10-05', 3200.00, 1),
  (4, '78.901.234/0001-65', 'Internet', 'Plano de fibra 1 Gb - outubro/2026.', '2026-10-15', 299.90,  1),
  (5, '23.456.789/0001-10', 'Manutenção de esteiras','Revisão preventiva das esteiras.', '2026-10-20', 1500.00, 6),
  (6, '23.456.789/0001-10', 'Compra de kettlebells', 'Kettlebells de 16 kg para o funcional.', '2026-09-25', 3360.00, 12),
  (7, '45.678.901/0001-32', 'Conta de energia', 'Energia elétrica - outubro/2026.', '2026-11-10', 5020.30, 1),
  (8, NULL, 'Material de escritório','Papel, toner e itens da recepção.', '2026-10-30', 245.60, 1);
 
 
-- CONTA
INSERT INTO CONTA (id_numconta, saldo, qnt_pendente, qnt_pago, cnpj) VALUES
  (1, 85000.00, 7065.80, 59391.15,'12.123.456/0001-12');
 
 
-- CONTAS_PAGAR
-- status: Pago | Pendente | Atrasado
INSERT INTO CONTAS_PAGAR (id_pagamento, id_numconta, id_despesas, dt_pagamento, dt_vencimento, tipo, valor, status) VALUES
  (1, 1, 6, '2026-09-25', '2026-09-25', 'Equipamento', 3360.00, 'Pendente'),
  (2, 1, 3, '2026-10-05', '2026-10-05', 'Serviço', 3200.00, 'Pago'),
  (3, 1, 1, '2026-10-09', '2026-10-10', 'Energia', 4850.75, 'Pago'),
  (8, 1, 8, NULL, '2026-10-30', 'Material', 245.60, 'Pendente'),
  (9, 1, NULL, '2026-10-05', '2026-10-05', 'Folha de pagamento', 29900.00, 'Pago'),
  (10, 1, NULL, '2026-10-08', '2026-10-10', 'Aluguel', 18000.00, 'Pendente');
  
 
-- PAGAMENTO
INSERT INTO PAGAMENTO (id_pagamento, id_numconta, data_pagamento, valor, tipo) VALUES
  (1, 1, '2026-09-25', 3360.00, 'Boleto'),
  (2, 1, '2026-10-05', 3200.00, 'PIX'),
  (3, 1, '2026-10-09', 4850.75, 'Débito automático'),
  (10, 1, '2026-10-08', 18000.00, 'Transferência');