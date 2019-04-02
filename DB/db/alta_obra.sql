drop procedure if exists `alta_obra`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `alta_obra`(
in _titulo varchar(45)
)
BEGIN
	DECLARE validar INT;
	DECLARE ID1 INT;
    SELECT COUNT(*) INTO validar FROM obra WHERE fecha=current_timestamp;
	if validar = 0 THEN
    SELECT (max(idObra)+1) INTO ID1 FROM obra limit 1;
	#the value estados_id its a auto_increment value, just call to add the value...
	INSERT INTO obra(idObra,tipo, titulo, fecha) VALUES(ID1,2, _titulo,current_timestamp);
    
    ELSE
		SELECT CONCAT('La obra: ',_titulo,' no se puede crear justo ahora. Intentar más tarde.') ESTADO;
	END IF;
END$$
DELIMITER ;
