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

DROP TABLE IF EXISTS `resumen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resumen` (
  `idResumen` int(11) NOT NULL,
  `contenido` mediumtext,
  `idObra1` int(11) DEFAULT NULL,
  `claves` longtext,
  PRIMARY KEY (`idResumen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `resumen` WRITE;
/*!40000 ALTER TABLE `resumen` DISABLE KEYS */;
/*!40000 ALTER TABLE `resumen` ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE `ensayo` (
  `idensayo` int(11) NOT NULL,
  `idObra2` int(11) DEFAULT NULL,
  `intro` mediumtext,
  `desarrollo` mediumtext,
  `conclusion` mediumtext,
  PRIMARY KEY (`idensayo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `ensayo` WRITE;
/*!40000 ALTER TABLE `ensayo` DISABLE KEYS */;
/*!40000 ALTER TABLE `ensayo` ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE `referencias` (
  `idreferencias` int(11) NOT NULL,
  `autor` varchar(45) DEFAULT NULL,
  `idObra3` int(11) DEFAULT NULL,
  `año` int(11) DEFAULT NULL,
  `fechaConsul` date DEFAULT NULL,
  `datos` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`idreferencias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `referencias` WRITE;
/*!40000 ALTER TABLE `referencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `referencias` ENABLE KEYS */;
UNLOCK TABLES;
