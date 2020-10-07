-- ------------------------------------------------------------------------------------------------------------------------------------
create database Banca_de_Revistas;
use Banca_de_Revistas;

create table Revistas (
idRevista int primary key auto_increment,
nome varchar (40),
categoria varchar (30)
) auto_increment = 1;

select * from Revistas;

insert into Revistas (nome) values
('Ben 10 - O Krakken'),
('Quatro Rodas'),
('XBOX Edição 167'),
('Dragon Ball Super Mangá - Capítulo 64');

select * from Revistas;

update Revistas set categoria = 'Infantil' where idRevista in (1);
update Revistas set categoria = 'Automobilismo' where idRevista in (2);
update Revistas set categoria = 'Jogos' where idRevista in (3);

select * from Revistas;

insert into Revistas (nome, categoria) values
('Pica-Pau E Seus Amigos - Bandido do Trem', 'Infantil'),
('Recreio', 'Infantil'),
('PlayStation Edição 272', 'Jogos');

select * from Revistas;
desc Revistas;
alter table Revistas modify nome varchar(40);

desc Revistas;
alter table Revistas add column Periodicidade varchar (15);

desc Revistas;
select * from Revistas;

alter table Revistas drop column periodicidade;
select * from Revistas;

-- ------------------------------------------------------------------------------------------------------------------------------------
-- Próxima Tabela
-- ------------------------------------------------------------------------------------------------------------------------------------

create table Editora (
idEditora int primary key auto_increment,
nomeEditora varchar(40),
dataFund date
) auto_increment = 1000;

select * from Editora;

insert into Editora (nomeEditora, dataFund) values
('Man Of Action', '2006-02-04'),
('Editora Abril', '1960-04-08'),
('Editora Europa', '2017-11-03'),
('Shueisha', '2018-08-15'),
('Deomar Editora', '2010-05-05'),
('Editora Abril', '1969-05-28'),
('Editora Europa', '2011-11-11');

select * from Editora;

-- ------------------------------------------------------------------------------------------------------------------------------------