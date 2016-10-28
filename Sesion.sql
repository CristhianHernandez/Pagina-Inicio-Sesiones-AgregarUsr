drop database if exists Sesion;
create database Sesion;
use Sesion;

	create table Usuarios 
    (
		idUsuario int primary key,
        usuario	nvarchar(60),
        contrasenia nvarchar(60)
    
    );
    
    drop procedure if exists sp_Validacion;
    
    delimiter **
    
    create procedure sp_Validacion(in Usr nvarchar(60), contra nvarchar(60)) 
    begin 
    declare xIdUsuario int;
    declare existe int;
    declare xMsj nvarchar(60); 
    
		if(Usr = "" || contra = "") 	then
			set xMsj = '';
            
            else 
		set existe = (select count(*) from Usuarios where usuario = Usr and contrasenia = contra);
        
        if(existe = 0)	then
        
		set xIdUsuario = (select ifnull(max(idUsuario),	0	) + 1 from Usuarios);
    insert into Usuarios(idUsuario , usuario , contrasenia)
		
		values (xIdUsuario , Usr , contra);
	
		set xMsj = 'El Usuario fue registrado con exito';
    
    else
    
		set xMsj = 'El Usuario ya estaba registrado';
		set xIdUsuario = 0;
    
			end if;
            end if;
        select xIdUsuario as idUsr , xMsj as Notificacion;
        
        end;**
        delimiter ;
        
        
        drop procedure if exists sp_Check;
        delimiter ** 
        create procedure sp_Check(in nom nvarchar(60), apell nvarchar(60))
        begin
        declare xMsj nvarchar(60);
        declare existe int;
        
        set existe = (select count(*) from Usuarios where usuario = nom and apell = contrasenia);
        
        if (existe = 1)	then	
        set xMsj = 'Bienvenido';
        else 
        set xMsj = 'No hay coincidencias';
        end if;
        select xMsj as notificacion, existe as valido;
        select nom as nombre;
        end;**
        delimiter ;
        
        
    call sp_Validacion ('crixo','1234');
    call sp_Validacion ('crixo2','1234');
    call sp_Check('crixo','1234');

