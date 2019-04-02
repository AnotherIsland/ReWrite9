drop procedure if exists `alta_ensayo`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `alta_ensayo`(
in _titulo varchar (45),
in _introdu mediumtext, 
in _desa mediumtext,
in _conc mediumtext
)
BEGIN
DECLARE ID INT;
DECLARE validar INT;
DECLARE ID1 INT;
call alta_obra(_titulo);

SELECT (max(idEnsayo)+1) INTO ID FROM ensayo limit 1;
	SELECT (max(idObra)) INTO ID1 FROM obra limit 1;
	
    INSERT INTO ensayo(idEnsayo, idObra2, intro, desarrollo, conclusion) VALUES (ID, ID1, _introdu, _desa, _conc);

END$$
DELIMITER ;
