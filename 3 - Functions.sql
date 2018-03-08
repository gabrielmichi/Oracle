--CURSO 3
--valor * nulo = nulo
--SINGLE ROW FUNCTION(EXECUTADO PARA LINHA ÚNICA)
--nvl(coluna, 0) = zera coluna nula
--nvl2 pode alterar o valor caso a expressão não seja nula IF/ELSE
--nvl2(coluna/expressão, expressão se verdadeiro, 0 zerando o nulo)


case when salario is null then 800
when is not null then salario + salario * pct_comissao
else salario+100 end) as SalarioFinal

coalesce(salario + salario * pct_comissao, salario+100,800) as salarioFinal

--String
--A função mais famosa será o ascii(), que irá transformar um caracter para o número correspondente na tabela asc, diferencia maiusculas e minusculas, apenas a primeira letra é considerada.

select ascii('A') as LetraA from dual;
--65

--a maioria das strings quando você passa nulo, retorna nulo.
select ascii(null) as LetraA from dual;
--nulo

--Processo contrário
select chr(65) as LetraA from dual;
--retorna 65

--comando instr
instr('texto','buscar','a partir','ocorrencia')
--diferencia maiúsculo de minúscula

--------------INSTRB -- caracteres

--procura primeiro registro "a" no rogerio
select instr('Rogerio','a') from dual;
--resultado 0 pois não possui ocorrência

--procurar "o" na palavra Rogério
select instr('Rogerio','o') from dual;
--2 posição está o primeiro "o"

--procurar por "ge"
select instr('Rogerio','ge') from dual;
--3 pois começa na terceira posição

--procurar a partir do m (2 posição)
select instr('amanda','a',2) from dual;
--encontra na 3 posição

--procurar a partir do m (2 posição), porém ignora primeira ocorrência
select instr('amanda','a',2,2) from dual;
--encontra na 6 posição (2 ocorrência)

--ver no nome do arquivo
select instr('desktop/compras.txt','.',1,1) from dual;
--procura pelo ponto no nome do arquivo (posição 16)

--começa ao contrário
select instr('desktop/compras.mes.txt','.',-1,1) from dual;
--ao contário 20


---------LENGTH --TAMANHO --conta caracteres
select length('renan') from dual;
--tamanho 5

---------LENGTHB --TAMANHO EM BYTES
select lengthb('renan') from dual;
--tamanho 5


--2 últimos caracteres precisam ser numéricos
select instrb('desktop/compras.mes.txt','.','a','a') from dual;

--ERRO na linha 1:
--ORA-01722:numero invalido

--------------UPPER - MAIUSCULO

select upper('renan') from dual;
--RENAN

select upper(null) from dual; 
--nulo

--------------Lower - Minúsculo

select lower('Rua VerGueiro') from dual;
--rua vergueiro

--------------LPED (left pad)

--completa com * o nome até completar 20 caracteres a esquerda
select lpad(nome,20,'*') from funcionarios;

--deixa em branco
select lpad(nome,20) from funcionarios;

--corta a palavra e deixa apenas 3
select lpad(nome,3) from funcionarios;

--------------RPED (right ped)
--completa com * o nome até completar 20 caracteres a direita
select lpad(nome,20,'*') from funcionarios;

--------------LCRIM (tira caracter da resposta a esquerda)

--tira espaço em branco
select lcrim('          felipe',' ') from dual;

--tira espaço em branco e f
select lcrim('          felipe',' f') from dual;

--------------RCRIM (tira caracter a direita)

select rtrim('felipe            ',' ') from dual;
--apresenta apenas felipe

--------------TRIM - tira espaço de ambos os lados
--ALTERAR FORMATO NO SELECT

select trim('*' from '***********VINICIUS************') from dual;
--tira "*" de ambos os lados

--trim com alias
select trim('*' from '***********VINICIUS************') as teste from dual;

--------------REPLACE
ARGUMENTOS (TEXTO,PROCURA,SUBSTITUIÇÃO)

--trocar SR por senhor
select replace('sr julio','sr','senhor') from dual;

--remove o sr - terceiro parametro null
select replace('sr julio','sr',null) from dual;

--segundo parametro nulo, não altera nada
select replace('sr julio',null,'senhor') from dual;

--retorna nulo
select replace(null,'sr','senhor') from dual;


-------------Comando translate

--traduz os numeros pelas letras
select translate('r3n4n','1340','ieao') from dual;

--se não tiver correspondente ele recorta
select translate('r3n4n','1340','i') from dual;

