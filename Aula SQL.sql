-- principais funções 

-- Matemáticas: Trunc, Abs, Mod, Sqrt...

-- Strings: Strlen ou Length, substr, to_int...

--Datas: Now, Timestamp...

--Funções Estáticas:

Select count(*) from Unidade where Pais = 'Brasil'

Select sum(habitante, avg(habitantes)) from Unidade where Pais ='Brasil'

-- Agrupamento, clausula Group By, agrupar tuplas que tenham o mesmo valor nos atributos listados nela:

Select lista de campos from tabela
Where restrição 
Group By lista de campos 

--  Clausula Having: Usada para criar restrições sobre as agregações ou campos usados no agrupamento

Select Lista de Campo from tabela
Where restrição
Group By Lista de Campos
Having Restrição Sobre Agregações

--

Select pais, sum(habitantes) as "População" from Unidade Group by pais
Having sum(habitantes) > 100.000.000

-- Order By: Ordenar resultado por determinado campo

Select Lista de Campos from Tabela
Where Restrição
Group By Lista de Campos
Having Restrição sobre agregações
Order By Lista de Campos

--

Select nome, pais, habitantes from 
Where pais like 'Br%'
Order by habitantes desc
--

-- para evitar tuplas duplicadas usar distinct

Select distinct pais from Unidade


