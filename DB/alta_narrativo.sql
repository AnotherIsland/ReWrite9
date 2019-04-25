drop procedure if exists `alta_narrativo`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `alta_narrativo`(
in _titulo varchar (45),
in _expo text,
in _desa longtext,
in _climax longtext,
in _des text
)
BEGIN
DECLARE ID INT;
DECLARE validar INT;
DECLARE ID1 INT;
DECLARE _tipo INT;
SET _tipo = 3;
call alta_obra(_titulo,_tipo);

SELECT (max(idNarrativo)+1) INTO ID FROM narrativo limit 1;
	SELECT (max(idObra)) INTO ID1 FROM obra limit 1;
	
    INSERT INTO narrativo(idNarrativo, exposicion, desarrollo, climax, descenlace, idObra4)
    VALUES (ID, _expo, _desa, _climax, _des, ID1);
END$$
DELIMITER ;
