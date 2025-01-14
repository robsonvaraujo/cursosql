DELIMITER //
CREATE PROCEDURE insere_dados()
BEGIN
DECLARE erro_sql TINYINT DEFAULT FALSE;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro_sql = TRUE;
START TRANSACTION;
  INSERT INTO dados_livros (titulo, isbn, preco_do_livro) VALUES
    ('Um maluco na parada', '5155846425', 20.00);
  INSERT INTO dados_livros (titulo, isbn, preco_do_livro) VALUES
    ('Avante esquadrão', '96521555', 30.30);
  INSERT INTO dados_livros (titulo, isbn, preco_do_livro) VALUES
    ('Politica de um homem só', '899594546161', 80.32);
  INSERT INTO dados_livros (titulo, isbn, preco_do_livro) VALUES
    ('O vento derrubou', '59464485445', 70.00); # Aqui há um erro que impedirá o COMMIT e provocará o ROLLBACK.
  IF erro_sql = FALSE THEN
    COMMIT;
    SELECT 'Transação efetivada com sucesso.' AS Resultado;
  ELSE
    ROLLBACK;
    SELECT 'Erro na transação' AS Resultado;
  END IF;
END//
DELIMITER ;

CALL insere_dados();