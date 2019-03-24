drop database if exists rw_database;
create database rw_database;
use rw_database;


DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL auto_increment,
  `usuario` varchar(45) DEFAULT NULL,
  `pass` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;


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

DROP TABLE IF EXISTS `obra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obra` (
  `idObra` int(11) NOT NULL,
  `tipo` int(11) DEFAULT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `sello` varchar(150) DEFAULT NULL,
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
  `idrelObraUsu` int(11) NOT NULL,
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
  `idResumen` int(11) NOT NULL,
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
  `idensayo` int(11) NOT NULL,
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
  `idreporte` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_resolucion` date NOT NULL,
  `fecha_conclusion` date NOT NULL,
  `folio` varchar(4) NOT NULL,
  `etiqueta` varchar(20) NOT NULL,
  `contenido` tinytext NOT NULL,
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `articulo` WRITE;
/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `articulo` ENABLE KEYS */;
UNLOCK TABLES;