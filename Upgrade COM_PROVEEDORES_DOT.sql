alter table com_proveedores_dot add(
  "COMPDE_ID" number(15), 
	"COMPDE_FECHA" date, 
	"COMPDE_ESTADO" varchar2(3 byte)
);
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
create or replace trigger TRA_COMPDE
 after delete or insert or update
 on com_proveedores_dte
 for each row
   --
begin
	-- Sincronizar Id y Fecha de Estado actual en la Cabecera
	if inserting then
      --
		update com_proveedores_dot
		set    compde_id     = :new.id
            ,compde_estado = :new.estado
            ,compde_fecha  = :new.fecha
		where  id = :new.compdt_id;
      --
	end if;
	--
end;
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
declare
   --
   cursor cr_compdt is
   select * 
   from com_proveedores_dot
   where compde_id is null and compde_fecha is null and compde_estado is null;  
   --
   cursor cr_compde (p_compdt_id number) is
   select *
   from com_proveedores_dte compde
   where compde.compdt_id = p_compdt_id
   and compde.fecha = (select max(compde2.fecha)
                       from com_proveedores_dte compde2
                       where compde2.compdt_id = p_compdt_id);
   --
begin
   --
   for v_compdt in cr_compdt loop
      --
      for v_compde in cr_compde(v_compdt.id) loop
         --
         update com_proveedores_dot
         set compde_id = v_compde.id
            ,compde_estado = v_compde.estado
            ,compde_fecha  = v_compde.fecha
         where id = v_compde.compdt_id;
         --
      end loop;
      --
   end loop;
   --
end;
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
create index compdt_compde_estado_i on com_proveedores_dot (compde_estado);