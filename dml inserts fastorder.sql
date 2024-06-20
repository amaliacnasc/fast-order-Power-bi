-- Inserir dados na tabela "Usuarios"
INSERT INTO usuarios (`id_usuario`, `nome`, `cpf`, `funcao`, `data_nascimento`, `email`, `senha`, `telefone`, `salario`) 
VALUES 
    ('1', 'João Silva', '12345678901', 'admin', '1990-01-01', 'joao@example.com', 'hashedpassword', '123456789', '5000.00'),
    ('2', 'Maria Silva', '98765432101', 'vendedor', '1995-02-02', 'maria@example.com', 'hashedpassword', '987654321', '5900.00'),
    ('3', 'Pedro Silva', '11111111111', 'fornecedor', '1990-03-03', 'pedro@example.com', 'hashedpassword', '111111111', '3500.00'),
    ('4', 'Luana Silva', '22222222222', 'vendedor', '1992-04-04', 'luana@example.com', 'hashedpassword', '222222222', '7800.00'),
    ('5', 'Rafael Silva', '33333333333', 'admin', '1995-05-05', 'rafael@example.com', 'hashedpassword', '333333333', '2500.00');

INSERT INTO `usuarios` (`id_usuario`, `nome`, `cpf`, `funcao`, `data_nascimento`, `email`, `senha`, `telefone`, `salario`) 
VALUES 
    ('6', 'João Santos', '12345678902', 'admin', '1990-01-01', 'joaosantos@example.com', 'hashedpassword', '123436789', '3500.00'),
    ('7', 'Maria Oliveira', '98765432102', 'vendedor', '1995-02-02', 'mariaoliveira@example.com', 'hashedpassword', '987653321', '1100.00'),
    ('8', 'Pedro Almeida', '11111111112', 'fornecedor', '1990-03-03', 'pedroalmeida@example.com', 'hashedpassword', '121111111', '1350.00'),
    ('9', 'Luana Pereira', '22222222223', 'vendedor', '1992-04-04', 'luanapereira@example.com', 'hashedpassword', '221222222','2500.00'),
    ('10', 'Rafael Souza', '33333333334', 'admin', '1995-05-05', 'rafaelsouza@example.com', 'hashedpassword', '333332333', '7800.00');
-- Inserir dados na tabela "produtos"
INSERT INTO `produtos` (`id_produto`, `nome`, `descricao`, `Tipo`) 
VALUES 
    ('1', 'Bolo de Chocolate', 'Barra de chocolate deliciosa e crocante, com um sabor intenso e agradável.', 'Doce'),
    ('2', 'Bolo de Morango', 'Salgadinho crocante e saboroso, com um toque de morango fresco e um sabor agradável.', 'Doce'),
    ('3', 'Pão Pizza', 'Bala doce e colorida, com um sabor agridoce e um toque de queijo.', 'Salgado'),
    ('4', 'Coxinha', 'Pão recém-assado, com um sabor agridoce e um toque de queijo.', 'Salgado'),
    ('5', 'Pastel', 'Biscoito amanteigado, com um sabor agridoce e um toque de queijo.', 'Salgado'),
    ('6', 'Bolo de Doce de Leite', 'Barra de chocolate deliciosa e crocante, com um sabor intenso e agradável.', 'Doce'),
    ('7', 'Bolo de Pote', 'Salgadinho crocante e saboroso, com um toque de morango fresco e um sabor agradável.', 'Doce'),
    ('8', 'Calzone', 'Bala doce e colorida, com um sabor agridoce e um toque de queijo.', 'Salgado'),
    ('9', 'Brigadeiro', 'Pão recém-assado, com um sabor agridoce e um toque de queijo.', 'Doce'),
    ('10', 'Mousse de Maracujá', 'Biscoito amanteigado, com um sabor agridoce e um toque de queijo.', 'Doce');
    
-- Inserir dados na tabela "itens_pedidos"

INSERT INTO `itens_pedidos` (`id_produto`, `id_pedido`, `quantidade`, `observacao`) 
VALUES 
    ('1', '1', 2, 'Sem nozes'),
    ('2', '1', 1, 'Com nozes'),
    ('3', '2', 3, 'Sabores variados'),
    ('4', '2', 2, 'Integral'),
    ('5', '3', 1, 'Amanteigado'),
    ('1', '3', 1, 'Chocolate amargo'),
    ('2', '3', 2, 'Creme azedo e cebola'),
    ('1', '4', 3, 'Chocolate com nozes'),
    ('2', '4', 2, 'Salgadinho integral'),
    ('3', '5', 1, 'Bala de chocolate'),
    ('4', '5', 2, 'Biscoito amanteigado'),
    ('5', '5', 1, 'Pão integral'),
    ('1', '11', 2, 'Sem nozes'),
    ('2', '11', 1, 'Com nozes'),
    ('3', '12', 3, 'Sabores variados'),
    ('4', '12', 2, 'Integral'),
    ('5', '13', 1, 'Amanteigado'),
    ('1', '13', 1, 'Chocolate amargo'),
    ('1', '14', 3, 'Chocolate com nozes'),
    ('2', '14', 2, 'Salgadinho integral'),
    ('3', '15', 1, 'Bala de chocolate'),
    ('4', '15', 2, 'Biscoito amanteigado'),
    ('5', '15', 1, 'Pão integral'),
    ('1', '16', 2, 'Sem nozes'),
    ('2', '16', 1, 'Com nozes'),
    ('3', '17', 3, 'Sabores variados'),
    ('4', '17', 2, 'Integral'),
    ('7', '8', 2, 'Biscoito amanteigado'),
    ('9', '9', 1, 'Pão integral'),
    ('10', '10', 2, 'Sem nozes'),
    ('1', '12', 1, 'Com nozes'),
    ('2', '12', 3, 'Sabores variados'),
    ('3', '13', 2, 'Integral'),
    ('4', '14', 1, 'Amanteigado');
