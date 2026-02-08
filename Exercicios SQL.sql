-- ============================================
-- ARQUIVO DE EXERCÍCIOS PARA TREINO DE SQL
-- ============================================

-- Este arquivo contém exercícios práticos para treinar SQL
-- Tente resolver cada exercício antes de ver a solução

-- ============================================
-- PARTE 1: CRIAÇÃO DE TABELAS (DDL)
-- ============================================

-- Exercício 1: Crie uma tabela chamada "Clientes" com os seguintes campos:
-- - id (inteiro, chave primária, auto incremento)
-- - nome (varchar 100, não nulo)
-- - email (varchar 100, único)
-- - data_cadastro (data)
-- - cidade (varchar 50)

-- SOLUÇÃO:
/*
CREATE TABLE Clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    data_cadastro DATE,
    cidade VARCHAR(50)
);
*/

-- Exercício 2: Crie uma tabela chamada "Pedidos" com:
-- - id (inteiro, chave primária)
-- - cliente_id (inteiro, chave estrangeira para Clientes)
-- - data_pedido (data)
-- - valor_total (decimal 10,2)
-- - status (varchar 20)

-- SOLUÇÃO:
/*
CREATE TABLE Pedidos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    data_pedido DATE,
    valor_total DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id)
);
*/

-- ============================================
-- PARTE 2: INSERÇÃO DE DADOS (INSERT)
-- ============================================

-- Exercício 3: Insira 5 clientes na tabela Clientes com dados variados

-- SOLUÇÃO:
/*
INSERT INTO Clientes (nome, email, data_cadastro, cidade) VALUES
('João Silva', 'joao@email.com', '2024-01-15', 'São Paulo'),
('Maria Santos', 'maria@email.com', '2024-02-20', 'Rio de Janeiro'),
('Pedro Oliveira', 'pedro@email.com', '2024-03-10', 'Brasília'),
('Ana Costa', 'ana@email.com', '2024-04-05', 'São Paulo'),
('Carlos Souza', 'carlos@email.com', '2024-05-12', 'Belo Horizonte');
*/

-- Exercício 4: Insira 7 pedidos para os clientes cadastrados

-- SOLUÇÃO:
/*
INSERT INTO Pedidos (cliente_id, data_pedido, valor_total, status) VALUES
(1, '2024-01-20', 150.50, 'Entregue'),
(1, '2024-02-15', 200.00, 'Entregue'),
(2, '2024-03-01', 350.75, 'Em andamento'),
(3, '2024-03-15', 120.00, 'Cancelado'),
(4, '2024-04-10', 500.00, 'Entregue'),
(5, '2024-05-20', 280.50, 'Em andamento'),
(2, '2024-06-01', 175.25, 'Pendente');
*/

-- ============================================
-- PARTE 3: CONSULTAS BÁSICAS (SELECT)
-- ============================================

-- Exercício 5: Selecione todos os clientes

-- SOLUÇÃO:
/*
SELECT * FROM Clientes;
*/

-- Exercício 6: Selecione apenas o nome e email de todos os clientes

-- SOLUÇÃO:
/*
SELECT nome, email FROM Clientes;
*/

-- Exercício 7: Selecione todos os pedidos com valor maior que 200

-- SOLUÇÃO:
/*
SELECT * FROM Pedidos WHERE valor_total > 200;
*/

-- Exercício 8: Selecione todos os clientes da cidade de São Paulo

-- SOLUÇÃO:
/*
SELECT * FROM Clientes WHERE cidade = 'São Paulo';
*/

-- Exercício 9: Selecione todos os pedidos com status 'Entregue'

-- SOLUÇÃO:
/*
SELECT * FROM Pedidos WHERE status = 'Entregue';
*/

-- ============================================
-- PARTE 4: OPERADORES E FILTROS
-- ============================================

-- Exercício 10: Selecione pedidos com valor entre 100 e 300

-- SOLUÇÃO:
/*
SELECT * FROM Pedidos WHERE valor_total BETWEEN 100 AND 300;
*/

-- Exercício 11: Selecione clientes cujo nome começa com 'A'

-- SOLUÇÃO:
/*
SELECT * FROM Clientes WHERE nome LIKE 'A%';
*/

-- Exercício 12: Selecione pedidos com status 'Entregue' ou 'Em andamento'

-- SOLUÇÃO:
/*
SELECT * FROM Pedidos WHERE status IN ('Entregue', 'Em andamento');
*/

-- ============================================
-- PARTE 5: ORDENAÇÃO (ORDER BY)
-- ============================================

-- Exercício 13: Selecione todos os pedidos ordenados por valor (do maior para o menor)

-- SOLUÇÃO:
/*
SELECT * FROM Pedidos ORDER BY valor_total DESC;
*/

-- Exercício 14: Selecione todos os clientes ordenados por nome (ordem alfabética)

-- SOLUÇÃO:
/*
SELECT * FROM Clientes ORDER BY nome ASC;
*/

-- ============================================
-- PARTE 6: FUNÇÕES DE AGREGAÇÃO
-- ============================================

