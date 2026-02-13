-- Treino Fundamentos 01
-- Objetivo: praticar selecao, filtros, ordenacao e limites.
-- Use uma base de exemplo com tabela clientes(id, nome, cidade, idade, ativo, criado_em).

-- 1) Liste todos os clientes.
SELECT *
FROM clientes;

-- 2) Liste apenas nome e cidade.
SELECT nome, cidade
FROM clientes;

-- 3) Liste clientes da cidade 'Sao Paulo'.
SELECT *
FROM clientes
WHERE cidade = 'Sao Paulo';

-- 4) Liste clientes com idade entre 18 e 30.
SELECT *
FROM clientes
WHERE idade BETWEEN 18 AND 30;

-- 5) Liste clientes ativos (ativo = 1).
SELECT *
FROM clientes
WHERE ativo = 1;

-- 6) Liste clientes criados em 2024 (ajuste conforme seu SGBD).
-- Exemplo generico usando intervalo.
SELECT *
FROM clientes
WHERE criado_em >= '2024-01-01'
  AND criado_em < '2025-01-01';

-- 7) Liste clientes ordenados por idade decrescente.
SELECT *
FROM clientes
ORDER BY idade DESC;

-- 8) Liste os 5 clientes mais novos.
SELECT *
FROM clientes
ORDER BY idade ASC
LIMIT 5;

-- 9) Liste clientes cujo nome comeca com 'A'.
SELECT *
FROM clientes
WHERE nome LIKE 'A%';

-- 10) Liste clientes de duas cidades especificas.
SELECT *
FROM clientes
WHERE cidade IN ('Sao Paulo', 'Rio de Janeiro');

-- 11) Liste clientes com idade nula.
SELECT *
FROM clientes
WHERE idade IS NULL;

-- 12) Conte quantos clientes existem por cidade.
SELECT cidade, COUNT(*) AS total
FROM clientes
GROUP BY cidade;

-- 13) Liste cidades com mais de 3 clientes.
SELECT cidade, COUNT(*) AS total
FROM clientes
GROUP BY cidade
HAVING COUNT(*) > 3;

-- 14) Liste clientes com idade fora do intervalo 18-60.
SELECT *
FROM clientes
WHERE idade < 18 OR idade > 60;

-- 15) Liste clientes ordenados por cidade e nome.
SELECT *
FROM clientes
ORDER BY cidade ASC, nome ASC;
