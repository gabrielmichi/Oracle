select count(id) from funcionarios2;

------------GROUP BY
--group by não pode usar alias
--group by também não aceita números

select setor_id from funcionarios2 group by setor_id;

--conta mostrando a quantidade por setor
select setor_id as setor,count(id) from funcionarios2 group by setor_id;

--ordem das colunas influencia no retorno
select setor_id as setor, salario, count(id) as qtdFuncionarios from funcionarios2 group by setor_id, salario;

--ordenando pelo countid
select setor_id as setor,salario,count(id) as qtdfuncionarios from funcionarios2 group by salario,setor_id order by count(id);   

--consegue ordenar com aliás
select setor_id as setor,salario,count(id) as qtdfuncionarios from funcionarios2 group by salario,setor_id order by qtdfuncionarios; 

--é possível ordenar informando o número da coluna
select setor_id as setor,salario,count(id) as qtdfuncionarios group by salario,setor_id order by 3;

--função de soma precisa do group by
select sigla, sum(faturamentoBruto), sum(faturamentoLiquido), sum(receitaObtida) 
from vendas 
where trunc(dataVenda,'Q') 
between '01-ABR-2010' and '01-SET-2010' and 
sigla in('SP', 'RJ', 'MA') 
group by sigla;

--HAVING E WHERE
select sum(salario),setor_id from funcionarios 
having sum(salario) > 1500 
group by setor_id;

where é aplicado em linhas
having é aplicado em grupos

--exeplica como query é executada
set autotrace on ses
set autotrace off

----ROLLUP
--rollup calcula o subtotal
select sum(salario), count(*), setor_id from funcionarios2 
having sum(salario) > 1500 
group by rollup (setor_id, salario);

----CUBE
--todas as comibnações possíveis
select sum(salario),count(*), setor_id 
from funcionarios2 
having sum(salario) > 1500 
group by cube (setor_id,salario)
order by setor_id;



---------------------------------------------------------------
select nome, salario from funcionarios;

--varchar fala coluna inválida
select avg(nome) from funcionarios;

--média setor
select avg(salario),setor_id from funcionarios group by setor_id;

--considera as repetições (PADRÃO)
select avg(all nome) from funcionarios;

--TIRA AS REPETIÇÕES
select avg(DISTINCT nome) from funcionarios;

--ignora nulos, excluindo da conta
select avg(salario + salario * pct_comissao) from funcionarios;

--zerando os nulos
select salario+salario*nvl(pct_comissao,0) from funcionarios

--conta completa com avg
select avg(salario+salario*nvl(pct_comissao,0)) from funcionarios


--conta quantidade de registros, independente de nulos
select count(*) from funcionarios;

--todo mundo tem salário
select count(salario) from funcionarios;

--tira os repetidos
select count(distinct salario) from funcionarios;


------------------------MAX e MIN

select max(salario) as MaiorSalario, min(salario) as MenorSalario from funcionarios group by setor_id;

--max e min pode ser aplicado em varchar
select min(nome) from funcionarios;

--sum zerando os nulos
select sum(salario + salario * nvl(pct_comissao,0)) from funcionarios;

--soma de valores não repetidos
select sum(distinct salario) from funcionarios;

--pegar mediana
select median(salario) from funcionarios;

--mediana de texto --erro, apenas campos numéricos
select median(nome) from funcionarios;

--desvio padrão
select stdev(salario) from funcionarios;

--arredonda 2 cadas depois da vírgula
select round(stdev(salario),-2) from funcionarios;


select (avg(salario) + round(stdev(salario),-2) as Maximo, (avg(salario) - round(stdev(salario),-2)) as Minimo from funcionarios;

--variancia é o quadrado do desvio padrão
select variance(salario) from funcionarios;

--desvio padrão é a raiz quadrada da variancia
select sqrt(variance)) as DesvioPadrao from funcionarios

--Essa query nos retorna a quantidade de caracteres diferentes que iniciam o nome de nossos funcionários!
select count(distinct substr(nome, 1,1)) from funcionarios;

--Queremos gerar um relatório com o maior salário de cada departamento.
select setor_id,max(salario) from funcionarios group by setor_id;