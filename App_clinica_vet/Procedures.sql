-- Pega os dados da consulta e do tratamento inicial, inserindo os respectivos dados em suas respectivas tabelas por meio da TRANSACTION
DELIMITER $$
CREATE PROCEDURE sp_registrar_consulta_e_tratamento(
	IN p_id_animal VARCHAR(10),
    IN p_crmv_vet VARCHAR(13),
    IN p_diagnostico VARCHAR(255),
    IN p_desc_tratamento VARCHAR(255),
    IN p_antibiotico BOOLEAN
)
BEGIN 
	DECLARE v_nova_consulta_id VARCHAR(36);
    DECLARE v_novo_tratamento_id VARCHAR(36);
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Erro ao registrar consulta e tratamento. A transação foi revertida.';
	END;
    
		START TRANSACTION;
    
    SET v_nova_consulta_id = UUID();
    SET v_novo_tratamento_id = UUID();
    
    INSERT INTO consulta (id, diagnostico, id_animal, CRMV_veterinario)
    VALUES (v_nova_consulta_id, p_diagnostico, p_id_animal, p_crmv_vet);
    
    INSERT INTO tratamento (id, antibiotico, id_consulta, descricao_tratamento)
    VALUES (v_novo_tratamento_id, p_antibiotico, v_nova_consulta_id, p_desc_tratamento);
    
    COMMIT;
    
END$$
DELIMITER ;


-- Recebe todos os dados do animal e o insere na tabela
DELIMITER $$
CREATE PROCEDURE sp_adicionar_novo_animal(
	IN p_rfid VARCHAR(10),
    IN p_especie VARCHAR(20),
    IN p_cpf_dono VARCHAR(11),
    IN p_nome VARCHAR(100),
    IN p_idade INT,
    IN p_porte VARCHAR(40)
)
BEGIN 
	INSERT INTO Animal(RFID, Especie, CPF_dono, Nome, Idade, Porte)
    VALUES (p_rfid, p_especie, p_cpf_dono, p_nome, p_idade, p_porte);
END$$
DELIMITER ;