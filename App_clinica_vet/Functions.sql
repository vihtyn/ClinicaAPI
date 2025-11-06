-- Incrementa automaticmante na RFID dos animais
DELIMITER $$
CREATE FUNCTION fnc_gerar_proximo_rfid_animal()
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
	DECLARE proximo_numero INT;
    DECLARE proximo_rfid VARCHAR(10);
    SELECT COALESCE(MAX(CAST(SUBSTRING(RFID, 5) AS UNSIGNED)), 0)
    INTO proximo_numero
    FROM Animal
    WHERE RFID LIKE 'PET-%';
    
    SET proximo_numero = proximo_numero + 1;
    SET proximo_rfid = CONCAT('PET-', LPAD(proximo_numero, 4, '0'));
    RETURN proximo_rfid;
END$$
DELIMITER ;


-- Retorna a quantidade todal de consultas aquele animal ja teve
DELIMITER $$
CREATE FUNCTION fnc_contar_consultas_animal(p_rfid VARCHAR(10))
RETURNS INT 
READS SQL DATA
BEGIN 
	DECLARE total_consultas INT;
    SELECT COUNT(*)
    INTO total_consultas
    FROM consulta 
    WHERE id_animal = p_rfid;
    RETURN total_consultas;
END$$
DELIMITER ;
