DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `alta_usuario`(
	in _usuario varchar(45),
    in _correo varchar (45),
    in _pass varchar (45)
    )
BEGIN
DECLARE validar INT;
	DECLARE ID INT;
    SELECT COUNT(*) INTO validar FROM usuario WHERE correo=_correo;
	if validar = 0 THEN
	SELECT (max(idUsuario)+1) INTO ID FROM usuario limit 1;
	#the value estados_id its a auto_increment value, just call to add the value...
	INSERT INTO usuario(idUsuario,usuario, pass, correo) VALUES(ID,_usuario,_pass,_correo);
	
	ELSE
		SELECT CONCAT('El correo: ',_correo,' ya está en uso.') ESTADO;
	END IF;
END$$
DELIMITER ;