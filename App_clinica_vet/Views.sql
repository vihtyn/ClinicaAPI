-- Simplifica toda a query e retorna todos os participantes da consulta, dono, animal, veterinario, e as inforamções da propria consulta
CREATE VIEW v_ConsultasComp AS 
SELECT
	c.id AS consulta_id,
    c.diagnostico,
    a.Nome AS nome_animal,
    a.Especie,
    d.Nome AS nome_dono,
    d.CPF AS cpf_dono,
    v.nome AS nome_veterinario,
    v.CRMV
FROM
	consulta c
JOIN 
	Animal a ON c.id_animal = a.RFID
JOIN 
	Dono d ON a.CPF_dono = d.CPF
JOIN
	veterinario v ON c.CRMV_veterinario = v.CRMV;


-- Simplifica a query que retorna os veterinários seus CRMVs e suas respectivas especialidades
CREATE VIEW v_VetEspecialidades AS
SELECT 
	v.nome AS nome_veterinario,
    v.CRMV,
    e.nome AS nome_especialidade
FROM 
	veterinario v
JOIN 
	Certificacao c ON v.CRMV = c.CRMV_certif
JOIN
	Especialidade e ON c.ID_especialidade = e.IDespecialidade;
