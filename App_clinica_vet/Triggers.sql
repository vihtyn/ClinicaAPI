-- TRIGGERS

-- TRIGGER Guarda infrmações importantes toda vez que uma consulta é deletada
DELIMITER $$
CREATE TRIGGER trg_log_delete_consulta
AFTER DELETE ON consulta
FOR EACH ROW
BEGIN
	INSERT INTO log_auditoria(
		acao_realizada,
        tabela_afetada,
        id_registro_afetado,
        data_hora
        )
	VALUES(
		'DELETE na tabela consulta',
        'consulta',
        OLD.id,
        NOW()
        );
END$$
DELIMITER ;


-- Impossibilita a exclusão de veterinários caso tenham consultas relacionadas à ele no sistema
DELIMITER $$
CREATE TRIGGER trg_checar_consultas_before_delete_vet
BEFORE DELETE ON veterinario
FOR EACH ROW
BEGIN
	DECLARE consulta_count INT;
    SELECT COUNT(*)
    INTO consulta_count
    FROM consulta
    WHERE CRMV_veterinario = OLD.CRMV;
    
    IF consulta_count > 0 THEN 
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERRO: Este veterinario nao pode ser deletado pois esta associado a consultas no historico.';
        END IF;

END$$
DELIMITER ;