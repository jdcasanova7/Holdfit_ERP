DROP TABLE IF EXISTS PAGAMENTO;
DROP TABLE IF EXISTS CONTAS_RECEBER;
DROP TABLE IF EXISTS CONTAS_PAGAR;
DROP TABLE IF EXISTS CONTA;
DROP TABLE IF EXISTS DESPESAS;
DROP TABLE IF EXISTS EQUIPAMENTO;
DROP TABLE IF EXISTS FORNECEDOR;
DROP TABLE IF EXISTS CONTRATO;
DROP TABLE IF EXISTS PLANO_MODALIDADE;
DROP TABLE IF EXISTS PLANOS;
DROP TABLE IF EXISTS FREQUENCIA;
DROP TABLE IF EXISTS TURMA_ALUNO;
DROP TABLE IF EXISTS TURMA;
DROP TABLE IF EXISTS MODALIDADE;
DROP TABLE IF EXISTS DEPENDENTE;
DROP TABLE IF EXISTS PROFESSOR;
DROP TABLE IF EXISTS CARGO;
DROP TABLE IF EXISTS FUNCIONARIO;
DROP TABLE IF EXISTS DEPARTAMENTO;
DROP TABLE IF EXISTS ALUNO;
DROP TABLE IF EXISTS PESSOA;
DROP TABLE IF EXISTS EMPRESA;


-- --------------Criação das Tabelas-------------- --
CREATE TABLE EMPRESA (
  cnpj varchar(19) NOT NULL PRIMARY KEY,
  endereco varchar(70) NOT NULL,
  nome_fantasia varchar(70) NOT NULL UNIQUE,
  horario_ab time NOT NULL,
  horario_fc time NOT NULL,
  telefone varchar(21),
  email varchar(70)
);
CREATE TABLE PESSOA (
  cpf varchar(14) NOT NULL PRIMARY KEY,
  nome varchar(100) NOT NULL,
  endereco varchar(100),
  telefone varchar(21),
  email varchar(70),
  genero varchar(20),
  dt_nasci date NOT NULL
);
CREATE TABLE ALUNO (
  rgm int NOT NULL PRIMARY KEY,
  cpf varchar(14) NOT NULL UNIQUE,
  cod_matricula varchar(30) NOT NULL UNIQUE,
  data_in date NOT NULL,
  data_f date,
  status_al varchar(1) NOT NULL,

  FOREIGN KEY (cpf) REFERENCES PESSOA (cpf)
);

-- Criada antes de FUNCIONARIO, que a referencia
CREATE TABLE DEPARTAMENTO (
  id_depto int NOT NULL PRIMARY KEY,
  nome_dp varchar(15) NOT NULL,
  email varchar(70),
  telefone varchar(17),
  descricao varchar(100),
  hr_i int,
  hr_f int
);
CREATE TABLE FUNCIONARIO (
  id_funcionario int NOT NULL PRIMARY KEY,
  cpf varchar(14) NOT NULL UNIQUE,
  id_depto int NOT NULL,
  salario decimal(10,2) NOT NULL,
  funcao varchar(50),
  carga_h decimal(5,2),
  h_entrada time,
  h_saida time,
  data_admissao date,
  data_demissao date,

  FOREIGN KEY (cpf) REFERENCES PESSOA (cpf),
  FOREIGN KEY (id_depto) REFERENCES DEPARTAMENTO (id_depto)
);
CREATE TABLE CARGO (
  id_cargo int NOT NULL PRIMARY KEY,
  nome_cargo varchar(15) NOT NULL,
  descricao_cargo varchar(100)
);
CREATE TABLE PROFESSOR (
  id_cref varchar(20) NOT NULL PRIMARY KEY,
  id_funcionario int NOT NULL UNIQUE,
  especialidade varchar(50),
  categoria_cref varchar(2) NOT NULL,
  responsavel_tecnico bit NOT NULL DEFAULT 0,

  FOREIGN KEY (id_funcionario) REFERENCES FUNCIONARIO (id_funcionario)
);

CREATE TABLE DEPENDENTE (
  cpf_dependente  varchar(14) NOT NULL PRIMARY KEY,
  cpf_responsavel varchar(14) NOT NULL,
  parentesco      varchar(15) NOT NULL,

  FOREIGN KEY (cpf_dependente) REFERENCES PESSOA (cpf),
  FOREIGN KEY (cpf_responsavel) REFERENCES PESSOA (cpf)
);

CREATE TABLE MODALIDADE (
  id_modalidade int NOT NULL PRIMARY KEY,
  nome varchar(70) NOT NULL,
  duracao int NOT NULL,
  descricao varchar(100),
  status varchar(20) NOT NULL
);

CREATE TABLE TURMA (
  id_turma int NOT NULL PRIMARY KEY,
  id_modalidade int NOT NULL,
  id_cref varchar(20) NOT NULL,
  horario_i time NOT NULL,
  horario_f time NOT NULL,
  sala varchar(40),
  limitealunos  int,

  FOREIGN KEY (id_modalidade) REFERENCES MODALIDADE (id_modalidade),
  FOREIGN KEY (id_cref) REFERENCES PROFESSOR (id_cref)
);

CREATE INDEX ix_id_modalidade_TURMA ON TURMA (id_modalidade);

