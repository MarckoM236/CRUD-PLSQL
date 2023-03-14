CREATE OR REPLACE package pkgVendedor
as

--=============================================================================
--Nombre responsabilidad: crear el paquete y el cuerpo del paquete para la tabla VENDEDOR.
--Autor:MARCO MARIN
--Fecha_creacion: 14/ENERO/2022
--Descripcion responsabilidad: crear el paquete y el cuerpo del paquete para realizar CRUD en la tabla VENDEDOR.
--Historial_modificaciones:
--Autor:
--Fecha:
--Descripcion:
--=============================================================================
PROCEDURE consultaVendedor (id_vendedor number,nomb_vendedor varchar2,apel_vendedor varchar2,cursor out sys_refcursor);
PROCEDURE actualizarVendedor (id_vendedor number,nomb_vendedor varchar2,apel_vendedor varchar2,est_vendedor varchar2);
PROCEDURE eliminarVendedor (id_vendedor number);
PROCEDURE insertarVendedor (id_vendedor number,nomb_vendedor varchar2,apel_vendedor varchar2,est_vendedor varchar2);
end pkgVendedor;


CREATE OR REPLACE package body pkgVendedor
as

PROCEDURE consultaVendedor (id_vendedor number,nomb_vendedor varchar2,apel_vendedor varchar2,cursor out sys_refcursor) is
    begin
        if id_vendedor is null AND nomb_vendedor is null AND apel_vendedor is null  then
            open cursor for SELECT Ven.VENDIDEN, Ven.VENDNOMB, Ven.VENDAPEL, Ven.VENDESTA
            FROM VENDEDOR ven
            WHERE Ven.VENDIDEN<>'-1'
            ORDER BY Ven.VENDIDEN DESC;

        elsif id_vendedor is not null AND nomb_vendedor is null AND apel_vendedor is null  then
            open cursor for SELECT Ven.VENDIDEN, Ven.VENDNOMB, Ven.VENDAPEL, Ven.VENDESTA
            FROM VENDEDOR ven
            WHERE Ven.VENDIDEN= id_vendedor;

        elsif id_vendedor is null AND nomb_vendedor is not null AND apel_vendedor is null  then
            open cursor for SELECT Ven.VENDIDEN, Ven.VENDNOMB, Ven.VENDAPEL, Ven.VENDESTA
            FROM VENDEDOR ven
            WHERE Ven.VENDNOMB= nomb_Vendedor;

        elsif id_vendedor is null AND nomb_vendedor is null AND apel_vendedor is not null then
            open cursor for SELECT Ven.VENDIDEN, Ven.VENDNOMB, Ven.VENDAPEL, Ven.VENDESTA
            FROM VENDEDOR ven
            WHERE Ven.VENDAPEL= apel_Vendedor;

        else
            open cursor for SELECT Ven.VENDIDEN, Ven.VENDNOMB, Ven.VENDAPEL, Ven.VENDESTA
            FROM VENDEDOR ven
            WHERE Ven.VENDIDEN<>'-1'
            ORDER BY Ven.VENDIDEN DESC;
        end if;

    end consultaVendedor;

PROCEDURE actualizarVendedor (id_vendedor number,nomb_vendedor varchar2,apel_vendedor varchar2,est_vendedor varchar2) is
    begin
        UPDATE VENDEDOR
        SET VENDNOMB = nomb_Vendedor,
        VENDAPEL = apel_vendedor,
		VENDESTA = est_vendedor
        WHERE VENDIDEN = id_vendedor;
        COMMIT;
    end actualizarVendedor;

PROCEDURE eliminarVendedor (id_vendedor number) is
    begin
        DELETE
        FROM VENDEDOR
        WHERE VENDIDEN = id_vendedor;
    end eliminarVendedor;

PROCEDURE insertarVendedor (id_vendedor number,nomb_vendedor varchar2,apel_vendedor varchar2,est_vendedor varchar2) is
    begin
        INSERT INTO VENDEDOR (VENDIDEN, VENDNOMB, VENDAPEL, VENDESTA)
        VALUES (id_vendedor,nomb_vendedor,apel_vendedor, est_vendedor);
        COMMIT;

    end insertarVendedor;

end pkgVendedor;