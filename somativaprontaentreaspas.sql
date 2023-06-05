create database relatorioHogwarts;
use relatorioHogwarts;

create table equipment(
id bigint not null auto_increment,
name varchar(150) not null,
amount bigint not null,
primary key(id)
);
insert into equipment (name, amount) values
('TV smart',2),('projetor',1),('ar condicionado',3),('monitor',4),('som',2);
insert into equipment (name, amount) values
('roteador',2);
create table local(
id bigint not null auto_increment,
name varchar(75) not null,
block enum('A','B', 'C', 'D') not null,
limitation bigint not null,
primary key(id)
); 
insert into local (name, block, limitation) values
('Laboratório Eletrônica 01','A',20),
('Laboratório Informática 02', 'C',20),
('Laboratório Metalmecânica','B',18),
('Auditório','A',120),
('Laboratório Eletrônica 02','A',20),
('Laboratório Ensaios Mecânicos','D',32);
select * from local;



create table equipLocal(
id bigint not null auto_increment,
equipmentFK bigint not null,
localFK bigint not null,
primary key(id),
foreign key(equipmentFK) references equipment(id),
foreign key(localFK) references local(id)
);
insert into equipLocal (equipmentFK,localFK) values
(2,1),(5,1),(6,1),(3,1),
(1,2),(2,2),
(3,3),(4,3),(5,3),
(1,4),(3,4),(5,4),(6,4);

select * from equipLocal;


create table event(
id bigint not null auto_increment,
localFK bigint not null,
evento varchar(150) not null,
data date not null,
inicio time not null,
fim time not null,
startCheckIn datetime not null,
endCheckIn datetime not null,
responsavel varchar(150) not null,
numeroParticip bigint,
primary key(id),
foreign key(localFK) references local(id)
);

insert into event (evento, data, inicio,fim, startCheckIn, endCheckIn, numeroParticip, localFk, responsavel)
values
('Workshop Cloud Básico', '2023-05-26', '18:45:00','23:45:00', '2023-05-26 18:45:00', '2023-05-26 23:45:00', 30, 2, 'neymar jr'), 
('Workshop Desenho SolidWorks', '2023-06-26', '18:45:00', '23:45:00', '2023-06-01 18:45:00', '2023-06-01 23:45:00', 16, 3, 'cristiano ronaldo'),
('Blockchain Básico', '2023-08-12', '18:45:00', '23:45:00', '2023-05-26 18:45:00', '2023-05-26 23:45:00', 0, 1, 'messi'),
('Decolando sua carreira', '2023-12-12', '18:45:00', '23:45:00', '2023-08-26 18:45:00', '2023-08-26 23:45:00', 59, 4, 'pelé'),
('Desmistificando Spring Framework', '2024-01-26','18:45:00', '23:45:00', '2024-01-01 18:45:00', '2024-01-01 23:45:00', 16, 1, 'vini jr'),
('Criptomoedas e Web3', '2023-05-30', '18:45:00', '23:45:00', '2023-05-30 18:45:00', '2023-05-30 23:45:00', 10, 1, 'casemiro');
select * from event;
create table permissions(
id bigint not null auto_increment,
permission enum('Admin','Gestor','Usuario','Visitante'),
description varchar(200) not null,
primary key(id)
);

insert into permissions (permission, description) values
('Admin','pode alterar tudo na aplicação, possui o maior nível de acesso'),
('Gestor','nível inferior ao admin, mas com acesso pleno ao cadastro de cadastro de usuarios, cadastro de ambientes, pode cancelar um evento, emitir relatório, etc.'),
('Usuario','pode fazer reservas, mas não cadastrar usuários e nem cancelar eventos'),
('Visitante','pode se inscrever em um evento participante');

create table occupation(
id bigint not null auto_increment,
name varchar(75) not null,
description varchar(100),
primary key(id)
);
insert into occupation (name, description) values 
('Professor', 'dá aulas na area de banco de dados'),('Secretária', 'secretariaa que trabalha o dia inteiro comigo'),('Coordenador', 'begossi 2'),('Orientador', 'orienta a todos quando necessário'),
('Aluno', 'nao faz nada da vida'),('Analista de Sistemas', 'ryan vulgo eu'),('Diretor', 'dirigente');

