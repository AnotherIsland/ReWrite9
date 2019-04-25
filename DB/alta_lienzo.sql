drop procedure if exists `alta_lienzo`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `alta_lienzo`(
in _titulo varchar (45),
in _conte longtext
)
BEGIN
DECLARE ID INT;
DECLARE validar INT;
DECLARE ID1 INT;
DECLARE _tipo INT;
SET _tipo = 5;
call alta_obra(_titulo,_tipo);

SELECT (max(idLienzo)+1) INTO ID FROM lienzo limit 1;
	SELECT (max(idObra)) INTO ID1 FROM obra limit 1;
	
    INSERT INTO lienzo(idLienzo, contenido, idObra7) VALUES (ID, _conte, ID1);
END$$
DELIMITER ;
