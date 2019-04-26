drop procedure if exists `alta_lirico`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `alta_lirico`(
in _titulo varchar (45),
in _conte longtext
)
BEGIN
DECLARE ID INT;
DECLARE validar INT;
DECLARE ID1 INT;
DECLARE _tipo INT;
SET _tipo = 4;
call alta_obra(_titulo,_tipo);

SELECT (max(idlirico)+1) INTO ID FROM lirico limit 1;
	SELECT (max(idObra)) INTO ID1 FROM obra limit 1;
	
    INSERT INTO lirico(idlirico, contenido, idObra5) VALUES (ID, _conte, ID1);
END$$
DELIMITER ;