CREATE TABLE TURMA_ALUNO(
  id_matricula int NOT NULL PRIMARY KEY,
  id_turma int NOT NULL,
  rgm int NOT NULL,
  dt_matricula date NOT NULL,

  FOREIGN KEY (id_turma) REFERENCES TURMA (id_turma),
  FOREIGN KEY (rgm) REFERENCES ALUNO (rgm)
);

CREATE TABLE FREQUENCIA (
  id_matricula int NOT NULL,
  id_turma int NOT NULL,
  dt_aula date NOT NULL,
  status_presenca varchar(20) NOT NULL,
  PRIMARY KEY (dt_aula, id_matricula, id_turma),
  FOREIGN KEY (id_matricula) REFERENCES TURMA_ALUNO (id_matricula),
  FOREIGN KEY (id_turma) REFERENCES TURMA (id_turma)
);

CREATE TABLE PLANOS (
  id_plano int NOT NULL PRIMARY KEY,
  nome varchar(50) NOT NULL,
  descricao varchar(150),
  duracao_meses int,
  valor_plano decimal(10,2),
  dt_i date NOT NULL,
  dt_f date
);

CREATE TABLE PLANO_MODALIDADE (
  id_plano int NOT NULL,
  id_modalidade int NOT NULL,
  PRIMARY KEY (id_plano, id_modalidade),

  FOREIGN KEY (id_plano) REFERENCES PLANOS (id_plano),
  FOREIGN KEY (id_modalidade) REFERENCES MODALIDADE (id_modalidade)
);

CREATE TABLE CONTRATO (
  id_contrato int NOT NULL PRIMARY KEY,
  rgm int NOT NULL,
  id_plano int NOT NULL,
  valor_mensal_contratado decimal(10,2) NOT NULL,
  desconto decimal(5,2),
  status char(1),
  dt_i date NOT NULL,
  dt_f date NOT NULL,
  UNIQUE (rgm, id_plano),

  FOREIGN KEY (rgm) REFERENCES ALUNO (rgm),
  FOREIGN KEY (id_plano) REFERENCES PLANOS (id_plano)
);

CREATE TABLE FORNECEDOR (
  cnpj varchar(19) NOT NULL PRIMARY KEY,
  nome_fantasia varchar(70) NOT NULL,
  status varchar(20) NOT NULL,
  servico_prestado varchar(150)
);

CREATE TABLE EQUIPAMENTO (
  id_equipamento int NOT NULL PRIMARY KEY,
  cnpj varchar(19),
  nome varchar(70) NOT NULL,
  descricao varchar(150),
  preco decimal(10,2),
  estoque int,
  FOREIGN KEY (cnpj) REFERENCES FORNECEDOR (cnpj)
);

CREATE TABLE DESPESAS (
  id_despesas int NOT NULL PRIMARY KEY,
  cnpj varchar(19),
  nome varchar(70) NOT NULL,
  descricao varchar(150),
  validade date,
  valor decimal(10,2) NOT NULL,
  quantidade int,
  FOREIGN KEY (cnpj) REFERENCES FORNECEDOR (cnpj)
);

CREATE TABLE CONTA (
  id_numconta  int NOT NULL PRIMARY KEY,
  saldo decimal(12,2) NOT NULL,
  qnt_pendente decimal(12,2),
  qnt_pago decimal(12,2),
  cnpj varchar(19) NOT NULL,
  FOREIGN KEY (cnpj) REFERENCES EMPRESA (cnpj)
);

CREATE TABLE CONTAS_PAGAR (
  id_pagamento int NOT NULL PRIMARY KEY,
  id_numconta int NOT NULL,
  id_despesas int,
  dt_pagamento date,
  dt_vencimento date NOT NULL,
  tipo varchar(50) NOT NULL,
  valor decimal(10,2) NOT NULL,
  status varchar(20) NOT NULL,

  FOREIGN KEY (id_numconta) REFERENCES CONTA (id_numconta),
  FOREIGN KEY (id_despesas) REFERENCES DESPESAS (id_despesas)
);

CREATE TABLE CONTAS_RECEBER (
  id_recebimento int NOT NULL PRIMARY KEY,
  id_numconta int NOT NULL,
  id_contrato int NOT NULL,
  dt_recebimento date,
  dt_vencimento  date NOT NULL,
  tipo varchar(50) NOT NULL,
  valor decimal(10,2) NOT NULL,
  status varchar(20) NOT NULL,

  FOREIGN KEY (id_numconta) REFERENCES CONTA (id_numconta),
  FOREIGN KEY (id_contrato) REFERENCES CONTRATO (id_contrato)
);

CREATE TABLE PAGAMENTO (
  id_pagamento int NOT NULL PRIMARY KEY,
  id_numconta int NOT NULL,
  data_pagamento date NOT NULL,
  valor decimal(10,2) NOT NULL,
  tipo varchar(50) NOT NULL,

  FOREIGN KEY (id_numconta)  REFERENCES CONTA (id_numconta),
  FOREIGN KEY (id_pagamento) REFERENCES CONTAS_PAGAR (id_pagamento)
);

CREATE TABLE TESTE(
  id_teste int NOT NULL PRIMARY KEY,
  nome_tipo varchar(50) NOT NULL
);
