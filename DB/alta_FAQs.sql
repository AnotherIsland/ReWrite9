use rw_database;
DROP TABLE IF EXISTS `FAQs`;
CREATE TABLE FAQs(
	`idFAQ` int(11) auto_increment,
    `pregunta` varchar (250),
    `respuesta` varchar (250),
    primary key (`idFAQ`)
);

insert into FAQs(pregunta,respuesta) values ('¿Como cierro sesion?','Dando clic en la barra superior izquierda.');

