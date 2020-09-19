use adsb;
create table engenheiro(
CREA int primary key auto_increment,
Nome_Engeinheiro varchar (40),
sexo char(1),
check (sexo = 'F' or sexo = 'M'),
salario decimal (6,2)

);
create table dependente (
id_dependente int,
nome_dependente varchar (40),
fk_dependente int,
foreign key (fk_dependente) references engenheiro (CREA),
primary key(id_dependente, nome_dependente, fk_dependente),
data_nascimento date,
tipo_relacionamento char(7),
check(tipo_relacionamento = 'Conjuge' or tipo_relacionamento = 'Filho'));


create table Obra (
id_obra int primary key auto_increment,
nome_obra varchar (40),
local_obra varchar(40)
);

create table trabalha (
qtd_horas time,
fk_engenheiro int,
foreign key (fk_engenheiro ) references engenheiro (CREA),
fk_obra int,
foreign key (fk_obra) references Obra (id_obra),
primary key (qtd_horas, fk_engenheiro,fk_obra)

);
drop table dependente;
drop table trabalha;
alter table Obra modify column id_obra int auto_increment, auto_increment = 1000;
 insert into engenheiro (Nome_Engeinheiro, sexo, salario) values 
('Fabiano Martins', 'M', 4000.00 ),
('Giovanni Pires', 'M', 7000.00  ),
('Patricia Oliveira', 'F', 6000.00 ),
('Emily Regis', 'F', 4000.00 );

insert into dependente values 
( 1 ,'Daniele Oliveira', 1, '2000-12-20' ,'Filho'),
( 2 ,'Luzinete Oliveira',1,'1976-03-12', 'Conjuge' ),
( 1 ,'Marcos Pires', 2 ,'2005-07-26','Filho'),
( 2 ,'Marcela Pires ', 2 ,'2001-09-15' ,'Filho'),
(1 , 'Algusto Reges ', 4 , '1987-04-08', 'Conjuge');
 select * from dependente;
 insert into Obra (nome_obra, local_obra) values
('Casa', 'Itaquera'),
('Predio', 'Tatuape'),
('Escola', 'Paulista');
select * from Obra;
insert into trabalha values 
('00:06:00' , 2 , 1001),
('00:09:00' , 1 , 1000),
('00:08:00' , 4 , 1001),
('00:05:00' , 3 , 1002);
select * from trabalha;
select Nome_Engeinheiro from engenheiro;
update dependente set nome_dependente = 'Augusto Regis' where fk_dependente = 4;

select * from dependente;
select * from  dependente order by fk_dependente;

select * from engenheiro as eng , dependente as dep where dep.fk_dependente = eng.CREA;

select * from engenheiro as eng , dependente as dep where dep.fk_dependente = eng.CREA and eng.CREA = 1;

select * from engenheiro as eng , dependente as dep where dep.fk_dependente = eng.CREA and dep.tipo_relacionamento = 'Filho';

select * from engenheiro as eng , trabalha as tra, Obra as ob
where tra.fk_engenheiro = eng.CREA and tra.fk_obra = ob.id_obra ;
 
select tra.qtd_horas, eng.*, ob.* from engenheiro as eng , trabalha as tra, Obra as ob
where tra.fk_engenheiro = eng.CREA and tra.fk_obra = ob.id_obra ;

select tra.qtd_horas, eng.*, ob.* from engenheiro as eng , trabalha as tra, Obra as ob
where tra.fk_engenheiro = eng.CREA and tra.fk_obra = ob.id_obra and ob.id_obra = 1001;

select tra.qtd_horas, eng.*, ob.*, dep.* from engenheiro as eng , trabalha as tra, Obra as ob , dependente as dep
where tra.fk_engenheiro = eng.CREA and tra.fk_obra = ob.id_obra and dep.fk_dependente = eng.CREA ;

select tra.qtd_horas, eng.*, ob.*, dep.* from engenheiro as eng , trabalha as tra, Obra as ob , dependente as dep
where tra.fk_engenheiro = eng.CREA and tra.fk_obra = ob.id_obra and dep.fk_dependente = eng.CREA and ob.id_obra = 1001 ;

select sum(salario) as 'Soma dos Salários' from engenheiro;




select count(salario) as 'Média dos Salários' from engenheiro;

select min(salario) as 'Menor Salário' from engenheiro;

select distinct salario from engenheiro;
-- quantidade de salarios distintos
select count(distinct salario) from engenheiro;
-- renomear coluna
alter table engenheiro change Nome_Engeinheiro nome_engenheiro varchar(40);


select eng.nome_engenheiro as  'Nome do Engenheiro', dep.nome_dependente as 'Nome do Dependente', dep.tipo_relacionamento from engenheiro as eng, dependente as dep 
where dep.fk_dependente = eng.CREA;


delete from dependente where id_dependente = 1 and fk_dependente = '2';
select * from dependente;

select nome_engenheiro, salario from engenheiro;



 
