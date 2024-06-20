select * from USUARIOS;

select * from itens_pedidos;
select * from usuarios_unidades;
select * from pedidos;
select * from produtos;
select * from unidades;

-- 1 Quantidade de vezes que um produto foi vendido 
select 
p.id_produto as 'ID', 
nome as 'Nome', 
tipo as 'Tipo',
count(ip.id_pedido) as 'Quantidade de vendas'
from produtos  as p
inner join itens_pedidos as ip on ip.id_pedido = p.id_produto
group by p.id_produto
order by count(ip.id_pedido) desc;

-- 2 Relatório de usuários e a qual unidade ele pertence 
SELECT 
    u.id_usuario AS 'ID', 
    u.nome AS 'Nome', 
    u.cpf AS 'CPF', 
    CASE 
        WHEN u.funcao = 'vendedor' THEN 'Vendedor'
        WHEN u.funcao = 'admin' THEN 'Administrador'
        WHEN u.funcao = 'fornecedor' THEN 'Fornecedor'
    END AS 'Cargo', 
    u.email AS 'Email', 
    u.telefone AS 'Telefone',
    uni.nome AS 'Unidade'
FROM usuarios AS u
INNER JOIN  usuarios_unidades AS uu ON u.id_usuario = uu.id_usuario
INNER JOIN unidades as uni on uni.id_unidade = uu.id_unidade
ORDER BY u.funcao;

-- 3 Relatório de funcionários da cafeteria 
SELECT 
    u.id_usuario AS 'ID', 
    u.nome AS 'Nome', 
    u.cpf AS 'CPF',  u.email AS 'Email', 
    u.telefone AS 'Telefone',
    uni.nome AS 'Unidade'
FROM usuarios AS u
INNER JOIN  usuarios_unidades AS uu ON u.id_usuario = uu.id_usuario
INNER JOIN unidades as uni on uni.id_unidade = uu.id_unidade
HAVING uni.nome = 'Cafeteria';

-- 4 Relatório de funcionários que tenham  29 anos 
SELECT 
    u.id_usuario AS 'ID', 
    u.nome AS 'Nome', 
    u.cpf AS 'CPF',  u.email AS 'Email', 
   timestampdiff( year,u.data_nascimento, curdate())as 'Idade'
 FROM usuarios AS  u
 WHERE   timestampdiff( year,u.data_nascimento, curdate()) like 29;
 
-- 5 Quantidade de pedidos por dia 
SELECT COUNT(id_pedido) AS 'Quantidade de Pedidos',
       DATE_FORMAT(DATE(data_criacao), '%d/%m/%Y') AS 'Data'
FROM pedidos 
GROUP BY  DATE_FORMAT(DATE(data_criacao), '%d/%m/%Y') 
ORDER BY COUNT(id_pedido) DESC;

-- 6 Dia da semana que mais vende 
SET lc_time_names = 'pt_BR';
select count(id_pedido) as 'Quantidade de Pedidos',
upper(date_format(data_criacao, '%W' )) as 'Dia da semana'
from pedidos 
group by upper(date_format(data_criacao, '%W' ))
order by count(id_pedido) desc;

-- 7 Número total de vendas 
select count(*)  as 'Quantidade total de Pedidos' 
from pedidos;

-- 8 Produtos que estão em producao
select p.id_pedido as 'ID do Pedido', 
pro.nome as 'Produto', 
upper(p.status) as 'Status do pedido'
from pedidos as p
inner join itens_pedidos as ip on ip.id_pedido = p.id_pedido
inner join produtos as pro on pro.id_produto = ip.id_produto
where p.status = 'em producao';


-- 9 Número de pedidos com erro 
select count(id_pedido) as 'Quantidade de pedidos com erro'
from pedidos 
where status = 'recebido com erro';

-- 10 Quantidade de pedidos por status 
select count(id_pedido) as 'Quantidade de pedidos', 
upper(status) as 'Status'
from pedidos 
group by status;

-- 11 quantidade de vendas por produto

select count(ip.id_pedido) as 'Quantidade de pedidos', 
p.nome as 'Produto'
 from itens_pedidos  as ip
 inner join produtos as p on p.id_produto = ip.id_produto
 group by p.nome;

-- 12 Relatório de pedidos e usuários que fizeram estes pedidos 
select 
u.nome as 'Cliente', 
p.id_pedido as 'ID do pedido', 
date_format(p.data_criacao, '%d/%m/%Y' )as 'Data de criação', 
upper(p.status) as 'Status'
from pedidos as p
inner join usuarios as u on u.id_usuario = p.usuarios_idusuario; 

-- 13 usuario e quantidade de pedidos que ele tem 

select count(p.id_pedido) as 'Número de pedidos',
u.nome as 'Cliente'
from pedidos as p
inner join usuarios as u on u.id_usuario = p.usuarios_idusuario
group by usuarios_idusuario;

-- 14 Tempo médio de Processamento 
-- ajustar horas negativas 
select 
timediff(data_recebimento, data_criacao) as 'Tempo médio de Processamento' 
 from pedidos ;

-- 15 Media de pedidos diarios por tipo 
select * from itens_pedidos;
select count(ip.id_pedido)  as 'Quantidade de pedidos', 
upper(pro.tipo) as 'Tipo' 
from itens_pedidos as ip 
inner join produtos as pro on pro.id_produto = ip.id_produto
group by pro.tipo;

-- 16 Media salarial por função  
select 
case
when funcao = 'admin' then 'Administrador'
when funcao = 'vendedor' then 'Vendedor' 
when funcao = 'fornecedor' then 'Fornecedor' 
end  as 'Cargo' , 
concat('R$ ' , format(avg(salario), 2, 'de_De')) as 'Média salarial'
from usuarios
group by funcao;

-- 17 Relatorio de pedido com usuario , unidade de entrega e unicade de fornecimento 
select 
id_pedido as 'ID', 
date_format(data_criacao, '%d /%m /%Y') as 'Data de criação', 
date_format(previsao_entrega, '%d /%m /%Y') as 'Previsão de entrega', 
date_format(data_recebimento, '%d /%m /%Y')as 'Data de Recebimento', 
status as 'Status', 
u.nome as 'Usuário', 
uni.nome as 'Unidade' from pedidos as p
inner join usuarios as u on p.usuarios_idusuario = u.id_usuario
inner join unidades as uni on uni.id_unidade =  id_unidade
order by uni.nome;

-- 18 Quantidade de pedidos com o status 'recebido' 
select count(id_pedido) as 'Quantidade de pedidos', 
upper(status) as 'Status'
from pedidos 
group by status 
having status like 'recebido';

select * from pedidos;
-- 19 Pedidos que foram recebidos com erro
select  
pe.id_pedido,
pro.nome as 'Produto',
pe.status as 'Status'
from pedidos as pe
inner join itens_pedidos as ip on ip.id_pedido = pe.id_pedido
inner join produtos as pro on pro.id_produto = ip.id_produto
having pe.status like 'recebido com erro' ;

-- 20	Usuários que recebem menos de 3000 reais
select nome as 'Funcionário', 
 CASE 
        WHEN funcao = 'vendedor' THEN 'Vendedor'
        WHEN funcao = 'admin' THEN 'Administrador'
        WHEN funcao = 'fornecedor' THEN 'Fornecedor'
    END AS 'Cargo', 
concat('R$ ',format(salario, 2, 'de_DeF')) as 'Salário'
from usuarios 
 where salario <3000;
 
-- dar uma olhada e comparar esse ultimo relatorio com o primeiro relatorio, 1 deles ta errado 