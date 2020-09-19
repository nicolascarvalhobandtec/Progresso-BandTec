create database adsa;
use adsa;

create table Aluno (
ra int primary key auto_increment,
nome varchar (50),
telefone varchar (10) 
);

select * from Aluno;
drop table Aluno;

insert into Aluno (nome, telefone) values
('Nicolas Carvalho', '96280-0727'),
('Maria Eduarda', '91234-5678'),
('Oliver Gabriel', '98765-4321'),
('Daniele Oliveira', '94002-8922');

 -- ________________________________________________________________________________________________________________________________________________

create table Projeto (
identificador int primary key auto_increment,
nome varchar (50),
desc_projeto varchar (50)
);

select * from Projeto;
drop table Projeto;


 # _________________________________________________________________________________________________________________________________________________

create table Representante (
problema_queixa varchar (50)
);

select * from Representante;
drop table Representante;

 /*________________________________________________________________________________________________________________________________________________*/

create table Acompanhante (
identificador int,
nome varchar (50),
relacao_aluno varchar (50)
);

select * from Acompanhante;
drop table Acompanhante;

 -- _____________________________________________________________________________________________________________________________________________________________________________________________