create table data(
id bigint not null auto_increment,
photo varchar(450) not null,
email varchar(120) not null,
phone bigint not null,
primary key(id)
);

insert into data (photo, email, phone) values
('https://www.google.com/url?sa=i&url=https%3A%2F%2Fphotografos.com.br%2Ffotos-para-perfil%2F&psig=AOvVaw2BKyhM1csyG0EqFbIeT-g9&ust=1685895049385000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCNi_gc--p_8CFQAAAAAdAAAAABAE','hylux13@gmail.com',19996859325),
('https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.uol.com.br%2Fesporte%2Fcolunas%2Fmercado-da-bola%2F2023%2F05%2F08%2Fpsg-quer-a-saida-de-neymar-e-vice-versa.htm&psig=AOvVaw3SYz35Sw68Czm__i3rgdVy&ust=1685895291040000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCIjcvcG_p_8CFQAAAAAdAAAAABAQ','chevrolet22@gmail.com',19955559325),
('https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.cnnbrasil.com.br%2Fesportes%2Fjornal-espanhol-diz-que-cristiano-ronaldo-vai-jogar-no-al-nassr-apos-a-copa-2%2F&psig=AOvVaw1H0Zmyh7IwV_GdpSRBjW4s&ust=1685895562717000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCJiZi8PAp_8CFQAAAAAdAAAAABAE','siuuuu@gmail.com',199968233325),
('https://www.google.com/url?sa=i&url=https%3A%2F%2Fge.globo.com%2Ffutebol%2Fselecoes%2Fargentina%2Fnoticia%2F2022%2F12%2F03%2Fmessi-faz-milesimo-jogo-da-carreira-e-entra-em-grupo-seleto-que-tem-pele-e-cristiano-ronaldo.ghtml&psig=AOvVaw2CEbPcbCzC4LiTk0ZRH4Yj&ust=1685895624914000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCMiXzePAp_8CFQAAAAAdAAAAABAE','argentina@gmail.com',19922259325),
('https://www.google.com/url?sa=i&url=https%3A%2F%2Ftwitter.com%2Fvinijr&psig=AOvVaw27bpvaCaGKETcMkqc68QmT&ust=1685895731959000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCOC6_5PBp_8CFQAAAAAdAAAAABAE','vinijr@gmail.com',19996969325);
insert into data (photo, email, phone) values
('https://www.google.com/url?sa=i&url=https%3A%2F%2Fphotografos.com.br%2Ffotos-para-perfil%2F&psig=AOvVaw2BKyhM1csyG0EqFbIeT-g9&ust=1685895049385000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCNi_gc--p_8CFQAAAAAdAAAAABAE','pipipopo@gmail.com',19996859555),
('https://www.google.com/url?sa=i&url=https%3A%2F%2Fphotografos.com.br%2Ffotos-para-perfil%2F&psig=AOvVaw2BKyhM1csyG0EqFbIeT-g9&ust=1685895049385000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCNi_gc--p_8CFQAAAAAdAAAAABAE','aaaaaa@gmail.com',19996333325);



create table users(
id bigint not null auto_increment,
name varchar(150) not null,
dataFK bigint not null,
occupationFK bigint not null,
dob date not null,
dos date not null,
permissionsFK bigint not null,
gender enum('M', 'F'),
cpf varchar(11) not null,
primary key(id),
foreign key(permissionsFK) references permissions(id),
foreign key(occupationFK) references occupation(id),
foreign key(dataFK) references data(id)
);

