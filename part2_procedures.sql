USE company;


-- PREPARAÇÃO: Criando tabelas fictícias para o desafio


CREATE TABLE IF NOT EXISTS ecommerce_products (
    id_prod INT AUTO_INCREMENT PRIMARY KEY,
    prod_name VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS uni_students (
    id_student INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    email VARCHAR(100)
);


-- PROCEDURE 1: Manipulação de Dados E-Commerce


DELIMITER //

CREATE PROCEDURE sp_manage_ecommerce(
    IN p_option INT,          -- Controle
    IN p_id INT,              -- ID (para update/delete)
    IN p_name VARCHAR(100),   -- Nome
    IN p_price DECIMAL(10,2)  -- Preço
)
BEGIN
    CASE p_option
        WHEN 1 THEN
            -- Inserção
            INSERT INTO ecommerce_products (prod_name, price) 
            VALUES (p_name, p_price);
            SELECT 'Produto inserido com sucesso!' AS Resultado;
            
        WHEN 2 THEN
            -- Atualização
            UPDATE ecommerce_products 
            SET prod_name = p_name, price = p_price 
            WHERE id_prod = p_id;
            SELECT 'Produto atualizado com sucesso!' AS Resultado;
            
        WHEN 3 THEN
            -- Remoção
            DELETE FROM ecommerce_products WHERE id_prod = p_id;
            SELECT 'Produto removido com sucesso!' AS Resultado;
            
        ELSE
            SELECT 'Opção inválida: use 1(Insert), 2(Update) ou 3(Delete)' AS Erro;
    END CASE;
END //

DELIMITER ;


-- PROCEDURE 2: Manipulação de Dados Universidade


DELIMITER //

CREATE PROCEDURE sp_manage_university(
    IN p_action INT,
    IN p_id INT,
    IN p_fname VARCHAR(50),
    IN p_email VARCHAR(100)
)
BEGIN
    IF p_action = 1 THEN
        INSERT INTO uni_students (first_name, email) 
        VALUES (p_fname, p_email);
        SELECT 'Aluno matriculado.' AS Msg;
        
    ELSEIF p_action = 2 THEN
        UPDATE uni_students 
        SET first_name = p_fname, email = p_email 
        WHERE id_student = p_id;
        SELECT 'Dados do aluno atualizados.' AS Msg;
        
    ELSEIF p_action = 3 THEN
        DELETE FROM uni_students WHERE id_student = p_id;
        SELECT 'Aluno removido.' AS Msg;
        
    ELSE
        SELECT 'Ação desconhecida.' AS Msg;
    END IF;
END //

DELIMITER ;

-- TESTES 
-- CALL sp_manage_ecommerce(1, NULL, 'Notebook', 3500.00);
-- CALL sp_manage_university(1, NULL, 'Carlos', 'carlos@uni.com');