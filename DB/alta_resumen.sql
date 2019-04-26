drop procedure if exists `alta_resumen`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `alta_resumen`(
in _titulo varchar (45),
in _contenido mediumtext,
in _claves longtext 
)
BEGIN
DECLARE ID INT;
DECLARE validar INT;
DECLARE ID1 INT;
DECLARE _tipo INT;
SET _tipo = 2;
call alta_obra(_titulo,_tipo);

	SELECT (max(idresumen)+1) INTO ID FROM resumen limit 1;
	SELECT (max(idObra)) INTO ID1 FROM obra limit 1;
	
    INSERT INTO resumen(idresumen, contenido, idObra1, claves) VALUES (ID, _contenido, ID1, _claves);
    

END$$
DELIMITER ;
