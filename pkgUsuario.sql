CREATE OR REPLACE package pkgUsuario
as

--=============================================================================
--Nombre responsabilidad: crear el paquete y el cuerpo del paquete para la tabla USUARIO.
--Autor:MARCO MARIN
--Fecha_creacion: 14/ENERO/2022
--Descripcion responsabilidad: crear el paquete y el cuerpo del paquete para realizar CRUD en la tabla USUARIO.
--Historial_modificaciones:
--Autor:
--Fecha:
--Descripcion:
--=============================================================================
PROCEDURE consultaUsuario (cod_usuario number,nomb_usuario varchar2,cursor out sys_refcursor);
PROCEDURE actualizarUsuario (cod_usuario number,nomb_usuario varchar2,pass_usuario varchar2,est_usuario varchar2);
PROCEDURE eliminarUsuario (cod_usuario number);
PROCEDURE insertarUsuario (cod_usuario number,nomb_usuario varchar2,pass_usuario varchar2,est_usuario varchar2);
end pkgUsuario;


CREATE OR REPLACE package body pkgUsuario
as

PROCEDURE consultaUsuario (cod_usuario number,nomb_usuario varchar2,cursor out sys_refcursor) is
    begin
        if cod_usuario is null AND nomb_usuario is null  then
            open cursor for SELECT usu.USUACODI, usu.USUANOMB, usu.USUAPASS, usu.USUAESTA
            FROM USUARIO usu
            WHERE usu.USUACODI<>'-1'
            ORDER BY usu.USUACODI DESC;

        elsif cod_usuario is not null AND nomb_usuario is null  then
            open cursor for SELECT usu.USUACODI, usu.USUANOMB, usu.USUAPASS, usu.USUAESTA
            FROM USUARIO usu
            WHERE usu.USUACODI= cod_usuario;

        elsif cod_usuario is null AND nomb_usuario is not null  then
            open cursor for SELECT usu.USUACODI, usu.USUANOMB, usu.USUAPASS, usu.USUAESTA
            FROM USUARIO usu
            WHERE usu.USUANOMB= nomb_usuario;

        else
            open cursor for SELECT usu.USUACODI, usu.USUANOMB, usu.USUAPASS, usu.USUAESTA
            FROM USUARIO usu
            WHERE usu.USUACODI<>'-1'
            ORDER BY usu.USUACODI DESC;
        end if;

    end consultaUsuario;

PROCEDURE actualizarUsuario (cod_usuario number,nomb_usuario varchar2,pass_usuario varchar2,est_usuario varchar2) is
    begin
        UPDATE USUARIO
        SET USUACODI= cod_usuario,
        USUANOMB = nomb_usuario,
        USUAPASS = pass_usuario,
		USUAESTA = est_usuario
        WHERE USUACODI = cod_usuario;
        COMMIT;
    end actualizarUsuario;

PROCEDURE eliminarUsuario (cod_usuario number) is
    begin
        DELETE
        FROM USUARIO
        WHERE USUACODI = cod_usuario;
    end eliminarUsuario;

PROCEDURE insertarUsuario (cod_usuario number,nomb_usuario varchar2,pass_usuario varchar2,est_usuario varchar2) is
    begin
        INSERT INTO USUARIO (USUACODI, USUANOMB, USUAPASS, USUAESTA)
        VALUES (cod_usuario,nomb_usuario,pass_usuario,est_Usuario);
        COMMIT;

    end insertarUsuario;

end pkgUsuario;