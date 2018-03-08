--CURSO 3
--valor * nulo = nulo
--SINGLE ROW FUNCTION(EXECUTADO PARA LINHA �NICA)
--nvl(coluna, 0) = zera coluna nula
--nvl2 pode alterar o valor caso a express�o n�o seja nula IF/ELSE
--nvl2(coluna/express�o, express�o se verdadeiro, 0 zerando o nulo)


case when salario is null then 800
when is not null then salario + salario * pct_comissao
else salario+100 end) as SalarioFinal

coalesce(salario + salario * pct_comissao, salario+100,800) as salarioFinal

--String
--A fun��o mais famosa ser� o ascii(), que ir� transformar um caracter para o n�mero correspondente na tabela asc, diferencia maiusculas e minusculas, apenas a primeira letra � considerada.

select ascii('A') as LetraA from dual;
--65

--a maioria das strings quando voc� passa nulo, retorna nulo.
select ascii(null) as LetraA from dual;
--nulo

--Processo contr�rio
select chr(65) as LetraA from dual;
--retorna 65

--comando instr
instr('texto','buscar','a partir','ocorrencia')
--diferencia mai�sculo de min�scula

--------------INSTRB -- caracteres

--procura primeiro registro "a" no rogerio
select instr('Rogerio','a') from dual;
--resultado 0 pois n�o possui ocorr�ncia

--procurar "o" na palavra Rog�rio
select instr('Rogerio','o') from dual;
--2 posi��o est� o primeiro "o"

--procurar por "ge"
select instr('Rogerio','ge') from dual;
--3 pois come�a na terceira posi��o

--procurar a partir do m (2 posi��o)
select instr('amanda','a',2) from dual;
--encontra na 3 posi��o

--procurar a partir do m (2 posi��o), por�m ignora primeira ocorr�ncia
select instr('amanda','a',2,2) from dual;
--encontra na 6 posi��o (2 ocorr�ncia)

--ver no nome do arquivo
select instr('desktop/compras.txt','.',1,1) from dual;
--procura pelo ponto no nome do arquivo (posi��o 16)

--come�a ao contr�rio
select instr('desktop/compras.mes.txt','.',-1,1) from dual;
--ao cont�rio 20


---------LENGTH --TAMANHO --conta caracteres
select length('renan') from dual;
--tamanho 5

---------LENGTHB --TAMANHO EM BYTES
select lengthb('renan') from dual;
--tamanho 5


--2 �ltimos caracteres precisam ser num�ricos
select instrb('desktop/compras.mes.txt','.','a','a') from dual;

--ERRO na linha 1:
--ORA-01722:numero invalido

--------------UPPER - MAIUSCULO

select upper('renan') from dual;
--RENAN

select upper(null) from dual; 
--nulo

--------------Lower - Min�sculo

select lower('Rua VerGueiro') from dual;
--rua vergueiro

--------------LPED (left pad)

--completa com * o nome at� completar 20 caracteres a esquerda
select lpad(nome,20,'*') from funcionarios;

--deixa em branco
select lpad(nome,20) from funcionarios;

--corta a palavra e deixa apenas 3
select lpad(nome,3) from funcionarios;

--------------RPED (right ped)
--completa com * o nome at� completar 20 caracteres a direita
select lpad(nome,20,'*') from funcionarios;

--------------LCRIM (tira caracter da resposta a esquerda)

--tira espa�o em branco
select lcrim('          felipe',' ') from dual;

--tira espa�o em branco e f
select lcrim('          felipe',' f') from dual;

--------------RCRIM (tira caracter a direita)

select rtrim('felipe            ',' ') from dual;
--apresenta apenas felipe

--------------TRIM - tira espa�o de ambos os lados
--ALTERAR FORMATO NO SELECT

select trim('*' from '***********VINICIUS************') from dual;
--tira "*" de ambos os lados

--trim com alias
select trim('*' from '***********VINICIUS************') as teste from dual;

--------------REPLACE
ARGUMENTOS (TEXTO,PROCURA,SUBSTITUI��O)

--trocar SR por senhor
select replace('sr julio','sr','senhor') from dual;

--remove o sr - terceiro parametro null
select replace('sr julio','sr',null) from dual;

