# **Principais Decisões**

Durante o desenvolvimento da modelagem do banco de dados da Hold Fit, foram tomadas algumas decisões relacionadas à estrutura das entidades, definição dos atributos, escolha das chaves primárias e estrangeiras e estabelecimento dos relacionamentos entre as entidades. Essas decisões foram baseadas nos processos de negócio, requisitos e regras de negócio definidos anteriormente, buscando representar de forma organizada as principais informações utilizadas pela academia.

## **12.1. Entidades e Atributos**

A definição das entidades foi realizada a partir dos principais elementos envolvidos nos processos da Hold Fit. Foram consideradas as pessoas que utilizam ou fazem parte da academia, a estrutura organizacional, as atividades oferecidas, os equipamentos, os fornecedores e os processos financeiros.

A entidade PESSOA, por exemplo, foi definida como uma entidade forte e representa o cadastro principal das pessoas relacionadas à academia. Nela estão armazenadas informações como CPF, nome, data de nascimento, endereço, telefone, e-mail e gênero. A utilização dessa entidade permite centralizar os dados pessoais e possibilita que uma mesma pessoa possa assumir diferentes papéis dentro do sistema.

Dessa forma, a escolha das entidades e atributos buscou separar as informações de acordo com sua finalidade, evitando concentrar todos os dados em uma única estrutura e permitindo representar os diferentes processos apresentados no projeto.

## **12.2. Escolha de PKs**

A escolha das chaves primárias foi realizada buscando utilizar identificadores capazes de diferenciar cada registro dentro de sua respectiva entidade.

A utilização dessas chaves permite identificar os registros e manter a ligação entre as diferentes partes do sistema, reduzindo a possibilidade de duplicidade e facilitando a organização dos dados.

## **12.3. Relacionamentos e Cardinalidades**

Os relacionamentos foram definidos considerando os processos de negócio e a forma como as entidades participam das atividades da Hold Fit. As cardinalidades foram utilizadas para representar quantas ocorrências de uma entidade podem estar relacionadas a outra.

Foi estruturado da seguinte forma pois, assim, as cardinalidades definidas procuram representar os vínculos existentes entre as entidades de acordo com os processos da academia, mantendo a estrutura necessária para o controle de alunos, funcionários, professores, aulas, fornecedores e informações financeiras.