-- Exercício 15: Calcule o valor total de todos os pedidos

-- SOLUÇÃO:
/*
SELECT SUM(valor_total) as total_vendas FROM Pedidos;
*/

-- Exercício 16: Calcule a média de valor dos pedidos

-- SOLUÇÃO:
/*
SELECT AVG(valor_total) as media_pedidos FROM Pedidos;
*/

-- Exercício 17: Conte quantos pedidos existem no sistema

-- SOLUÇÃO:
/*
SELECT COUNT(*) as total_pedidos FROM Pedidos;
*/

-- Exercício 18: Encontre o maior valor de pedido

-- SOLUÇÃO:
/*
SELECT MAX(valor_total) as maior_pedido FROM Pedidos;
*/

-- Exercício 19: Encontre o menor valor de pedido

-- SOLUÇÃO:
/*
SELECT MIN(valor_total) as menor_pedido FROM Pedidos;
*/

-- ============================================
-- PARTE 7: AGRUPAMENTO (GROUP BY)
-- ============================================

-- Exercício 20: Conte quantos clientes existem por cidade

-- SOLUÇÃO:
/*
SELECT cidade, COUNT(*) as total_clientes 
FROM Clientes 
GROUP BY cidade;
*/

-- Exercício 21: Calcule o valor total de pedidos por status

-- SOLUÇÃO:
/*
SELECT status, SUM(valor_total) as total_por_status 
FROM Pedidos 
GROUP BY status;
*/

-- Exercício 22: Conte quantos pedidos cada cliente fez

-- SOLUÇÃO:
/*
SELECT cliente_id, COUNT(*) as total_pedidos 
FROM Pedidos 
GROUP BY cliente_id;
*/

-- ============================================
-- PARTE 8: HAVING (Filtros em Agregações)
-- ============================================

-- Exercício 23: Selecione cidades que têm mais de 1 cliente

-- SOLUÇÃO:
/*
SELECT cidade, COUNT(*) as total_clientes 
FROM Clientes 
GROUP BY cidade 
HAVING COUNT(*) > 1;
*/

-- Exercício 24: Selecione clientes que fizeram pedidos com valor total maior que 300

-- SOLUÇÃO:
/*
SELECT cliente_id, SUM(valor_total) as total_gasto 
FROM Pedidos 
GROUP BY cliente_id 
HAVING SUM(valor_total) > 300;
*/

-- ============================================
-- PARTE 9: JOINS (Junção de Tabelas)
-- ============================================

-- Exercício 25: Liste todos os pedidos com o nome do cliente (INNER JOIN)

-- SOLUÇÃO:
/*
SELECT Pedidos.id, Clientes.nome, Pedidos.data_pedido, Pedidos.valor_total, Pedidos.status
FROM Pedidos
INNER JOIN Clientes ON Pedidos.cliente_id = Clientes.id;
*/

-- Exercício 26: Liste todos os clientes e seus pedidos, incluindo clientes sem pedidos (LEFT JOIN)

-- SOLUÇÃO:
/*
SELECT Clientes.nome, Clientes.cidade, Pedidos.data_pedido, Pedidos.valor_total
FROM Clientes
LEFT JOIN Pedidos ON Clientes.id = Pedidos.cliente_id;
*/

-- Exercício 27: Liste pedidos com nome e email do cliente, ordenados por valor

-- SOLUÇÃO:
/*
SELECT Clientes.nome, Clientes.email, Pedidos.valor_total, Pedidos.status
FROM Pedidos
INNER JOIN Clientes ON Pedidos.cliente_id = Clientes.id
ORDER BY Pedidos.valor_total DESC;
*/

-- ============================================
-- PARTE 10: SUBCONSULTAS (SUBQUERIES)
-- ============================================

-- Exercício 28: Selecione clientes que fizeram pedidos acima da média

-- SOLUÇÃO:
/*
SELECT DISTINCT Clientes.nome, Clientes.email
FROM Clientes
INNER JOIN Pedidos ON Clientes.id = Pedidos.cliente_id
WHERE Pedidos.valor_total > (SELECT AVG(valor_total) FROM Pedidos);
*/

-- Exercício 29: Selecione o cliente que fez o pedido de maior valor

-- SOLUÇÃO:
/*
SELECT Clientes.nome, Pedidos.valor_total
FROM Clientes
INNER JOIN Pedidos ON Clientes.id = Pedidos.cliente_id
WHERE Pedidos.valor_total = (SELECT MAX(valor_total) FROM Pedidos);
*/

-- ============================================
-- PARTE 11: ATUALIZAÇÃO DE DADOS (UPDATE)
-- ============================================

-- Exercício 30: Atualize o status do pedido de id 3 para 'Entregue'

-- SOLUÇÃO:
/*
UPDATE Pedidos 
SET status = 'Entregue' 
WHERE id = 3;
*/

-- Exercício 31: Aumente em 10% o valor de todos os pedidos com status 'Pendente'

-- SOLUÇÃO:
/*
UPDATE Pedidos 
SET valor_total = valor_total * 1.10 
WHERE status = 'Pendente';
*/

