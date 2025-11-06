-- Chama o procedure para cadastrar os animais
CALL sp_registrar_consulta_e_tratamento('PET-0001', 'CRMV-DF 07439', 'Sarna',  'Tratar com banho periódicos usando um shampoo anti sarna de sua preferência.', 0);
CALL sp_registrar_consulta_e_tratamento('PET-0002', 'CRMV-DF 07439', 'Gases', 'Fazer massagens abdominais periódicas monitorando a melhora do animal ou não.', 0);
CALL sp_registrar_consulta_e_tratamento('PET-0003', 'CRMV-GO 11223', 'Pneumonia bacteriana', 'Tomar antibiótico de 8 em 8 horas e aumentar a tempreatura.', 1);