--qualquer parametro nulo, ele anula tudo
select translate('r3n4n','1340',null) from dual;
select translate('r3n4n',null,'sapo') from dual;


--------------Comando Substr
--argumentos(busca,quando começa considerar, quantos considerar)

--corta e mostra a partir do terceiro caractere
select substr('sr julio',3) from dual;

--ele mostra a partir do 4 caracter, 3 caracteres
select substr('sr julio',4,3) from dual;

-- com "-" ele conta de trás pra frente
select substr('sr julio',-4,3) from dual;


--busca pela posição e recorta para mostrar a extenção
select substr('desktop/notas.mes.txt',instr('desktop/notas.mes.txt','.',-1,1)) from dual;

--remove o ponto
select substr('desktop/notas.mes.txt',instr('desktop/notas.mes.txt','.',-1,1)+1) from dual;


--SUBSTR retorna uma parte de uma string;
--INSTR retorna um número;
--LPAD adiciona caracteres;
--LEAST não afeta a string;
--COUNT não pode ser aplicada em uma string.

--------------LEAST
--A função least nos retorna o menor valor, deem uma olhada no exemplo abaixo:
select least(1,2,3,4,5) from dual;

--------------COUNT
--A função count nos retorna quantas linhas existem em uma determinada tabela, confira no exemplo abaixo:
select count(nome_coluna) from nome_tabela;

--Como a função NVL trabalha com valores nulos ela pode receber uma coluna de qualquer tipo. SUBSTR e RTRIM recebem só string e ROUND e SIGN apenas números.

--------------ROUND
--A função round é usada para arredondamento de valores.
select round(127.24) from dual;


--------------SIGN
--A função sign tem como retorno os critérios abaixo:
--Se número < 0, então a função sign retorna -1
--Se número = 0, então a função sign retorna 0
--Se número > 0, então a função sign retorna 1

select sign(-100) from dual;
select sign(0) from dual;
select sign(234) from dual;
select sign(null) from dual; --retorna nulo

--mesmo resultado
select nome, nvl2(salario, salario, 0) as n1 , nvl(salario,0) as n2 from funcionarios;

--------------ABS
retorna valor absoluto, sem sinal
select abs(-35) from dual;

--retorna zero, se colocar null (retorna nulo)
select abs(0) from dual;

--------------ROUND (ARREDONDA NUMERO)

--arredonda para 3
select round(22/7) from dual;

--pode setar o número de casas decimais
select round(22/7,2) from dual;

--arredonda para 3,15
select round(3,145,2) from dual;

--arredonda 2 casas antes da vírgula
select round(1235.55,-2) from dual;


--------------TRUNC

--trunca para 3
select trunc(3,1415) from dual;

--trunca para 3
select trunc(3.9415) from dual;

--com 2 casas decimais
select trunc(3.9415,2) from dual;

--retorna nulo
select trunc(3.9415,null) from dual;

--------------CEIL
--4 - sempre mostra o primeiro número inteiro mais alto
select ceil(3.14) from dual;
--não funciona setando casas decimais

--retorna nulo
select ceil(null) from dual;

--retorna o número -3
--negativos sempre vai apresentar o mesmo número
select ceil(-3.14) from dual;

----------------FLOOR
--sempre arredonda para baixo
--resultado 2
select floor(2.9999999) from dual;


----------------sqrt (raíz quadrada)
--9
select sqrt(81) from dual;
--não aceita negativos
select sqrt(-81) from dual;
--apresenta númeri quebrado
select sqrt(88) from dual;

----------------power (potência)
--realiza 2x2x2 = 8
select power(2,3) from dual;
--realiza potência com valor negativo
select power(-5,3) from dual;

-----------------log (logaritmo)
select log(2,1024) from dual;
--não calcula valor negativo
select log(-2,1024) from dual;

-----------------EXP
--Número eperiano x2
select exp(2) from dual;

----------------LN
select ln(2.71828183) from dual;

----------------mod (resto da divisão) arredonda para baixo com o floor
--3 resto da divisão
select mod(13,5) from dual;

--------------remainder (arredonda para cima com o round)
--passou -2
select remainder(13,5) from dual;

--Qual das queries abaixo substituirá os últimos dois caracteres do sobrenome com XX quando executada na tabela funcionarios ?
select concat(substr(sobrenome,1,length(sobrenome)-2),'XX') from funcionarios;

--retorna primeiro valor não nulo
select coalesce(null, ‘Oracle ‘, ‘Certified’) from dual;