-- Inserir dados na tabela "unidades"
INSERT INTO `unidades` (`id_unidade`, `nome`, `descricao`, `tipo`, `local`) 
VALUES 
    ('1', 'Cafeteria', 'Cafeteria senac', 'venda', ST_GeomFromText('POINT(1.2345 5.6789)')),
    ('2', 'Fornecedor escola', 'Fornecedor de produtos ', 'fornecimento', ST_GeomFromText('POINT(2.3456 6.7891)'));


-- Inserir dados na tabela "pedidos"
INSERT INTO `pedidos` (`id_pedido`, `data_criacao`, `previsao_entrega`, `data_recebimento`, `status`, `usuarios_idusuario`, `unidade_entrega`, `unidade_fornecimento`) 
VALUES 
    ('1', '2024-05-06 10:00:00', '2024-05-06 10:00:00', '2024-05-06 14:00:00', 'recebido', '1', '1', '2'),
    ('2', '2024-05-06 11:00:00', '2024-05-06 13:00:00', '2024-05-06 15:00:00', 'em producao', '2', '1', '2'),
    ('3', '2024-05-06 12:00:00', '2024-05-06 14:00:00', '2024-05-06 16:00:00', 'saiu para entrega', '3', '1', '2'),
    ('4', '2024-05-09 13:00:00', '2024-05-09 15:00:00', '2024-05-09 17:00:00', 'recebido com erro', '4', '1', '2'),
    ('5', '2024-05-10 14:00:00', '2024-06-10 16:00:00', '2024-05-10 18:00:00', 'em aberto', '5', '1', '2'),
    ('6', '2024-05-10 15:00:00', '2024-05-10 17:00:00', '2024-05-10 19:00:00', 'recebido', '1', '1', '2'),
    ('7', '2024-05-12 16:00:00', '2024-05-12 18:00:00', '2024-05-12 20:00:00', 'em producao', '2', '1', '2'),
    ('8', '2024-05-13 17:00:00', '2024-05-13 19:00:00', '2024-05-13 21:00:00', 'saiu para entrega', '3', '1', '2'),
    ('9', '2024-05-13 18:00:00', '2024-05-13 20:00:00', '2024-05-13 22:00:00', 'recebido com erro', '4', '1', '2'),
    ('10', '2024-05-13 19:00:00', '2024-06-13 21:00:00', '2024-05-13 23:00:00', 'em aberto', '5', '1', '2'),
    ('11', '2024-05-13 20:00:00', '2024-05-13 22:00:00', '2024-05-13 00:00:00', 'recebido', '1', '1', '2'),
    ('12', '2024-05-13 21:00:00', '2024-05-28 23:00:00', '2024-05-13 01:00:00', 'em producao', '2', '1', '2'),
    ('13', '2024-05-18 22:00:00', '2024-05-18 00:00:00', '2024-05-18 02:00:00', 'saiu para entrega', '3', '1', '2'),
    ('14', '2024-05-19 23:00:00', '2024-06-19 01:00:00', '2024-05-19 03:00:00', 'recebido com erro', '4', '1', '2'),
    ('15', '2024-05-20 00:00:00', '2024-06-20 02:00:00', '2024-05-20 04:00:00', 'em aberto', '5', '1', '2'),
    ('16', '2024-05-21 01:00:00', '2024-05-21 03:00:00', '2024-05-21 05:00:00', 'recebido', '1', '1', '2'),
    ('17', '2024-05-22 02:00:00', '2024-05-22 04:00:00', '2024-05-22 06:00:00', 'em producao', '2', '1', '2');
    -- Inserir dados na tabela "usuarios_unidades"
INSERT INTO `usuarios_unidades` (`id_usuario`, `id_unidade`, `data_inicial`, `data_final`) 
VALUES 
    ('1', '1', '2024-05-01', '2024-05-31'),
    ('2', '2', '2024-05-02', '2024-05-30'),
    ('3', '1', '2024-05-03', '2024-05-29'),
    ('4', '1', '2024-05-04', '2024-05-28'),
    ('5', '2', '2024-05-05', '2024-05-27');
    
    -- Inserir dados na tabela "usuarios_unidades"
INSERT INTO `usuarios_unidades` (`id_usuario`, `id_unidade`, `data_inicial`, `data_final`) 
VALUES 
    ('6', '1', '2024-05-01', '2024-05-31'),
    ('7', '2', '2024-05-02', '2024-05-30'),
    ('8', '2', '2024-05-03', '2024-05-29'),
    ('9', '2', '2024-05-04', '2024-05-28'),
    ('10', '1', '2024-05-05', '2024-05-27');