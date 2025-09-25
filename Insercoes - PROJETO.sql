USE mysql_database;
INSERT INTO Fornecedor (cnpj, e_mail, nome_fantasia, telefone)
VALUES    
    ('00000000000001','contato@voala.com','VoaLa Linhas Aéreas','(87)99999-0001'),   
    ('00000000000002','contato@hotelbr.com','HotelBR','(87)99999-0002'),    
    ('00000000000003','contato@tur.com','Tur Operadora','(87)99999-0003');

INSERT INTO Companhia_Aerea (fornecedor_cnpj, codigo_iata, politicas_bagagem)
VALUES    
    ('00000000000001','LA','1 mala 23kg + 1 bordo');

INSERT INTO Rede_Hoteleira (fornecedor_cnpj, categoria, politica_cancelamento)
VALUES
    ('00000000000002','4 estrelas','Cancelamento grátis até 7 dias antes');

INSERT INTO Operadora_Turismo (fornecedor_cnpj, registro_operadora, escopo)
VALUES
    ('00000000000003','OT-123','Passeios guiados nacionais');

INSERT INTO Servico (fornecedor_cnpj, descricao, tipo_servico)
VALUES
    ('00000000000001','Trecho aéreo ida e volta','AEREO'),
    ('00000000000002','Hospedagem padrão','HOSPEDAGEM'),    
    ('00000000000003','Passeios e traslados','TURISMO');

INSERT INTO Destino (id_destino, cidade, pais)
VALUES
    (1, 'São Paulo', 'Brasil');
    
INSERT INTO Destino (id_destino, cidade, pais)
VALUES    (2, 'Recife', 'Brasil');

INSERT INTO Destino (id_destino, cidade, pais)
VALUES    (3, 'Salvador', 'Brasil');

INSERT INTO Pacote_viagem (id_destino, data_final, data_inicio, nome_pacote, preco_total)
VALUES    (1, '2025-10-17', '2025-10-10', 'City Tour SP', 3000.00);

INSERT INTO Pacote_viagem (id_destino, data_final, data_inicio, nome_pacote, preco_total)
VALUES    (2, '2025-10-17', '2025-10-10', 'Praias de Recife', 3000.00);

INSERT INTO Pacote_viagem (id_destino, data_final, data_inicio, nome_pacote, preco_total)
VALUES    (3, '2025-10-17', '2025-10-10', 'Pacote Salvador', 3000.00);

INSERT INTO Composicao_Pacote (id_pacote, id_servico, desc_serv_pacote)
VALUES    (1, 1, 'Voo ida e volta');

INSERT INTO Composicao_Pacote (id_pacote, id_servico, desc_serv_pacote)
VALUES    (1, 2, 'Hotel 3-4* com café');

INSERT INTO Composicao_Pacote (id_pacote, id_servico, desc_serv_pacote)
VALUES    (1, 3, 'Passeios básicos');

INSERT INTO Composicao_Pacote (id_pacote, id_servico, desc_serv_pacote)
VALUES    (2, 1, 'Voo ida e volta');

INSERT INTO Composicao_Pacote (id_pacote, id_servico, desc_serv_pacote)
VALUES    (2, 2, 'Hotel 3-4* com café');

INSERT INTO Composicao_Pacote (id_pacote, id_servico, desc_serv_pacote)
VALUES    (2, 3, 'Passeios básicos');

INSERT INTO Composicao_Pacote (id_pacote, id_servico, desc_serv_pacote)
VALUES    (3, 1, 'Voo ida e volta');

INSERT INTO Composicao_Pacote (id_pacote, id_servico, desc_serv_pacote)
VALUES    (3, 2, 'Hotel 3-4* com café');

INSERT INTO Composicao_Pacote (id_pacote, id_servico, desc_serv_pacote)
VALUES    (3, 3, 'Passeios básicos');

INSERT INTO Funcionario (supervisor, cargo, data_admissao, nome)
VALUES    (NULL,'Gerente','2023-01-10','Carlos Gerente');

INSERT INTO Funcionario (supervisor, cargo, data_admissao, nome)
VALUES    (1,'Vendedor','2024-03-05','Ana Vendedora');

