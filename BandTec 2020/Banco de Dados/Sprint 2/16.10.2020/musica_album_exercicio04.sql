
drop database BD_04_Exercicio_Musica;

create database BD_04_Exercicio_Musica;
use BD_04_Exercicio_Musica;

create table Album (
idAlbum int primary key auto_increment,
nome varchar (40),
gravadora varchar (40)
) auto_increment = 1;

select * from Album;

insert into Album (nome, gravadora) values 
('Sonic Adventure', 'SEGA Studios'),
('Shadow The Hedgehog', 'SEGA Studios'),
('Tim Maia Racional', 'Vitória Régia Discos'),
('Sonic Unleashed', 'SEGA Studios'),
('Não Vão Me Matar', 'Marcelo Yuka'),
('War', 'Groovemaster Studios'),
('Tim Maia Racional', 'Vitória Régia Discos');

select * from Album;

create table Musica (
idMusica int primary key auto_increment,
titulo varchar (40),
artista varchar (40),
genero varchar (40),
fkAlbum int,
foreign key (fkAlbum) references Album (idAlbum)
) auto_increment = 100;

select * from Musica;

insert into Musica values
(01, 'Open Your Heart', 'Crush 40', 'Rock', 1),
(02, 'I Am... All Of Me!', 'Crush 40', 'Heavy Metal', 2),
(03, 'Super Mundo Racional', 'Tim Maia', 'MPB', 3),
(04, 'Endless Possibilities', 'Jared Reddick', 'Rock', 4),
(05, 'O Que Sobrou do Céu', 'O Rappa', 'MPB', 5),
(06, 'Indestructible', 'Disturbed', 'Heavy Metal', 6),
(07, 'Azul da Cor do Mar', 'Tim Maia', 'MPB', 7);

select * from Musica;

select * from Album, Musica where fkAlbum = idAlbum and nome = 'Tim Maia Racional';
select * from Album, Musica where fkAlbum = idAlbum and gravadora = 'SEGA Studios';
