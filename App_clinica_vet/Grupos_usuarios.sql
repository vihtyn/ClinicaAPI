-- Criação do usuário administrador que tem perissão para fazer o que quiser
CREATE USER 'clinica_app'@'localhost' IDENTIFIED BY 'senha_forte_do_app_123';
GRANT SELECT, INSERT, UPDATE, DELETE ON clinica.* TO 'clinica_app'@'localhost';
GRANT EXECUTE ON clinica.* TO 'clinica_app'@'localhost';

-- Criação do perfil de funcionário que só não tem permissão para deletar informações do banco
CREATE USER 'clinica_funcionario'@'localhost' IDENTIFIED BY 'senha_leitura_456';
GRANT SELECT, INSERT, UPDATE ON clinica.* TO 'clinica_funcionario'@'localhost';
GRANT EXECUTE ON clinica.* TO 'clinica_funcionario'@'localhost';

-- Garantia da criação dos usuários
FLUSH PRIVILEGES;