INSERT INTO Funcionario (supervisor, cargo, data_admissao, nome)
VALUES    (1,'Vendedor','2024-03-06','Bruno Vendedor');

INSERT INTO Cliente (cpf, cidade, nome, numero, rua)
VALUES    ('10000000001','Petrolina','Cliente 1','10','Rua A');

INSERT INTO Cliente_telefone (cliente_cpf, numero)
VALUES    ('10000000001','(87)91002-7791');

INSERT INTO Dependente (cliente_cpf, nome, data_nascimento, parentesco)
VALUES    ('10000000001','Dependente 1','2015-06-01','Filho(a)');

INSERT INTO Reserva (cliente_cpf, id_func, id_pacote, data_venda, status_pagamento, valor_total_reserva)
VALUES    ('10000000001', 2, 1, '2025-09-21', 'PARCIAL', 2500.00);

INSERT INTO Reserva_Dependente (id_reserva, cliente_cpf, nome_dependente)
SELECT id_reserva, '10000000001', 'Dependente 1'
FROM Reserva WHERE cliente_cpf = '10000000001'
ORDER BY id_reserva DESC 
LIMIT 1;

INSERT INTO Pagamento (id_reserva, num_parcela, data_pagamento, data_vencimento, meio_pagamento, status_parcela)
SELECT id_reserva, 1, '2025-09-21', '2025-10-06', 'PIX', 'PAGA'
FROM Reserva WHERE cliente_cpf = '10000000001'
ORDER BY id_reserva DESC 
LIMIT 1;

INSERT INTO Pagamento (id_reserva, num_parcela, data_pagamento, data_vencimento, meio_pagamento, status_parcela)
SELECT id_reserva, 2, NULL, '2025-10-21', 'PIX', 'PENDENTE'
FROM Reserva WHERE cliente_cpf = '10000000001'
ORDER BY id_reserva DESC 
LIMIT 1;

INSERT INTO Cliente (cpf, cidade, nome, numero, rua)
VALUES    ('10000000002','Petrolina','Cliente 2','11','Rua B');

INSERT INTO Cliente_telefone (cliente_cpf, numero)
VALUES    ('10000000002','(87)95336-1705');

INSERT INTO Dependente (cliente_cpf, nome, data_nascimento, parentesco)
VALUES    ('10000000002','Dependente 2','2015-06-01','Filho(a)');

INSERT INTO Reserva (cliente_cpf, id_func, id_pacote, data_venda, status_pagamento, valor_total_reserva)
VALUES    ('10000000002', 3, 2, '2025-09-21', 'PARCIAL', 1200.00);

INSERT INTO Reserva_Dependente (id_reserva, cliente_cpf, nome_dependente)
SELECT id_reserva, '10000000002', 'Dependente 2'
FROM Reserva WHERE cliente_cpf = '10000000002'
ORDER BY id_reserva DESC 
LIMIT 1;

INSERT INTO Pagamento (id_reserva, num_parcela, data_pagamento, data_vencimento, meio_pagamento, status_parcela)
SELECT id_reserva, 1, '2025-09-21', '2025-10-06', 'CARTAO', 'PAGA'
FROM Reserva WHERE cliente_cpf = '10000000002'
ORDER BY id_reserva DESC 
LIMIT 1;

INSERT INTO Pagamento (id_reserva, num_parcela, data_pagamento, data_vencimento, meio_pagamento, status_parcela)
SELECT id_reserva, 2, NULL, '2025-10-21', 'CARTAO', 'PENDENTE'
FROM Reserva WHERE cliente_cpf = '10000000002'
ORDER BY id_reserva DESC LIMIT 1;

INSERT INTO Cliente (cpf, cidade, nome, numero, rua)
VALUES    ('10000000003','Petrolina','Cliente 3','12','Rua C');

INSERT INTO Cliente_telefone (cliente_cpf, numero)
VALUES    ('10000000003','(87)99508-1921');

INSERT INTO Dependente (cliente_cpf, nome, data_nascimento, parentesco)
VALUES    ('10000000003','Dependente 3','2015-06-01','Filho(a)');

INSERT INTO Reserva (cliente_cpf, id_func, id_pacote, data_venda, status_pagamento, valor_total_reserva)
VALUES    ('10000000003', 2, 2, '2025-09-21', 'PARCIAL', 4500.00);