insert into users (name, dataFK, occupationFK, dob, dos, permissionsFK, gender, cpf) values
('Neymar da silva santos junior',2,7,'1992-02-05','2023-05-26',1,'M',12345678910),
('Cristiano Ronaldo',3,1,'1985-02-05','2020-01-26',2,'M',15545678910),
('Marta',1,4,'1980-12-05','2015-06-22',4,'F',44445678910),
('edson arantes do nascimento',4,2,'1930-06-05','2000-05-26',3,'M',12345558910),
('vinicius jose santos junior',5,3,'1990-02-05','2023-07-26',4,'M',12345678123),
('ryan ramos',7,5,'2005-06-09','2023-06-26',2,'M',12344659891),
('claudemir dos santos',6,6,'1980-11-13','2001-09-10',3,'M',12345677890);


create table checkIn(
id bigint not null auto_increment,
usersFK bigint not null,
eventFK bigint not null,
dateScheduled datetime not null,
ticket bigint not null,
comment text,
primary key(id),
foreign key(usersFK) references users(id),
foreign key(eventFK) references event(id)
);
alter table checkIn modify dateScheduled datetime not null;
insert into checkIn (usersFK, eventFK, dateScheduled, ticket) values
(2,1,now(),1),
(1,1,'2023-01-01 00:00:00',2),
(5,1,now(),3),
(6,2,now(),4),
(4,2,now(),5),
(1,3,'2023-05-05 00:00:00',6),
(2,3,now(),7),
(4,3,now(),8),
(6,3,'2023-08-08 00:00:00',9),
(1,4,now(),10),
(4,4,now(),11),
(4,6,now(),12);


create table progress(
id bigint not null auto_increment,
taskInProgress enum('aberta','em andamento','concluida','encerrada','agendada'),
timeEndProgress datetime,
primary key(id)
);

insert into progress (taskInProgress, timeEndProgress) values
('agendada',now()),
('em andamento',now()),
('aberta',now()),
('encerrada',now()),
('aberta','2023-01-01 00:00:00'),
('em andamento','2013-08-09 12:20:00'),
('concluida','2018-08-09 10:20:00'),
('agendada','2023-08-09 12:20:00'),
('encerrada','2019-08-09 12:15:00');
select * from progress;



create table taskBase(
id bigint not null auto_increment,
title varchar(75) not null,
description text not null,
requester varchar(75) not null,
startTask datetime default now() not null,
endTask datetime not null,
photosInRepository varchar(120) not null,
primary key(id)
);

insert into taskBase (title, description, requester, startTask, endTask, photosInRepository) values
('Limpar o laboratório de eletronica 1','aonde voce vai eu vou varrendo','andre savedra','2023-08-09 12:20:00','2024-01-01 00:00:00', 'https://github.com/RyanP0612/photos.git'),
('Limpar o laboratório de eletronica 2','aonde voce vai eu vou varrendo2','andre balada',now(),'2024-01-01 00:00:00', 'https://github.com/RyanP0612/photos.git'),
('trocar os fusiveis do bloco C','eletroeletronica','abel ferreira',now(),'2023-06-04 00:00:00', 'https://github.com/RyanP0612/photos.git'),
('trocar os fusiveis do bloco A','eletroeletronica2','neymaru',now(),'2023-07-04 00:00:00', 'https://github.com/RyanP0612/photos.git'),
('compra de uniformes','vestimenta','rhuan',now(),'2023-08-10 00:00:00', 'https://github.com/RyanP0612/photos.git'),
('dar nota 100 para ryan pablo','por favor andre','ryan pablo',now(),'2024-01-01 00:00:00', 'https://github.com/RyanP0612/photos.git');



create table responsible(
id bigint not null auto_increment,
usersFK bigint not null,
taskBaseFK bigint not null,
comment text,
primary key(id),
foreign key(usersFK) references users(id),
foreign key(taskBaseFK) references taskBase(id)
);
insert into responsible (usersFK, taskBaseFK) values
(1,1),
(2,1),
(3,1),
(4,2),
(5,2),
(6,2),
(7,3),
(1,3),
(2,3),
(3,4),
(4,4),
(5,4),
(6,5),
(7,5),
(1,5),
(2,5),
(3,5),
(4,5),
(5,5);
select * from responsible;


create table taskFinal(
id bigint not null auto_increment,
taskFK bigint not null,
progressFK bigint not null,
localFK bigint not null,
primary key(id),
foreign key(taskFK) references taskBase(id),
foreign key(progressFK) references progress(id),
foreign key(localFK) references local(id)
);

