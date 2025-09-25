# Definição Minimundo -- Horizonte Viagens

1. Definição do Minimundo
1.1. Descrição do Mundo Real
A "Horizonte Viagens" é uma agência especializada na venda de pacotes de viagens
nacionais e internacionais. A agência emprega vendedores que são responsáveis por
atender os clientes, apresentar os pacotes disponíveis e efetuar as vendas. Cada
vendedor possui um supervisor direto dentro da agência.
Os clientes procuram a agência para comprar pacotes de viagem para diversos
destinos. Um cliente pode ter dependentes que viajarão com ele, e é importante
manter o registro desses acompanhantes para a reserva. Cada cliente possui
informações pessoais como nome, CPF, endereço e um ou mais telefones de contato.
Um pacote de viagem é montado para um destino específico e é composto por um
conjunto de serviços, como passagens aéreas, hospedagem em hotéis e passeios
turísticos. Esses serviços são fornecidos por empresas parceiras (companhias aéreas,
redes hoteleiras e operadores de turismo). Cada pacote tem um preço total, uma data
de início e uma data de fim.
Quando um cliente decide comprar um pacote, uma reserva é criada. Essa reserva
associa o cliente, o vendedor responsável e o pacote escolhido. Para cada reserva, é
registrado o valor total, a data da venda e o status do pagamento. O pagamento de
uma reserva pode ser parcelado, e o sistema precisa controlar cada parcela paga.
1.2. Objetivos da Aplicação
Gerenciar de forma centralizada as informações dos clientes e seus dependentes.
Manter um cadastro detalhado dos funcionários, incluindo suas relações de supervisão.
Controlar as vendas de pacotes de viagem, registrando todas as reservas e seus
respectivos status.
Gerenciar o portfólio de pacotes de viagem, incluindo os serviços que os compõem e
seus fornecedores.
Controlar o fluxo financeiro, registrando os pagamentos (parcelas) de cada reserva.
Permitir a geração de relatórios gerenciais para análise de desempenho e tomada de
decisão.
1.3. Perguntas e Relatórios Importantes
Quais são os pacotes de viagem mais vendidos nos últimos 6 meses?
Qual vendedor realizou o maior volume de vendas no último trimestre?
Listar todos os clientes que já viajaram para um destino específico (ex: "Paris").
Quais reservas ainda possuem pagamentos pendentes?
Listar o itinerário completo (serviços inclusos) para uma determinada reserva de um
cliente.
Quem são os funcionários supervisionados por um gerente específico?
Quais clientes possuem mais de um dependente cadastrado?
1.4. Descrição Informal dos Dados
Entidades: Cliente, Dependente, Funcionário, Reserva, Pacote, Pagamento, Serviço,
Fornecedor, Destino.
Relacionamentos:
Um Cliente pode realizar várias Reservas.
Um Funcionário (vendedor) pode ser responsável por várias Reservas.
Um Funcionário (supervisor) pode supervisionar outros Funcionários.
Uma Reserva é referente a um único Pacote.
Um Cliente pode ter vários Dependentes, mas um dependente está ligado a um único
cliente.
Um Pacote é composto por vários Serviços (voos, hotéis, etc.).
Um Serviço é oferecido por um Fornecedor.
Uma Reserva pode ter vários Pagamentos (parcelas).
Atributos Notáveis: O endereço do cliente é composto (rua, número, cidade), e seu
telefone é multivalorado. O dependente é uma entidade fraca, pois sua existência
depende de um cliente. Fornecedores se especializam em: Companhia Aérea, Rede
Hoteleira e Operadora de Turismo.