-- Exercício 32: Atualize a cidade do cliente 'João Silva' para 'Campinas'

-- SOLUÇÃO:
/*
UPDATE Clientes 
SET cidade = 'Campinas' 
WHERE nome = 'João Silva';
*/

-- ============================================
-- PARTE 12: EXCLUSÃO DE DADOS (DELETE)
-- ============================================

-- Exercício 33: Delete todos os pedidos com status 'Cancelado'

-- SOLUÇÃO:
/*
DELETE FROM Pedidos WHERE status = 'Cancelado';
*/

-- Exercício 34: Delete clientes que não fizeram nenhum pedido

-- SOLUÇÃO:
/*
DELETE FROM Clientes 
WHERE id NOT IN (SELECT DISTINCT cliente_id FROM Pedidos);
*/

-- ============================================
-- PARTE 13: CONSULTAS AVANÇADAS
-- ============================================

-- Exercício 35: Liste o nome do cliente e o total gasto por cada um, ordenado do maior para o menor

-- SOLUÇÃO:
/*
SELECT Clientes.nome, SUM(Pedidos.valor_total) as total_gasto
FROM Clientes
INNER JOIN Pedidos ON Clientes.id = Pedidos.cliente_id
GROUP BY Clientes.nome
ORDER BY total_gasto DESC;
*/

-- Exercício 36: Liste as cidades e o valor médio dos pedidos dos clientes de cada cidade

-- SOLUÇÃO:
/*
SELECT Clientes.cidade, AVG(Pedidos.valor_total) as media_pedidos
FROM Clientes
INNER JOIN Pedidos ON Clientes.id = Pedidos.cliente_id
GROUP BY Clientes.cidade;
*/

-- Exercício 37: Conte quantos pedidos foram feitos em cada mês

-- SOLUÇÃO:
/*
SELECT MONTH(data_pedido) as mes, COUNT(*) as total_pedidos
FROM Pedidos
GROUP BY MONTH(data_pedido)
ORDER BY mes;
*/

-- Exercício 38: Liste clientes que fizeram mais de 1 pedido com status 'Entregue'

-- SOLUÇÃO:
/*
SELECT Clientes.nome, COUNT(*) as pedidos_entregues
FROM Clientes
INNER JOIN Pedidos ON Clientes.id = Pedidos.cliente_id
WHERE Pedidos.status = 'Entregue'
GROUP BY Clientes.nome
HAVING COUNT(*) > 1;
*/

-- ============================================
-- PARTE 14: DISTINCT e ELIMINAÇÃO DE DUPLICATAS
-- ============================================

-- Exercício 39: Liste todas as cidades únicas dos clientes

-- SOLUÇÃO:
/*
SELECT DISTINCT cidade FROM Clientes;
*/

-- Exercício 40: Liste todos os status únicos dos pedidos

-- SOLUÇÃO:
/*
SELECT DISTINCT status FROM Pedidos;
*/

-- ============================================
-- DESAFIOS EXTRAS
-- ============================================

-- Desafio 1: Crie uma consulta que mostre:
-- - Nome do cliente
-- - Total de pedidos feitos
-- - Valor total gasto
-- - Valor médio por pedido
-- Apenas para clientes que gastaram mais de 300 reais no total

-- SOLUÇÃO:
/*
SELECT 
    Clientes.nome,
    COUNT(Pedidos.id) as total_pedidos,
    SUM(Pedidos.valor_total) as total_gasto,
    AVG(Pedidos.valor_total) as media_por_pedido
FROM Clientes
INNER JOIN Pedidos ON Clientes.id = Pedidos.cliente_id
GROUP BY Clientes.nome
HAVING SUM(Pedidos.valor_total) > 300
ORDER BY total_gasto DESC;
*/

-- Desafio 2: Encontre clientes que nunca fizeram um pedido

-- SOLUÇÃO:
/*
SELECT Clientes.nome, Clientes.email
FROM Clientes
LEFT JOIN Pedidos ON Clientes.id = Pedidos.cliente_id
WHERE Pedidos.id IS NULL;
*/

-- Desafio 3: Calcule o ranking dos clientes por valor total gasto (do maior para o menor)

-- SOLUÇÃO:
/*
SELECT 
    Clientes.nome,
    SUM(Pedidos.valor_total) as total_gasto,
    RANK() OVER (ORDER BY SUM(Pedidos.valor_total) DESC) as ranking
FROM Clientes
INNER JOIN Pedidos ON Clientes.id = Pedidos.cliente_id
GROUP BY Clientes.nome;
*/

-- ============================================
-- FIM DOS EXERCÍCIOS
-- ============================================

-- Parabéns! Você completou todos os exercícios de SQL!
-- Continue praticando para melhorar suas habilidades.

-- Dicas para continuar estudando:
-- 1. Pratique criar suas próprias tabelas e cenários
-- 2. Experimente com diferentes tipos de JOINs
-- 3. Aprenda sobre índices e otimização de consultas
-- 4. Estude sobre transações e procedures
-- 5. Explore funções de janela (Window Functions)
