drop procedure if exists `alta_usuario`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `alta_usuario`(
    in _usuario varchar(45),
    in _correo varchar (45),
    in _contraseña varchar (45),
    in _imagen longblob
)
BEGIN
	DECLARE validar INT;
	DECLARE ID INT;
    SELECT COUNT(*) INTO validar FROM usuario WHERE correo=_correo;
	if validar = 0 THEN
	SELECT (max(idUsuario)+1) INTO ID FROM usuario limit 1;
	#the value estados_id its a auto_increment value, just call to add the value...
	INSERT INTO usuario(idUsuario,usuario, correo, contraseña, imagen) VALUES(ID,_usuario,_correo,_contraseña, _imagen);
	CALL alta_usuarios(); #SP that show all data...
	ELSE
		SELECT CONCAT('El correo: ',_correo,' ya está en uso.') ESTADO;
	END IF;
END$$
DELIMITER ;
