-- Como estamos logados como usuário teste
-- não temos permissão parar criar database
-- o comando abaixo dará erro

create database teste;
use Filmes_EX;

-- o nosso usuário teste tem permissão de usar
-- apenas o schema (database) Filmes_EX
create table Filmes (
idFilme int primary key,
titulo varchar (50),
genero varchar (50),
diretor varchar (50)
);

select * from Filmes;

-- exibe a estrutura da tabela
desc Filmes;
describe Filmes;

-- Inserir dado de um filme
insert into Filmes values 
(01, 'Star Wars Episódio 1: A Ameaça Fantasma', 'Ficção Científica', 'George Lucas');

-- Inserir dado de outro filme, mas somento o id e o título
insert into Filmes (idFilme,titulo) values
(02, 'Jogador Nº1');
insert into Filmes (titulo,idFilme) values
('Irmão Urso', 03),
('Star Wars Episódio 4: Uma Nova Esperança', 04);

-- Inserir dado de outro filme, mas somente o id, titulo e genero
insert into Filmes (idFilme, titulo, genero) values
(05, 'Wall-E', 'Ficção Científica'),
(06, 'Homem-Aranha no Aranhaverso', 'Animação');

-- Completar os dados da tabela que estão faltando
-- Para isso, não podemos usar o insert
-- Pois o insert é usado para inserir um novo registro

update Filmes set diretor = 'Ernest Cline' where idFilme = 02;
update Filmes set genero = 'Ficção Científica' where idFilme in (02, 04);

-- Utilizando o update para alternar o valor  de 2 campos de uma mesma linha
update Filmes set genero = 'Fantasia/Animação', diretor = 'Aaron Blaise' where idFilme = 03;
update Filmes set diretor = 'George Lucas' where idFilme = 04;
update Filmes set diretor = 'Bob Persichetti ' where idFilme = 06;
update Filmes set diretor = 'Andrew Stanton' where idFilme = 05;

select * from Filmes;
select * from Filmes order by titulo;
select * from Filmes order by diretor;
select * from Filmes order by diretor, titulo;
select * from Filmes order by diretor, titulo desc;

create table Pessoa (
idPessoa int primary key auto_increment,
nome varchar (50),
dataNascimento varchar (50)
);

insert into Pessoa values 
(null, 'Nicolas Carvalho', '11/03/2000'),
(null, 'Leticia Feitosa', '30/10/1999');
insert into Pessoa values 
(0, 'Ercnard Sieghart', '01/20/1666');
insert into Pessoa (nome, dataNascimento) values 
('Maria Eduarda', '02/11/2000');
insert into Pessoa (nome, dataNascimento) values 
('Arthur Wayne', '17/04/2000');
insert into Pessoa (nome, dataNascimento) values
('Sonic The Hedgehog', '01/01/1991');
insert into Pessoa (nome, dataNascimento) values
('Miles Tails Prower', '02/02/1993');

select * from Pessoa;

alter table Pessoa change nome nomePessoa varchar(40);
alter table Pessoa rename column nomePessoa to nome;

-- comandos DML e DDL
-- COMANDOS DDl - Data Definition Language - grupo de comandos para 
-- definir ou alterar a estrutura da tabela (create table, drop table, alter table).

-- COMANDOS DML - Data Manipulation Langague - grupo de comandos usados para 
-- modificar os dados da tabela (insert, delete, update, select).

-- Alterar o tamanho  da coluna sem renomear a coluna
-- os dois comandos abaixos são EQUIVALENTES (iguais)
alter table Pessoa modify nome varchar(70);
alter table Pessoa modify column nome varchar(70);

-- Acrescentar uma coluna nova numa tabela já existente
-- os dois comandos abaixos são EQUIVALENTES (iguais)
alter table Pessoa add sexo char(1);
alter table Pessoa add column sexo char(1);

-- Remover a coluna que acabamos de acrescentar
alter table Pessoa drop column sexo;

select * from Pessoa;


create table Produto (
idProduto int primary key auto_increment,
nome varchar (50),
preco decimal (6,2)
) auto_increment = 100;

insert into Produto values 
(null, 'Notebook HP', '3000'),
(null, 'Mouse Logitech', '60.99');

select * from Produto;