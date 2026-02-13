-- Treino Joins e Agregacao 02
-- Objetivo: praticar JOINs e agregacoes basicas.
-- Use tabelas: pedidos(id, cliente_id, total, criado_em)
-- e itens_pedido(id, pedido_id, produto, quantidade, preco_unitario)
-- e clientes(id, nome).

-- 1) Liste pedidos com nome do cliente.
SELECT p.id, c.nome, p.total, p.criado_em
FROM pedidos p
JOIN clientes c ON c.id = p.cliente_id;

-- 2) Liste pedidos com total maior que 200.
SELECT p.id, c.nome, p.total
FROM pedidos p
JOIN clientes c ON c.id = p.cliente_id
WHERE p.total > 200;

-- 3) Conte quantos pedidos cada cliente fez.
SELECT c.id, c.nome, COUNT(p.id) AS total_pedidos
FROM clientes c
LEFT JOIN pedidos p ON p.cliente_id = c.id
GROUP BY c.id, c.nome;

-- 4) Some o total gasto por cliente.
SELECT c.id, c.nome, COALESCE(SUM(p.total), 0) AS total_gasto
FROM clientes c
LEFT JOIN pedidos p ON p.cliente_id = c.id
GROUP BY c.id, c.nome;

-- 5) Liste itens de pedido com nome do cliente.
SELECT p.id AS pedido_id, c.nome, i.produto, i.quantidade, i.preco_unitario
FROM pedidos p
JOIN clientes c ON c.id = p.cliente_id
JOIN itens_pedido i ON i.pedido_id = p.id;

-- 6) Calcule o total por item (quantidade * preco_unitario).
SELECT i.pedido_id, i.produto, i.quantidade,
       i.preco_unitario, (i.quantidade * i.preco_unitario) AS total_item
FROM itens_pedido i;

-- 7) Calcule o total por pedido a partir dos itens.
SELECT i.pedido_id, SUM(i.quantidade * i.preco_unitario) AS total_calculado
FROM itens_pedido i
GROUP BY i.pedido_id;

-- 8) Compare total do pedido com total calculado (use JOIN).
SELECT p.id AS pedido_id, p.total, t.total_calculado
FROM pedidos p
JOIN (
  SELECT i.pedido_id, SUM(i.quantidade * i.preco_unitario) AS total_calculado
  FROM itens_pedido i
  GROUP BY i.pedido_id
) t ON t.pedido_id = p.id;

-- 9) Liste clientes sem pedidos.
SELECT c.id, c.nome
FROM clientes c
LEFT JOIN pedidos p ON p.cliente_id = c.id
WHERE p.id IS NULL;

-- 10) Liste o produto mais vendido por quantidade.
SELECT i.produto, SUM(i.quantidade) AS total_quantidade
FROM itens_pedido i
GROUP BY i.produto
ORDER BY total_quantidade DESC
LIMIT 1;

-- 11) Liste o produto com maior faturamento.
SELECT i.produto, SUM(i.quantidade * i.preco_unitario) AS total_faturado
FROM itens_pedido i
GROUP BY i.produto
ORDER BY total_faturado DESC
LIMIT 1;

-- 12) Liste pedidos com quantidade total de itens.
SELECT i.pedido_id, SUM(i.quantidade) AS total_itens
FROM itens_pedido i
GROUP BY i.pedido_id;

-- 13) Liste pedidos com mais de 3 itens.
SELECT i.pedido_id, SUM(i.quantidade) AS total_itens
FROM itens_pedido i
GROUP BY i.pedido_id
HAVING SUM(i.quantidade) > 3;

-- 14) Liste clientes e a media de valor dos pedidos.
SELECT c.id, c.nome, AVG(p.total) AS media_pedidos
FROM clientes c
JOIN pedidos p ON p.cliente_id = c.id
GROUP BY c.id, c.nome;

-- 15) Liste pedidos com itens e valor total calculado, ordenado pelo total.
SELECT p.id AS pedido_id, c.nome, t.total_calculado
FROM pedidos p
JOIN clientes c ON c.id = p.cliente_id
JOIN (
  SELECT i.pedido_id, SUM(i.quantidade * i.preco_unitario) AS total_calculado
  FROM itens_pedido i
  GROUP BY i.pedido_id
) t ON t.pedido_id = p.id
ORDER BY t.total_calculado DESC;
