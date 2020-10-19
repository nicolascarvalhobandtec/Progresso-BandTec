drop database BD_04_Exercicio;

create database BD_04_Exercicio;
use BD_04_Exercicio;

create table Pais (
idPais int primary key auto_increment,
nomePais varchar (40),
capital varchar (40)
) auto_increment = 100;

select * from Pais;

insert into Pais (nomePais, capital) values  
('Japão', 'Tokyo'),
('Estados Unidos', 'Washington D.C.'),
('Jamaica', 'Kingston'),
('Brasil', 'Brasilia');


create table Atleta (
idAtleta int primary key auto_increment,
nomeAtleta varchar (40),
modalidade varchar (40),
qtdMedalha int,
fkPais int,
foreign key (fkPais) references Pais (idPais)
);
select * from Atleta;

insert into Atleta (nomeAtleta, modalidade, qtdMedalha, fkPais) values
('Usain Bolt', 'Corrida dos 100 Metros', 5, 102),
('Ercnard Sieghart', 'Esgrima', 100, 100),
('Jin Kaien', 'Lutador', 7, 103),
('Lupus Wild', 'Tiro Ao Alvo', 5, 101),
('Sonic O Ouriço', 'Corrida dos 100 Metros', 85, 100),
('Lass Isolet', 'Esgrima', 75, 101);


select * from Atleta, Pais where fkPais = idPais;
select * from Atleta, Pais where fkPais = idPais and nomePais = 'Estados Unidos';