insert into taskFinal (taskFK, progressFK, localFK) values
(1,8,1),
(2,1,5),
(3,3,3),
(4,4,2),
(5,1,6);
insert into taskFinal (taskFK, progressFK, localFK) values
(6,8,2);



#ETAPA2 SELECT

#Crie uma consulta que mostre todas as tarefas ainda não iniciadas com as informações de seus 
#respectivos envolvidos no processo;

select *from responsible p
inner join taskFinal t on p.taskBaseFK=t.taskFK
inner join users u on u.id = p.id
inner join taskBase tb on tb.id = p.id
where progressFK = 8
 ;
 
 #Crie uma consulta que mostre todos os locais que tiveram associação a mais de duas tarefas;
 


select c.localFK, l.name, count(localFK) as totalCheckIn from taskFinal c
join local l on l.id = c.localFK
group by localFK
having totalCheckIn in 
(SELECT localFK FROM taskFinal GROUP BY localFK HAVING COUNT(localFK) > 1 ORDER BY count(localFK));


#Crie uma consulta que mostre todos os usuários que tiveram associação a duas tarefas no mínimo
select c.usersFK, u.name, count(usersFK) as totalCheckIn from responsible c
join users u on u.id = c.usersFK
group by usersFK
having totalCheckIn in 
(SELECT usersFK FROM responsible GROUP BY usersFK HAVING COUNT(usersFK) > 1 ORDER BY count(usersFK));



# Crie uma consulta que mostre todos eventos que ainda acontecerão e as tarefas que ainda não
#foram executadas nos locais destes eventos (essa consulta ajudará a gestão visualizar se há algum 
#problema que pode impactar os eventos);


select taskBaseFK,tb.title,tb.requester,l.name,t.progressFK as test from responsible p
inner join taskFinal t on p.taskBaseFK=t.taskFK
inner join taskBase tb on p.taskBaseFK = tb.id
inner join local l  on t.localFK=l.id
inner join event e on e.localFK=l.id
where progressFK = 8;

#Crie uma consulta que mostre os locais e a quantidade de tarefas existentes (independente do 
#status);

select tb.title, count(tb.id), u.name from responsible p
inner join taskFinal t on p.taskBaseFK=t.taskFK
inner join local u on u.id = p.id
inner join taskBase tb on tb.id = p.id
group by tb.id
having count(tb.id)
 ;
 
 #Crie uma consulta que mostre os locais e a quantidade de tarefas concluídas;
 select tb.title, count(tb.id), u.name from responsible p
inner join taskFinal t on p.taskBaseFK=t.taskFK
inner join local u on u.id = p.id
inner join taskBase tb on tb.id = p.id
where progressFK != 8
group by tb.id;

#Crie uma consulta que mostre os usuários e quantas tarefas possuem atribuídas (independente do stts)
select tb.title, count(tb.id), u.name from responsible p
inner join taskFinal t on p.taskBaseFK=t.taskFK
inner join users u on u.id = p.id
inner join taskBase tb on tb.id = p.id
group by tb.id
having count(tb.id);

#crie uma consulta que mostre os usuários e quantas tarefas possuem atribuídas concluídas
#nao consegui
select taskInProgress,count(p.id) as test from progress p
inner join taskFinal t on t.progressFK = p.id
where taskInProgress = 'concluida'
or taskInProgress = 'encerrada'
group by p.id
having test in
(select usersFK,u.name from responsible r
inner join users u on r.usersFK = u.id
group by usersFK
)
;

select usersFK,u.name from responsible r
inner join users u on r.usersFK = u.id
group by usersFK
;

#Crie uma consulta que mostre a média por mês de quantas tarefas são criadas por local

select local, avg(totaldetarefas) from (
	select l.id local, c.localFK taskFinal, count(*) totaldetarefas from taskFinal c
	join local l on l.id = c.localFK
    join taskBase tb on tb.id = c.taskFK 
	group by c.localFK, l.id
) subtabela group by local;

