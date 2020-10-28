
create database ac2Nicolas;
use ac2Nicolas;

create table Omnitrix (
idOmni int primary key auto_increment,
usuarios varchar (20),
tecnologia varchar (20),
versao_Unitrix varchar (50),
versao_Super_Omnitrix varchar (50)
);

select * from Omnitrix;

insert into Omnitrix (usuarios, tecnologia, versao_Unitrix, versao_Super_Omnitrix) values 
('Maxwell Tennyson', 'Azimuth', 'Nemetrix', 'Primaria'),
('Benjamin Tennyson', 'Azimuth', 'Nemetrix', 'NEO Super Omnitrix'),
('Albedo', 'Cópia de Azimuth', 'Ultratrix','Super Omnitrix');
select * from Omnitrix;


create table Alien (
idAlien int primary key auto_increment,
nomeAlien varchar (50),
especieAlien varchar (50),
caracteristica varchar (50),
caracteristica2 varchar (50), 
qtd_aparicao int check (qtd_aparicao > 0 and qtd_aparicao < 100),
planetaNatal varchar (50),
fkOmnitrix int,
foreign key (fkOmnitrix) references Omnitrix (idOmni)
) auto_increment = 100;

select * from Alien;

insert into Alien values 
(null, 'Wrath', 'Appoplexiano', 'Tigre Humanoide', 'Agressividade Incontrolavel', 41, 'Appoplexia', 1),
(null, 'Ultra T', 'Mecamorfo Galvanico', 'Humanoide Tecnologico', 'Manipulador de Equipamentos', 25, 'Galvan B', 2),
(null, 'Chama', 'Pyronita', 'Humanoide Inflamavel', 'Usuário de Fogo Natural', 29, 'Pyros', 3);

select * from Alien;
select * from Omnitrix;
select * from Alien, Omnitrix where fkOmnitrix = idOmni;
select * from Alien, Omnitrix where fkOmnitrix = idOmni and tecnologia = 'Azimuth';
select avg (qtd_aparicao) as 'Aparições no Desenho' from Alien;