--segundo parametro nulo, n�o altera nada
select replace('sr julio',null,'senhor') from dual;

--retorna nulo
select replace(null,'sr','senhor') from dual;


-------------Comando translate

--traduz os numeros pelas letras
select translate('r3n4n','1340','ieao') from dual;

--se n�o tiver correspondente ele recorta
select translate('r3n4n','1340','i') from dual;

--qualquer parametro nulo, ele anula tudo
select translate('r3n4n','1340',null) from dual;
select translate('r3n4n',null,'sapo') from dual;


--------------Comando Substr
--argumentos(busca,quando come�a considerar, quantos considerar)

--corta e mostra a partir do terceiro caractere
select substr('sr julio',3) from dual;

--ele mostra a partir do 4 caracter, 3 caracteres
select substr('sr julio',4,3) from dual;

-- com "-" ele conta de tr�s pra frente
select substr('sr julio',-4,3) from dual;


--busca pela posi��o e recorta para mostrar a exten��o
select substr('desktop/notas.mes.txt',instr('desktop/notas.mes.txt','.',-1,1)) from dual;

--remove o ponto
select substr('desktop/notas.mes.txt',instr('desktop/notas.mes.txt','.',-1,1)+1) from dual;


--SUBSTR retorna uma parte de uma string;
--INSTR retorna um n�mero;
--LPAD adiciona caracteres;
--LEAST n�o afeta a string;
--COUNT n�o pode ser aplicada em uma string.

--------------LEAST
--A fun��o least nos retorna o menor valor, deem uma olhada no exemplo abaixo:
select least(1,2,3,4,5) from dual;

--------------COUNT
--A fun��o count nos retorna quantas linhas existem em uma determinada tabela, confira no exemplo abaixo:
select count(nome_coluna) from nome_tabela;

--Como a fun��o NVL trabalha com valores nulos ela pode receber uma coluna de qualquer tipo. SUBSTR e RTRIM recebem s� string e ROUND e SIGN apenas n�meros.

--------------ROUND
--A fun��o round � usada para arredondamento de valores.
select round(127.24) from dual;


--------------SIGN
--A fun��o sign tem como retorno os crit�rios abaixo:
--Se n�mero < 0, ent�o a fun��o sign retorna -1
--Se n�mero = 0, ent�o a fun��o sign retorna 0
--Se n�mero > 0, ent�o a fun��o sign retorna 1

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

--pode setar o n�mero de casas decimais
select round(22/7,2) from dual;

--arredonda para 3,15
select round(3,145,2) from dual;

--arredonda 2 casas antes da v�rgula
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
--4 - sempre mostra o primeiro n�mero inteiro mais alto
select ceil(3.14) from dual;
--n�o funciona setando casas decimais

--retorna nulo
select ceil(null) from dual;

--retorna o n�mero -3
--negativos sempre vai apresentar o mesmo n�mero
select ceil(-3.14) from dual;

----------------FLOOR
--sempre arredonda para baixo
--resultado 2
select floor(2.9999999) from dual;


----------------sqrt (ra�z quadrada)
--9
select sqrt(81) from dual;
--n�o aceita negativos
select sqrt(-81) from dual;
--apresenta n�meri quebrado
select sqrt(88) from dual;

----------------power (pot�ncia)
--realiza 2x2x2 = 8
select power(2,3) from dual;
--realiza pot�ncia com valor negativo
select power(-5,3) from dual;

-----------------log (logaritmo)
select log(2,1024) from dual;
--n�o calcula valor negativo
select log(-2,1024) from dual;

-----------------EXP
--N�mero eperiano x2
select exp(2) from dual;

----------------LN
select ln(2.71828183) from dual;

----------------mod (resto da divis�o) arredonda para baixo com o floor
--3 resto da divis�o
select mod(13,5) from dual;

--------------remainder (arredonda para cima com o round)
--passou -2
select remainder(13,5) from dual;

--Qual das queries abaixo substituir� os �ltimos dois caracteres do sobrenome com XX quando executada na tabela funcionarios ?
select concat(substr(sobrenome,1,length(sobrenome)-2),'XX') from funcionarios;

--retorna primeiro valor n�o nulo
select coalesce(null, �Oracle �, �Certified�) from dual;