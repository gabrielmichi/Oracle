-----------INSERT
--forma declarativa
INSERT into funcionarios (id,nome,salario,pct_comissao,gerente_id,setor_id)
values (1, 'Rogerio', 1800, 0, null, null);

--insere sem informar coluna
insert into funcionarios(3,'Felipe', 3000, 0, null, null);

--insert com select
insert into contas (funconario_id, nome, salariobase, saldo)
(select id, nome, salario, 0 from funcionarios where id = 3);

--subquery sem informar valores
insert into contas
(select id, nome, salario, 0 from funcionarios where id = 2);


-----------UPDATE
--palavra set é obrigatório, where é opcional
update funcionarios set nome = 'Rogerio Alves' where id = 2;
update funcionarios set salario = 3300 where id = 3;

--update com cálculo
update set salario = salario *1.1 where id = 3;
update set salario *= 1.1 where id = 3; --OCORRE ERRO

--mais de um update separado por ,
update set salario = salario *1.1, setor_id = 4 where id = 3;

--update com select
update funcionarios set salario = 2000 where id in
(select id from funcionarios where setor_id is null);

--fazer o update setando o select no set
update funcionarios set setor_id = (select setor_id from funcionarios where id = 3);

--se retornar mais de uma valor dá erro
update funcionarios set setor_id = (select setor_id from funcionarios);

--Qual query vai atualizar todas as linhas da tabela funcionarios para apenas a data sem o horário.
update funcionarios set data_contratacao = trunc(data_contratacao), data_inicio = trunc(data_inicio)

-------------DELETE

delete from funcionarios where id = 3;
--Não precisa do from
delete funcionarios where id = 3;

--deletar funcionarios que não estão na empresa
delete from contas where funcionario_id not in(
select id from funcionarios);

--deletar com subquery
delete (select funcionario_id from contas where nome = 'Rogerio');

--DELETE GERA DADOS POIS CONSEGUE DESFAZER, UTILIZAR O TRUNCATE
--delete indices permanecem salvos
--truncate é DDL, comando para definir dados
truncate table contas;


----------Controle TRANSAÇÕES
--ROLLBACK DESFAZ TUDO
--LOGS MOVIMENTAÇÕES CONTA
--ROLLBACK TO SAVEPOINT CRIOU_LOG;
--savepoint com o mesmo nome perde o anterior;
-- merge e o select for update (INICIAM TRANSAÇÃO IMPLICITAMENTE)
select table_name from user_tables;

desc operacoes_log;

--SCRIPT EXEMPLO
declare novo_saldo number(10,2);
	begin
		insert into operacoes_log (id,quantidade,tipo,funcionario_id) values(8,400,'D',1);
	savepoint criou_log;
		update contas set saldo = saldo + 400 where funcionario = 1;
		select saldo into novo_saldo from contas where funcionario_id = 1;

	IF novo_saldo > 0 then
		commit;
	else
		--rollback; --commit até o savepoint
		ROLLBACK TO savepoint criou_log; 
		--ou rollback to criou_log;
	end if;
end;
/

--DDL TEM COMMIT AUTOMÁTICO;
CREATE TABLE (PRÓXIMO CAPITULO)

--commita automaticamente no com+
set exitcommit on 

