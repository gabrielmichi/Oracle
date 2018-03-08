-----------------JOIN
--sempre que utilizar um alias, é obrigado a mencionar eles nas chamadas

--USING
--on s.setor_id = f.setor_id pode ser substituido por using
--using tira a ambguididade, não precisa usar qualificador
select nome,salario,setor_nome from funcionarios f join setores s using(setor_id);

--NATURAL JOIN
--O ORACLE DEDUZ A JUNÇÃO, NÃO USAR QUALIFICADOR
--natural join não deve ser usado com using
select nome,salario,setor_nome from funcionarios f natural join setores s;

--se realizar o from tabela (funcionarios,setores) realiza todas as combinações.
--cross join
--realiza todas as combinações

--------------------OUTER JOIN

----LEFT JOIN
--traz todos funcionários, mesmo que não tenha setor (tabela funcionarios)
--Qual operadores não são permitidos quando usamos um outer join? or e IN
select nome,salario,setor_nome from funcionarios f, setores s where f.setor_id = s.setor_id(+);
select nome,salario,setor_nome from funcionarios f left join setores s on f.setor_id = s.setor_id;

----Natural left join
--tenta deduzir a coluna para comparação
select nome,salario,setor_nome from funcionarios f natural left join setores s;

--RIGHT JOIN
select nome,salario,setor_nome from funcionarios f, setores s where f.setor_id(+) = s.setor_id;
select nome,salario,setor_nome from funcionarios f RIGHT join setores s on f.setor_id = s.setor_id;
select nome,salario,setor_nome from funcionarios f natural right join setores s;

--FULL JOIN
select nome,salario,setor_nome from funcionarios f FULL join setores s on f.setor_id = s.setor_id;
select nome,salario,setor_nome from funcionarios f NATURAL FULL join setores s;

--SELF JOIN (realiza relação com a mesma tabela)
--se mencionar o self join não funciona
select f.nome,g.nome from funcionarios f join funcionarios g on f.gerente_id = g.id;

----Union all
--numero de colunas e tipo iguais
--UNION ALL não remove os valores duplicados, UNION remove
--ORDER BY E GROUP BY SÓ FUNCIONA NO FINAL, ÚLTIMA QUERY
select nome,salario from funcionarios where setor_id = 2
union all
select nome,salario from funcionarios where nome like 'D%'


--INTERSECT
--TRAZ APENAS OS valores REPETIDOS
select nome from funcionarios where setor_id = 2 
intersect
select nome from funcionarios where like 'D%'

--MINUS
--TRAZ APENAS OS QUE NÃO SE REPETEM
select nome from funcionarios where setor_id = 2 
MINUS
select nome from funcionarios where like 'D%'

-----------------SUBQUERY
--SINAL DE > ESPERA REALIZAR A COMPARAÇÃO DE 1 VALOR
--COMPARA APENAS COM O ID = 5
select nome, salario from funcionarios where salario > (select salario from  funcionarios where ID = 5);

--PODE COMPARARAR COM MAIS DE UM REGISTRO
select nome, salario from funcionarios where salario > (select salario from  funcionarios where nome like 'D%');

--TRABALHAR COM MAIS DE 1 VALOR
--ANY
--Pega o menor dos registros pra comparar
select nome, salario from funcionarios where salario > any(select salario from  funcionarios where nome like 'D%');

--ALL
--Compara com o maior valor
select nome, salario from funcionarios where salario > ALL(select salario from  funcionarios where nome like 'D%');

--IN
--Traz o valor exato, por exemplo:
--2 pessoas começam com a letra D, valor 1800 e 2200, vai trazer todas as pessoas que ganham este valor.
select nome, salario from funcionarios where salario IN(select salario from  funcionarios where nome like 'D%');

--tem diferença maiusculo de minuscula
select nome, salario from funcionarios where setor_id = (select setor_id from setores where setor_nome = 'Financeiro');

--retorna que não tem dados
select nome, salario from funcionarios where setor_id = null
--retorna os valores nulos
select nome, salario from funcionarios where setor_id is null

--faz a comparação para mostrar o maior salário do setor 2
select nome, salario from funcionarios where salario = (select max(salario) from funcionarios where setor_id = 2)

--alias para pegar o maior salario de cada setor
select nome, salario from funcionarios f1 where salario = (select max(salario) from funcionarios f2 where f2.setor_id = f1.setor_id)


-----executa
--pode ser utilizado group by dentro e fora da subquery
select setor_id, count(*)
from funcionarios
group by setor_id
having count(setor_id) = 
(select max(count(setor_id))
from funcionarios
group by setor_id);

--Teremos como retorno o salário, a média do salário e a diferença da média para cada funcionário.
select setor_id, nome, salario salario, media, salario-media diferenca 
from funcionarios, 
(select setor_id si, avg(salario) media 
from funcionarios 
group by setor_id) 
where setor_id = si order by 1,2;

--ANOTAÇÕES
--Todas as outras queries são inválidas, já que usam order by dentro de uma subquery que se encontra no where.
--order by pode ser utilizada em subquery antes do FROM.
