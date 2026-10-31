## **Requisitos Funcionais**

* **RF01 \- Gestão de Usuários e Pessoas:** O sistema deve permitir o cadastro e gerenciamento de pessoas (alunos, professores e funcionários), possibilitando que um mesmo cadastro assume múltiplos papéis (ex.: professor que também é aluno).

* **RF02 \- Gestão de Planos e Matrículas:** O sistema deve permitir a realização e o cancelamento de matrículas de alunos associadas aos planos oferecidos pela academia.

* **RF03 \- Gestão de Turmas e Grade de Aulas:** O sistema deve permitir o cadastramento de modalidades, turmas, horários e a vinculação de professores e alunos a essas turmas.

* **RF04 \- Controle de Acesso:** O sistema deve consultar o status do aluno/funcionário e validar a liberação de acesso às dependências da academia.

* **RF05 \- Gestão de Contas a Receber:** O sistema deve registrar os recebimentos de mensalidades e pagamentos avulsos, demonstrando os lançamentos futuros.

* **RF06 \- Gestão de Contas a Pagar e Fornecedores:** O sistema deve cadastrar fornecedores (equipamentos e serviços de manutenção) e registrar as despesas operacionais e pagamentos da empresa.

* **RF07 \- Alertas de Manutenção Preventiva:** O sistema deve notificar o gestor sobre os prazos de manutenção preventiva dos equipamentos e maquinários.

* **RF08 \- Painel e Relatórios Financeiros:** O sistema deve exibir o saldo atual em caixa, o cálculo da receita consolidada e relatórios de alunos inadimplentes.

* **RF09 \- Notificação de Cobrança:** O sistema deve disponibilizar relatórios de inadimplência e permitir o envio de notificações de cobrança utilizando os dados de contato cadastrados do aluno.

* **RF10 \- Cadastrar Dependente:** O sistema deve permitir o cadastro de um dependente vinculando-o obrigatoriamente a um Responsável ativo existente no sistema.

* **RF11 \- Coletar Autorização do Responsável:** O sistema deve disponibilizar um mecanismo (aceite digital, checkbox assinado ou flag) onde o Responsável confirma e autoriza a inclusão do dependente.

* **RF12 \- Atribuir Débitos ao Responsável:** O sistema deve direcionar automaticamente qualquer lançamento financeiro, conta a pagar ou cobrança gerada por/para o dependente diretamente para a conta/cadastro do Responsável.

* **RF13 \- Validar Idade para Acesso Físico:** O sistema de controle de acesso (catracas/credenciamento) deve consultar a data de nascimento do dependente e verificar se a idade é igual ou superior a 14 anos antes de liberar a entrada no ambiente de trabalho.

* **RF14 \- Bloquear Cadastro Sem Autorização:** O sistema deve impedir a gravação e a ativação do cadastro do dependente caso a autorização do responsável não tenha sido confirmada.

* **RF15 \- Não permitir duplicata de e-mails:** O sistema deve validar, no momento do cadastro, se o e-mail informado já existe na base de dados. Caso exista, o cadastro deve ser bloqueado e uma mensagem de erro deve ser exibida.

* **RF16 \- Não permitir mais de um e-mail por usuário:** O sistema deve validar, no momento do cadastro, se o usuário já tem um e-mail cadastrado. Caso a afirmação seja positiva, a modificação do cadastro deverá ser interrompida e o usuário alertado sobre a possibilidade de substituição da informação apenas.