INSERT INTO Reserva_Dependente (id_reserva, cliente_cpf, nome_dependente)
SELECT id_reserva, '10000000003', 'Dependente 3'
FROM Reserva WHERE cliente_cpf = '10000000003'
ORDER BY id_reserva DESC LIMIT 1;

INSERT INTO Pagamento (id_reserva, num_parcela, data_pagamento, data_vencimento, meio_pagamento, status_parcela)
SELECT id_reserva, 1, '2025-09-21', '2025-10-06', 'CARTAO', 'PAGA'
FROM Reserva WHERE cliente_cpf='10000000003'
ORDER BY id_reserva DESC LIMIT 1;
INSERT INTO Pagamento (id_reserva, num_parcela, data_pagamento, data_vencimento, meio_pagamento, status_parcela)
SELECT id_reserva, 2, NULL, '2025-10-21', 'CARTAO', 'PENDENTE'
FROM Reserva WHERE cliente_cpf = '10000000003'
ORDER BY id_reserva DESC 
LIMIT 1;

INSERT INTO Cliente (cpf, cidade, nome, numero, rua)
VALUES    ('10000000004','Petrolina','Cliente 4','13','Rua D');

INSERT INTO Cliente_telefone (cliente_cpf, numero)
VALUES    ('10000000004','(87)96218-8806');

INSERT INTO Dependente (cliente_cpf, nome, data_nascimento, parentesco)
VALUES    ('10000000004','Dependente 4','2015-06-01','Filho(a)');

INSERT INTO Reserva (cliente_cpf, id_func, id_pacote, data_venda, status_pagamento, valor_total_reserva)
VALUES    ('10000000004', 3, 1, '2025-09-21', 'PARCIAL', 2500.00);

INSERT INTO Reserva_Dependente (id_reserva, cliente_cpf, nome_dependente)
SELECT id_reserva, '10000000004', 'Dependente 4'
FROM Reserva WHERE cliente_cpf = '10000000004'
ORDER BY id_reserva DESC 
LIMIT 1;

INSERT INTO Pagamento (id_reserva, num_parcela, data_pagamento, data_vencimento, meio_pagamento, status_parcela)
SELECT id_reserva, 1, '2025-09-21', '2025-10-06', 'PIX', 'PAGA'
FROM Reserva WHERE cliente_cpf = '10000000004'
ORDER BY id_reserva DESC
LIMIT 1;

INSERT INTO Pagamento (id_reserva, num_parcela, data_pagamento, data_vencimento, meio_pagamento, status_parcela)
SELECT id_reserva, 2, NULL, '2025-10-21', 'PIX', 'PENDENTE'
FROM Reserva WHERE cliente_cpf = '10000000004'
ORDER BY id_reserva DESC 
LIMIT 1;

INSERT INTO Cliente (cpf, cidade, nome, numero, rua)
VALUES    ('10000000005','Petrolina','Cliente 5','14','Rua E');

INSERT INTO Cliente_telefone (cliente_cpf, numero)
VALUES    ('10000000005','(87)95759-7809');

INSERT INTO Reserva (cliente_cpf, id_func, id_pacote, data_venda, status_pagamento, valor_total_reserva)
VALUES    ('10000000005', 2, 2, '2025-09-21', 'PARCIAL', 7000.00);

INSERT INTO Pagamento (id_reserva, num_parcela, data_pagamento, data_vencimento, meio_pagamento, status_parcela)
SELECT id_reserva, 1, '2025-09-21', '2025-10-06', 'BOLETO', 'PAGA'
FROM Reserva WHERE cliente_cpf = '10000000005'
ORDER BY id_reserva DESC LIMIT 1;

INSERT INTO Pagamento (id_reserva, num_parcela, data_pagamento, data_vencimento, meio_pagamento, status_parcela)
SELECT id_reserva, 2, NULL, '2025-10-21', 'BOLETO', 'PENDENTE'
FROM Reserva WHERE cliente_cpf = '10000000005'
ORDER BY id_reserva DESC 
LIMIT 1;

