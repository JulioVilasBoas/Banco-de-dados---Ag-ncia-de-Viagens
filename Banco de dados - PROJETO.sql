CREATE TABLE Cliente (
    cpf CHAR(11) PRIMARY KEY,
    cidade VARCHAR(80) NOT NULL,
    nome VARCHAR(120) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    rua VARCHAR(120) NOT NULL,
    
    CONSTRAINT chk_cpf CHECK (REGEXP_LIKE(cpf, '^[0-9]{11}$'))
);
 
CREATE TABLE Cliente_telefone (
    cliente_cpf CHAR(11),
    numero VARCHAR(20),
    
    PRIMARY KEY (cliente_cpf , numero),
    
    CONSTRAINT fk_cpf FOREIGN KEY (cliente_cpf)
        REFERENCES Cliente (cpf)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Dependente (
	cliente_cpf CHAR(11),
    nome VARCHAR(120),
    data_nascimento DATE,
    parentesco VARCHAR(40) NOT NULL,
    
    PRIMARY KEY (cliente_cpf, nome),
    
    CONSTRAINT fk_Dependente_cpf FOREIGN KEY (cliente_cpf)
    REFERENCES Cliente (cpf)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE Fornecedor(
	cnpj CHAR(14) PRIMARY KEY,
    e_mail VARCHAR(254),
    nome_fantasia VARCHAR(120) NOT NULL,
    telefone VARCHAR(20),
    
    CONSTRAINT chk_cnpj CHECK (REGEXP_LIKE(cnpj, '^[0-9]{14}$'))
);

CREATE TABLE Companhia_Aerea(
	fornecedor_cnpj CHAR(14) PRIMARY KEY,
    codigo_IATA CHAR(2) NOT NULL UNIQUE,
    politicas_bagagem VARCHAR(255),
    
    CONSTRAINT fk_Companhia_cnpj FOREIGN KEY (fornecedor_cnpj)
    REFERENCES Fornecedor (cnpj)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE Operadora_Turismo (
	fornecedor_cnpj CHAR(14) PRIMARY KEY,
    Registro_operadora VARCHAR(30) UNIQUE,
    escopo VARCHAR(120),
    
    CONSTRAINT fk_Operadora_cnpj FOREIGN KEY (fornecedor_cnpj)
    REFERENCES Fornecedor(cnpj)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE Rede_Hoteleira(
	fornecedor_cnpj CHAR(14) PRIMARY KEY,
    categoria VARCHAR(30),
    politica_cancelamento VARCHAR(255),
    
    CONSTRAINT fk_Hoteleira_cnpj FOREIGN KEY (fornecedor_cnpj)
    REFERENCES Fornecedor (cnpj)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE Servico (
	id_servico INT PRIMARY KEY AUTO_INCREMENT,
    fornecedor_cnpj CHAR(14) NOT NULL,
    descricao VARCHAR(255),
    tipo_servico VARCHAR(40) NOT NULL,
    
    CONSTRAINT fk_Servico_cnpj FOREIGN KEY (fornecedor_cnpj)
    REFERENCES Fornecedor (cnpj)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);

CREATE TABLE Destino (
	id_destino INT PRIMARY KEY AUTO_INCREMENT,
    cidade VARCHAR(80) NOT NULL,
    pais VARCHAR(80) NOT NULL
);

CREATE TABLE Pacote_viagem(
	id_pacote INT PRIMARY KEY AUTO_INCREMENT,
    id_destino INT NOT NULL,
    data_final DATE NOT NULL,
    data_inicio DATE NOT NULL,
    nome_pacote VARCHAR(120) NOT NULL,
    preco_total DECIMAL(12,2) NOT NULL,
    
    CONSTRAINT fk_Pacote_destino FOREIGN KEY (id_destino)
    REFERENCES Destino (id_destino)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);

CREATE TABLE Composicao_Pacote (
	id_pacote INT,
    id_servico INT,
    desc_serv_pacote VARCHAR(255),

	PRIMARY KEY (id_pacote, id_servico),
    
    CONSTRAINT fk_Composicao_pacote FOREIGN KEY (id_pacote)
    REFERENCES Pacote_viagem (id_pacote)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    
    CONSTRAINT fk_Composicao_servico FOREIGN KEY (id_servico)
    REFERENCES Servico (id_servico)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);

CREATE TABLE Funcionario (
	id_func INT PRIMARY KEY AUTO_INCREMENT,
    supervisor INT,
    cargo VARCHAR(60) NOT NULL,
    data_admissao DATE NOT NULL,
    nome VARCHAR(120) NOT NULL,
    
    CONSTRAINT fk_supervisor FOREIGN KEY (supervisor) 
    REFERENCES Funcionario (id_func)
    ON UPDATE CASCADE
    ON DELETE SET NULL
);

CREATE TABLE Reserva (
	id_reserva INT PRIMARY KEY AUTO_INCREMENT,
    cliente_cpf CHAR(11) NOT NULL,
    id_func INT NOT NULL,
    id_pacote INT NOT NULL,
    data_venda DATE NOT NULL,
    status_pagamento VARCHAR(20) NOT NULL,
    valor_total_reserva DECIMAL(12,2) NOT NULL,
    
    CONSTRAINT fk_Reserva_cpf FOREIGN KEY (cliente_cpf) 
    REFERENCES Cliente (cpf)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
    
    CONSTRAINT fk_Reserva_func FOREIGN KEY (id_func)
    REFERENCES Funcionario (id_func)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
    
    CONSTRAINT fk_Reserva_pacote FOREIGN KEY (id_pacote)
    REFERENCES Pacote_viagem (id_pacote)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);

CREATE TABLE Pagamento (
	id_reserva INT,
    num_parcela INT,
    data_pagamento DATE,
    data_vencimento DATE NOT NULL,
    meio_pagamento VARCHAR(30) NOT NULL,
    status_parcela VARCHAR(20) NOT NULL,
    
    PRIMARY KEY (id_reserva, num_parcela),
    
    CONSTRAINT fk_Pagamento_reserva FOREIGN KEY (id_reserva)
    REFERENCES Reserva(id_reserva)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);