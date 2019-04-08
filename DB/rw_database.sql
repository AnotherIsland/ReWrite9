drop database if exists rw_database;
create database rw_database;
use rw_database;

DROP TABLE IF EXISTS `tipousuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipousuario` (
	`idTipoUsuario` int(11),
    `tipoUsu` varchar (45),
    primary key (`idTipoUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `tipousuario` WRITE;
/*!40000 ALTER TABLE `tipousuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipousuario` ENABLE KEYS */;
UNLOCK TABLES;

insert into tipousuario values(1, 'cliente');
insert into tipousuario values(2, 'operador');
insert into tipousuario values(3, 'gerenteS');
insert into tipousuario values(4, 'ingeniero');
insert into tipousuario values(5, 'gerenteM');
insert into tipousuario values(6, 'editor');



DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL auto_increment,
  `usuario` varchar(45) DEFAULT NULL,
  `pass` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `idTipoUsuario0` int (11),
  PRIMARY KEY (`idUsuario`),
  CONSTRAINT `idTipoUsuario0` FOREIGN KEY (`idTipoUsuario0`) REFERENCES `tipousuario` (`idTipoUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

insert into usuario values(1, 'Pedro', 'pedrito', 'Pedro@gmail.com', 4);
insert into usuario values(2, 'Ana', 'anita', 'Ana@gmail.com', 3);
insert into usuario values(3, 'Daniel', 'danielito', 'Daniel@gmail.com', 2);
insert into usuario values(4, 'Bruno', 'brunito', 'Bruno@gmail.com', 5);
insert into usuario values(5, 'Marco', 'marquito', 'Marco@gmail.com', 6);
insert into usuario values(6, 'Jimena', 'jimenita', 'Jimena@gmail.com', 1);



DROP TABLE IF EXISTS `tipoobra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoobra` (
  `idtipoObra` int(11) NOT NULL,
  `tipoObra` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtipoObra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `tipoobra` WRITE;
/*!40000 ALTER TABLE `tipoobra` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipoobra` ENABLE KEYS */;
UNLOCK TABLES;
insert into tipoobra values (1, 'ensayo');
insert into tipoobra values (2, 'resumen');

DROP TABLE IF EXISTS `obra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obra` (
  `idObra` int(11) NOT NULL auto_increment,
  `tipo` int(11) DEFAULT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `fecha` timestamp default current_timestamp,
  PRIMARY KEY (`idObra`),
  KEY `tipo_idx` (`tipo`),
  CONSTRAINT `tipo` FOREIGN KEY (`tipo`) REFERENCES `tipoobra` (`idtipoObra`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `obra` WRITE;
/*!40000 ALTER TABLE `obra` DISABLE KEYS */;
/*!40000 ALTER TABLE `obra` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `relobrausu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relobrausu` (
  `idrelObraUsu` int(11) NOT NULL auto_increment,
  `idObra` int(11) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idrelObraUsu`),
  KEY `idUsuario_idx` (`idUsuario`),
  KEY `idObra_idx` (`idObra`),
  CONSTRAINT `idObra` FOREIGN KEY (`idObra`) REFERENCES `obra` (`idObra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `relobrausu` WRITE;
/*!40000 ALTER TABLE `relobrausu` DISABLE KEYS */;
/*!40000 ALTER TABLE `relobrausu` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `lienzo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lienzo` (
  `idLienzo` int(11) NOT NULL,
  `contenido` longtext,
  `idObra7` int(11) DEFAULT NULL,
  PRIMARY KEY (`idLienzo`),
  CONSTRAINT `idObra7` FOREIGN KEY (`idObra7`) REFERENCES `obra` (`idObra`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `lienzo` WRITE;
/*!40000 ALTER TABLE `lienzo` DISABLE KEYS */;
/*!40000 ALTER TABLE `lienzo` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `resumen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resumen` (
  `idResumen` int(11) NOT NULL auto_increment,
  `contenido` mediumtext,
  `idObra1` int(11) DEFAULT NULL,
  `claves` longtext,
  PRIMARY KEY (`idResumen`),
  CONSTRAINT `idObra1` FOREIGN KEY (`idObra1`) REFERENCES `obra` (`idObra`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `resumen` WRITE;
/*!40000 ALTER TABLE `resumen` DISABLE KEYS */;
/*!40000 ALTER TABLE `resumen` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `ensayo`;
CREATE TABLE `ensayo` (
  `idensayo` int(11) NOT NULL auto_increment,
  `idObra2` int(11) DEFAULT NULL,
  `intro` mediumtext,
  `desarrollo` mediumtext,
  `conclusion` mediumtext,
  PRIMARY KEY (`idensayo`),
  CONSTRAINT `idObra2` FOREIGN KEY (`idObra2`) REFERENCES `obra` (`idObra`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `ensayo` WRITE;
/*!40000 ALTER TABLE `ensayo` DISABLE KEYS */;
/*!40000 ALTER TABLE `ensayo` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `referencias`;
CREATE TABLE `referencias` (
  `idreferencias` int(11) NOT NULL,
  `autor` varchar(45) DEFAULT NULL,
  `idObra3` int(11) DEFAULT NULL,
  `año` int(11) DEFAULT NULL,
  `fechaConsul` date DEFAULT NULL,
  `datos` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`idreferencias`),
  CONSTRAINT `idObra3` FOREIGN KEY (`idObra3`) REFERENCES `obra` (`idObra`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `referencias` WRITE;
/*!40000 ALTER TABLE `referencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `referencias` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `narrativo`;
CREATE TABLE `narrativo` (
  `idNarrativo` int(11) NOT NULL,
  `exposicion` text,
  `desarrollo` longtext,
  `climax` longtext,
  `descenlace` text,
  `idObra4` int(11) DEFAULT NULL,
  PRIMARY KEY (`idNarrativo`),
  CONSTRAINT `idObra4` FOREIGN KEY (`idObra4`) REFERENCES `obra` (`idObra`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `narrativo` WRITE;
/*!40000 ALTER TABLE `narrativo` DISABLE KEYS */;
/*!40000 ALTER TABLE `narrativo` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `lirico`;
CREATE TABLE `lirico` (
  `idLirico` int(11) NOT NULL,
  `idObra5` int(11) DEFAULT NULL,
  PRIMARY KEY (`idLirico`),
  CONSTRAINT `idObra5` FOREIGN KEY (`idObra5`) REFERENCES `obra` (`idObra`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `lirico` WRITE;
/*!40000 ALTER TABLE `lirico` DISABLE KEYS */;
/*!40000 ALTER TABLE `lirico` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `tipoestro`;
CREATE TABLE `tipoestro` (
  `idtipoEstro` int(11) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtipoEstro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `tipoestro` WRITE;
/*!40000 ALTER TABLE `tipoestro` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipoestro` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `estrofa`;
CREATE TABLE `estrofa` (
  `idEstrofa` int(11) NOT NULL,
  `idLirico1` int(11) DEFAULT NULL,
  `versos` varchar(70) DEFAULT NULL,
  `idTipoEstro1` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEstrofa`),
   CONSTRAINT `idLirico1` FOREIGN KEY (`idLirico1`) REFERENCES `lirico` (`idLirico`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `idTipoEstro1` FOREIGN KEY (`idTipoEstro1`) REFERENCES `tipoestro` (`idtipoEstro`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `estrofa` WRITE;
/*!40000 ALTER TABLE `estrofa` DISABLE KEYS */;
/*!40000 ALTER TABLE `estrofa` ENABLE KEYS */;
UNLOCK TABLES;



DROP TABLE IF EXISTS `articulo`;
CREATE TABLE `articulo` (
  `idArticulo` int(11) NOT NULL,
  `resumen` tinytext,
  `autores` tinytext,
  `materiales` text,
  `metodos` text,
  `resultados` text,
  `discusion` text,
  `conclusiones` text,
  `apendices` longtext,
  `idObra6` int(11) DEFAULT NULL,
  PRIMARY KEY (`idArticulo`),
  CONSTRAINT `idObra6` FOREIGN KEY (`idObra6`) REFERENCES `obra` (`idObra`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `articulo` WRITE;
/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `articulo` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `reporte`;
CREATE TABLE `reporte` (
  `idreporte` int(11) NOT NULL auto_increment,
  `fecha_inicio` date NOT NULL ,
  `fecha_resolucion` date ,
  `fecha_conclusion` date ,
  `etiqueta` varchar(20),
  `contenido` tinytext NOT NULL, 
  `idUsuarioLevanta` int (11) not null,
  `idUsuarioAsigna` int (11),
  `idUsuarioCierra` int (11), 
  `idUsuarioEscritor` int (11) not null, 
  primary key (`idreporte`),
  CONSTRAINT `idUsuarioEscritor` FOREIGN KEY (`idUsuarioEscritor`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idUsuarioLevanta` FOREIGN KEY (`idUsuarioLevanta`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idUsuarioAsigna` FOREIGN KEY (`idUsuarioAsigna`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idUsuarioCierra` FOREIGN KEY (`idUsuarioCierra`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `reporte` WRITE;
/*!40000 ALTER TABLE `reporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporte` ENABLE KEYS */;
UNLOCK TABLES;



DROP TABLE IF EXISTS `reporteMant`;
CREATE TABLE `reporteMant` (
  `idreporteMant` int(11) NOT NULL auto_increment,
  `contenido` tinytext NOT NULL,
  `fecha_inicio` date NOT NULL ,
  `fecha_conclusion` date , 
  `idUsuario1Levanta` int (11) not null,
  `idUsuario1Asigna` int (11),
  primary key (`idreporteMant`),
  
  CONSTRAINT `idUsuario1Levanta` FOREIGN KEY (`idUsuario1Levanta`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idUsuario1Asigna` FOREIGN KEY (`idUsuario1Asigna`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `reporteMant` WRITE;
/*!40000 ALTER TABLE `reporteMant` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporteMant` ENABLE KEYS */;
UNLOCK TABLES;

select * from reporte;
insert into reporte (fecha_inicio, fecha_resolucion, etiqueta, contenido, idUsuarioLevanta, idUsuarioAsigna, idUsuarioCierra, idUsuarioEscritor) values(current_date(), null, 'no asignado', 'error en la base', 1, 2 , 1, 4);


INSERT INTO reporteMant(contenido,fecha_inicio,idUsuario1Levanta,idUsuario1Asigna) VALUES('error en el diseño', current_date() ,4,4);
select * from reporteMant;
Select * from reporteMant where fecha_conclusion is null;

/*INSERT INTO reporte(fecha_inicio,fecha_resolucion,fecha_conclusion,etiqueta,contenido,idUsuarioLevanta,idUsuarioEscritor) VALUES('2019-09-16','2019-09-22','2019-09-23','No asignado','Contenido reporte no asignado',3,4);
INSERT INTO reporte(fecha_inicio,fecha_resolucion,fecha_conclusion,etiqueta,contenido,idUsuarioLevanta,idUsuarioAsigna,idUsuarioEscritor) VALUES('2019-09-16','2019-09-22','2019-09-23','Pendiente','Contenido reporte pendiente',3,2,4);
INSERT INTO reporte(fecha_inicio,fecha_resolucion,fecha_conclusion,etiqueta,contenido,idUsuarioLevanta,idUsuarioAsigna,idUsuarioCierra,idUsuarioEscritor) VALUES('2019-09-16','2019-09-22','2019-09-23','Cerrado','Contenido reporte cerrado',3,2,1,4);
*/

select * from usuario;
