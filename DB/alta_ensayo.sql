drop procedure if exists `alta_ensayo`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `alta_ensayo`(
in _titulo varchar (45),
in _introdu mediumtext, 
in _desa mediumtext,
in _conc mediumtext,
in _referencias longtext
)
BEGIN
DECLARE ID INT;
DECLARE validar INT;
DECLARE ID1 INT;
DECLARE _tipo INT;
SET _tipo = 1;
call alta_obra(_titulo,_tipo);

SELECT (max(idensayo)+1) INTO ID FROM ensayo limit 1;
	SELECT (max(idObra)) INTO ID1 FROM obra limit 1;
	
    INSERT INTO ensayo(idensayo, idObra2, intro, desarrollo, conclusion, referencias) VALUES (ID, ID1, _introdu, _desa, _conc, _referencias);

END$$
DELIMITER ;