INSERT INTO Pagamento (id_reserva, num_parcela, data_pagamento, data_vencimento, meio_pagamento, status_parcela)
SELECT id_reserva, 3, NULL, '2025-11-05', 'BOLETO', 'PENDENTE'
FROM Reserva WHERE cliente_cpf = '10000000005'
ORDER BY id_reserva DESC 
LIMIT 1;

INSERT INTO Cliente (cpf, cidade, nome, numero, rua)
VALUES    ('10000000006','Petrolina','Cliente 6','15','Rua F');
INSERT INTO Cliente_telefone (cliente_cpf, numero)
VALUES    ('10000000006','(87)91098-3074');

INSERT INTO Reserva (cliente_cpf, id_func, id_pacote, data_venda, status_pagamento, valor_total_reserva)
VALUES    ('10000000006', 3, 2, '2025-09-21', 'PARCIAL', 4500.00);

INSERT INTO Pagamento (id_reserva, num_parcela, data_pagamento, data_vencimento, meio_pagamento, status_parcela)
SELECT id_reserva, 1, '2025-09-21', '2025-10-06', 'CARTAO', 'PAGA'
FROM Reserva WHERE cliente_cpf = '10000000006'
ORDER BY id_reserva DESC 
LIMIT 1;

INSERT INTO Pagamento (id_reserva, num_parcela, data_pagamento, data_vencimento, meio_pagamento, status_parcela)
SELECT id_reserva, 2, NULL, '2025-10-21', 'CARTAO', 'PENDENTE'
FROM Reserva WHERE cliente_cpf='10000000006'
ORDER BY id_reserva DESC 
LIMIT 1;

INSERT INTO Cliente (cpf, cidade, nome, numero, rua)
VALUES    ('10000000007','Petrolina','Cliente 7','16','Rua G');

INSERT INTO Cliente_telefone (cliente_cpf, numero)
VALUES    ('10000000007','(87)95282-2378');

INSERT INTO Reserva (cliente_cpf, id_func, id_pacote, data_venda, status_pagamento, valor_total_reserva)
VALUES    ('10000000007', 2, 1, '2025-09-21', 'PARCIAL', 1200.00);

INSERT INTO Pagamento (id_reserva, num_parcela, data_pagamento, data_vencimento, meio_pagamento, status_parcela)
SELECT id_reserva, 1, '2025-09-21', '2025-10-06', 'CARTAO', 'PAGA'
FROM Reserva WHERE cliente_cpf = '10000000007'
ORDER BY id_reserva DESC 
LIMIT 1;

INSERT INTO Pagamento (id_reserva, num_parcela, data_pagamento, data_vencimento, meio_pagamento, status_parcela)
SELECT id_reserva, 2, NULL, '2025-10-21', 'CARTAO', 'PENDENTE'
FROM Reserva WHERE cliente_cpf = '10000000007'
ORDER BY id_reserva DESC 
LIMIT 1;

INSERT INTO Cliente (cpf, cidade, nome, numero, rua)
VALUES    ('10000000008','Petrolina','Cliente 8','17','Rua H');

INSERT INTO Cliente_telefone (cliente_cpf, numero)
VALUES    ('10000000008','(87)98161-3505');

INSERT INTO Dependente (cliente_cpf, nome, data_nascimento, parentesco)
VALUES    ('10000000008','Dependente 8','2015-06-01','Filho(a)');

INSERT INTO Reserva (cliente_cpf, id_func, id_pacote, data_venda, status_pagamento, valor_total_reserva)
VALUES    ('10000000008', 3, 2, '2025-09-21', 'PARCIAL', 500.00);

INSERT INTO Reserva_Dependente (id_reserva, cliente_cpf, nome_dependente)
SELECT id_reserva, '10000000008', 'Dependente 8'
FROM Reserva
WHERE cliente_cpf='10000000008'
ORDER BY id_reserva DESC
LIMIT 1;

INSERT INTO Pagamento (id_reserva, num_parcela, data_pagamento, data_vencimento, meio_pagamento, status_parcela)
SELECT id_reserva, 1, '2025-09-21', '2025-10-06', 'PIX', 'PAGA'
FROM Reserva
WHERE cliente_cpf='10000000008'
ORDER BY id_reserva DESC
LIMIT 1;

