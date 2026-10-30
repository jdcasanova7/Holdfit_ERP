## **Requisitos Não Funcionais**

* **RNF01 \- Restrição de Acesso:** O sistema deverá restringir o acesso às funcionalidades conforme o perfil de usuário, como administrador, professor e demais perfis autorizados.

* **RNF02 \- Proteção aos Dados Pessoais:** Os dados pessoais tratados pelo sistema deverão possuir mecanismos de proteção e controle de acesso compatíveis com a LGPD.

* **RNF03 \- Liberação de Catraca:** A operação de liberação da catraca deverá apresentar tempo de resposta inferior a 1 segundo em condições normais de operação.

* **RNF04 \- Histórico das operações financeiras:** O sistema deverá manter histórico/auditoria das operações financeiras relevantes, incluindo cancelamentos e estornos.

* **RNF05 \- Chaves Estrangeiras:** As tabelas relacionadas do banco de dados deverão utilizar chaves estrangeiras com regras explícitas de atualização e deleção, evitando exclusões acidentais.

* **RNF06 \- Autenticação para Acesso:** O sistema deverá exigir autenticação para acesso às funcionalidades restritas.

* **RNF07 \- Credenciais de Acesso:** O sistema deverá proteger credenciais de acesso, armazenando-as de forma segura e não em texto puro.

* **RNF08 \- Cópias de Segurança:** O sistema deverá realizar cópias de segurança periódicas dos dados, com procedimento definido de restauração.

* **RNF09 \- Integridade dos Dados de Cadastro:** O sistema deverá preservar a integridade e consistência dos dados durante operações de cadastro, alteração, pagamento e cancelamento.

* **RNF10 \- Mensagem de Erro:** O sistema deverá disponibilizar mensagens claras de erro e confirmação para operações realizadas pelos usuários.

* **RNF11 \- Manutenção do Banco de Dados:** O sistema deverá permitir a manutenção do banco de dados sem comprometer a integridade dos registros existentes.

* **RNF12 \- Desempenho:** O tempo de resposta da consulta de validação de idade e permissão de entrada no ambiente de trabalho deve ser inferior a 500 ms por tentativa de acesso/check-in.

* **RNF13 \- Integridade / Segurança:** A associação entre a tabela de Dependente e Responsável deve ser garantida por uma chave estrangeira (FK\_Responsavel) com restrição NOT NULL no banco de dados, impedindo registros órfãos.

* **RNF14 \- Conformidade Legal / LGPD:** Os dados pessoais do dependente (especialmente data de nascimento e identificadores) devem possuir controle de acesso restrito e ser tratados segundo os termos de consentimento do responsável.

* **RNF15 \- Usabilidade / Rastreabilidade:** O sistema deve manter um log de auditoria indicando a data, hora e ID do responsável no momento em que a permissão/autorização do dependente foi registrada.

