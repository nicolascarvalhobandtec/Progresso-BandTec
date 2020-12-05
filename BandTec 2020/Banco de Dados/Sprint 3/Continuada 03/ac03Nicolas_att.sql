
create database ac03Nicolas;
use ac03Nicolas;


-- Tabela Omnitrix
create table Omnitrix (
idOmni int primary key auto_increment,
tecnologia varchar (45),
versao_Omnitrix varchar (45)
);
select * from Omnitrix;

insert into Omnitrix (tecnologia, versao_Omnitrix) values
('Azmuth', 'Primária'),
('Azmuth', 'NEO Omnitrix'),
('Albedo', 'Super Omnitrix'),
('Azmuth', 'Unitrix');
select * from Omnitrix;



create table dnaAlien (
idAlien int primary key auto_increment,
nomeAlien varchar (45),
especieAlien varchar (45),
caracteristica_fisica varchar (45),
habilidade varchar (45)
);
select * from dnaAlien;

insert into dnaAlien (nomeAlien, especieAlien, caracteristica_fisica, habilidade) values
('Rath', 'Apopplexiano', 'Tigre Humanóide', 'Agressividade Incontrolável'),
('Chama', 'Pyronita', 'Humanóide Flamejante', 'Ser de Fogo Natural'),
('Diamante', 'Petrosapien', 'Humanóide Cristalino', 'Manipulação de Cristais'),
('XLR8', 'Kinecelerano', 'Velociraptor Humanóide', 'Super Velocidade'),
('Eunice', 'Unitrix', 'Humano Artificial', 'Sintetização de DNA');
select * from dnaAlien;



create table Usuario (
idUsuario int primary key auto_increment,
nomeUsuario varchar (45),
idade varchar (45),
fkOmni_Us int,
foreign key (fkOmni_Us) references Omnitrix (idOmni)
);
select * from Usuario;

insert into Usuario (nomeUsuario, idade, fkOmni_Us) values
('Maxwell Tennyson', '65', 1),
('Ben Tennyson', '18', 2),
('Albedo', '??', 3),
('Azmuth', '??', 4);
select * from Usuario;



create table Omnitrix_Alien (
fkOmni_OA int,
foreign key (fkOmni_OA) references Omnitrix (idOmni),
fkAlien int,
foreign key (fkAlien) references dnaAlien (idAlien),
qtd_DNA int
);
select * from Omnitrix_Alien;

insert into Omnitrix_Alien values
(1, 1, 10),
(2, 1, 60),
(3, 2, 24),
(4, 4, 1);


-- 5-) Exibindo os dados das tabelas Omnitrix e Usuario (relacionamento um-para-muitos) 
-- de forma correspondente
select * from Omnitrix join Usuario on fkOmni_Us = idOmni and fkOmni_Us = idOmni; 

                                    
-- 6-) Exibindo os dados das tabelas envolvidas no relacionamento um-para-muitos,
-- de forma correspondente;
select * from Usuario inner join Omnitrix  on fkOmni_Us = idOmni where tecnologia = 'Azmuth'; 


-- 7-) Exibindo os dados das tabelas envolvidas no relacionamento muitos-para-muitos, 
--  de forma correspondentes;
select * from Omnitrix join dnaAlien join Omnitrix_Alien on fkOmni_OA = idOmni and fkAlien = idAlien; 

                                    
-- 8-) Exibindo os dados das tabelas envolvidas na relacionamento muitos-para-muitos, 
-- de forma correspondentes, mas associados somente a um item de uma das tabelas
select * from Omnitrix join dnaAlien join Omnitrix_Alien on fkOmni_OA = idOmni and nomeAlien = 'Diamante'; 


-- 9-) Exibindo os dados de todas as tabelas, de forma correspondente;
select * from dnaAlien join Omnitrix_Alien join Omnitrix on fkAlien = idAlien and fkOmni_OA = idOmni right join Usuario on fkOmni_Us = idUsuario; 


-- 10-) Utilizando MIN e MAX e exibindo o resultado dessas 2 funções na tabela Omnitrix_Alien (associativa),
-- agrupando pelo campo qtd_DNA e depois pelo qtd_DNA (GRUPO BY).
select fkAlien, min(qtd_DNA) as 'Número de Aliens Antigos', 
       max(qtd_DNA) as 'Número de Aliens Novos' from Omnitrix_Alien group by fkAlien; 
      
      
      