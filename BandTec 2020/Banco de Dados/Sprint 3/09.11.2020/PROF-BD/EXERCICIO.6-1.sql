create database final;
use final;

create table projeto(
idProjeto int primary key auto_increment,
nomeProjeto varchar(45),
descProjeto varchar(45)
);

create table aluno(
RA int primary key auto_increment,
nomeAluno varchar(45),
telefone char(11),
fkProjeto int,
foreign key (fkProjeto) references projeto(idProjeto),
fkRepresentante int,
foreign key (fkRepresentante) references aluno(RA)
) auto_increment 1000; 

create table Acompanhante(
fkAluno int,
idAcompanhante int,
nomeAcompanhante varchar(45),
tipoRelacao varchar(35),
foreign key (fkAluno) references aluno(RA),
primary key (fkAluno,idAcompanhante)
);


insert into projeto values(
null,'TecX', 'Monitoramento de temperatura e umidade'),
(null,'GDP', 'Gestão e Desenvolvimento de Pessoas'),
(null,'Navegação','Transporte Marítimo');

select * from projeto;

insert into aluno values(
null, 'André', '11990807060', 1, null),
(null, 'Bruno', '31987654321', 2, 1000),
(null, 'Marcela', '21999886252', 3, 1001);

select * from aluno;

insert into Acompanhante value(
1000, 1,'Gabriela', 'Irmã'),
(1001, 1,'Ana', 'Mãe'),
(1001, 2,'João', 'Pai'),
(1002, 1, 'José', 'Primo');

select * from Acompanhante;

select * from projeto, aluno where fkProjeto = idProjeto;

select * from aluno, Acompanhante where fkAluno = RA;

select * from aluno as R, aluno as z where R.fkRepresentante = z.RA;

select * from aluno, projeto  where fkProjeto = idProjeto and nomeProjeto = 'TecX';

select * from aluno as R, aluno as z, Acompanhante where R.fkRepresentante = z.RA and fkAluno = R.RA;


