-- Criação da tabela "Filmes"
CREATE TABLE Filmes (
id int primary key auto_increment,
titulo varchar(60),
minutos int
);

-- Criação da Trigger
delimiter $
create trigger chk_minutos 
before insert on Filmes
for each row
begin
	if new.minutos <0 then
    
		-- Lançar um Erro 
        signal SQLSTATE '45000' -- exceção não tratada
        set MESSAGE_TEXT = "Valor errado para minutos",
        MYSQL_ERRNO = 2022; -- código de erro pra controle
	end if;
end$
delimiter ;

insert into Filmes (titulo, minutos) values ("Kung Fu Panda", -120); 

create table Log_deletion (
id int primary key auto_increment,
titulo varchar(60),
quando datetime,
quem varchar(40)
);

delimiter $
create trigger log_deletion after delete on Filmes
	for each row
	begin
		insert into Log_deletion values (null, old.titulo, sysdate(), user ());
	end$
delimiter ;

insert into Filmes (titulo, minutos) values ("Star Wars Episódio VI", 150);
insert into Filmes (titulo, minutos) values ("Harry Potter e o Cálice de Fogo", 120);
insert into Filmes (titulo, minutos) values ("O Senhor dos Anéis", 240);
insert into Filmes (titulo, minutos) values ("Matrix", 90);
insert into Filmes (titulo, minutos) values ("Vingadores Guerra Infinita", -88);
insert into Filmes (titulo, minutos) values ("Duna", 110);
insert into Filmes (titulo, minutos) values ("Barbie", 0);
insert into Filmes (titulo, minutos) values ("Pobres Criaturas", 120);

delete from Filmes where id = 2;
delete from Filmes where id = 4;

select * from Log_deletion;
select * from Filmes;