
create database ac03Nicolas;
use ac03Nicolas;


-- Transporte
create table Transporte (
idCaminhao int primary key auto_increment,
carga varchar (45),
qtd_carga int
);
select * from Transporte;


-- Sorveteria
create table Sorveteria (
idSorveteria int primary key auto_increment,
sabores varchar (45),
preco int,
fkCaminhao INT,
foreign key (fkCaminhao) references Transporte (idCaminhao)
);
select * from Sorveteria;


-- Cliente
create table Cliente (
idCliente int primary key auto_increment,
nome varchar (45),
senha_pedido varchar (45),
idade char (3)
);
select * from Cliente;


-- Tabela Associativa (Sorveteria e Cliente)
create table Sorveteria_Cliente (
fkSorveteria int,
foreign key (fkSorveteria) references Sorveteria (idSorveteria),
fkCliente int,
foreign key (fkCliente) references Sorveteria (idCliente),
mesa varchar (45),
pedido varchar (45)
);
select * from Sorveteria_Cliente;


