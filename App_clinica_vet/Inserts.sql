-- INSERTS

INSERT INTO Dono (CPF, Nome, Endereco, data_nasc, Telefone) VALUES 
("12345678912", "Renan Watanabe", "Aguas Claras", "2006-06-26", "(61) 91111-1111"), 
("12345678934", "Gabriel Antônio", "Aguas Claras", "2006-04-07", "(61) 92222-2222"), 
("12345678901", "Kauan Henrique", "Ceilândia", "2005-07-06", "(61) 93333-3333");

INSERT INTO Animal(RFID, Especie, CPF_dono, Nome, Idade, Porte) VALUES
('PET-0001', "Cachorro", "12345678912", "Mack", 11, "Médio"),
('PET-0002', "Coelho", "12345678934", "Mike nelson", 4, "Pequeno"),
('PET-0003', "Jibóia", "12345678901", "Princesa", 3, "Grande");

-- ADICIONADO Telefone
INSERT INTO veterinario (CRMV, nome, idade, data_graduacao) VALUES
("CRMV-DF 07439", "Victor Caldas", 19, "2023-09-08"),
('CRMV-GO 11223', 'Dra. Juliana Martins', 28, '2019-12-15');

SET @consulta_uuid_1 = UUID();
SET @consulta_uuid_2 = UUID();
SET @consulta_uuid_3 = UUID();

INSERT INTO consulta(id, diagnostico, id_animal, CRMV_veterinario) VALUES 
(@consulta_uuid_1, "Sarna", 'PET-0001', "CRMV-DF 07439"), 
(@consulta_uuid_2, "Gases", 'PET-0002', "CRMV-DF 07439"),
(@consulta_uuid_3, "Pneumonia bacteriana", 'PET-0003', "CRMV-GO 11223");

INSERT INTO tratamento(id, antibiotico, id_consulta, descricao_tratamento) VALUES
(UUID(), 0, @consulta_uuid_1, 'Tratar com banhos periódicos usando um shampoo anti sarna de sua preferencia.'),
(UUID(), 0, @consulta_uuid_2, 'Fazer massagens abdominais periódicas monitorando a melhora do animal ou não. Caso não haja melhora, retorne para mais exames.'),
(UUID(), 1, @consulta_uuid_3, 'Tomar o antibiótico de 8 em 8 horas, aumentar a temperatura e umidade do recinto, e reduzir o estresse do animal.');

INSERT INTO Especialidade (IDespecialidade, nome) VALUES
(1, 'Clínica Geral de Pequenos Animais'),
(2, 'Cirurgia Veterinária'),
(3, 'Animais Silvestres e Exóticos');

INSERT INTO Certificacao (NumeroRegistro, DataObtencao, InstituicaoCertificadora, CRMV_certif, ID_especialidade) VALUES
('REG-DF-24-001A', '2024-03-10', 'Conselho Federal de Medicina Veterinária', 'CRMV-DF 07439', 1),
('REG-DF-25-009B', '2025-07-22', 'Instituto de Biologia da Conservação', 'CRMV-DF 07439', 2),
('REG-GO-20-005C', '2020-08-01', 'Academia Brasileira de Cirurgia Vet', 'CRMV-GO 11223', 3);
