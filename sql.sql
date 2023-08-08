create database ESIPROYECTO;
use ESIPROYECTO;
create table personas(
	id bigint unsigned primary key,
    ci int(8) unique,
    pri_nomb varchar(32) NOT NULL,
    seg_nomb varchar(32),
    pri_ape varchar(32) NOT NULL,
    seg_ape varchar(32),
    updated_at datetime,
created_at datetime, 
    foreign key (id) references users(id)
);

create table camiones(
    matricula char(7) PRIMARY KEY,
    modelo varchar(32) NOT NULL,
    cant_max_productos int(7) NOT NULL,
    updated_at datetime,
created_at datetime
);

create table almacenes(
	id int(2) unsigned primary key,
    departamento varchar(14),
    dirección varchar(25),
    updated_at datetime,
created_at datetime
);

create table funcionarios(
	id_persona bigint unsigned primary key, 
    id_almacen int(2) unsigned not null,updated_at datetime,
created_at datetime, 
    foreign key (id_almacen) references almacenes(id),    
    foreign key (id_persona) references personas(id)
);

 create table admins(
 	id_persona bigint unsigned primary key, 
    updated_at datetime,
created_at datetime, 
foreign key (id_persona) references personas(id)    
);   

create table gerentes(
	id_persona bigint unsigned primary key, 
    updated_at datetime,
created_at datetime, 
foreign key (id_persona) references personas(id)    
);

create table choferes(
	id_persona bigint unsigned primary key,
    matricula_camion char(7) not null,
    updated_at datetime,
created_at datetime, 
	foreign key (matricula_camion) references camiones(matricula),
foreign key (id_persona) references personas(id)
);


create table lotes(
	id serial PRIMARY KEY,
    matricula_camion char(7) not null,updated_at datetime,
created_at datetime, 
    foreign key (matricula_camion) references camiones(matricula)
);

 create table productos(
	codigo int(4) UNSIGNED PRIMARY KEY,
    id_lote bigint unsigned not null,
    updated_at datetime,
created_at datetime, 
    foreign key (id_lote) references lotes(id)
);

create table almacena(
	id_almacen int(2) unsigned, 
    codigo_producto int(4) unsigned,
    updated_at datetime,
created_at datetime, 
    primary key (id_almacen, codigo_producto),
    foreign key (id_almacen) references almacenes(id),
    foreign key (codigo_producto) references productos(codigo)
);

CREATE TABLE hacia (
    matricula_camion CHAR(7) PRIMARY KEY,
    id_almacen INT(2) UNSIGNED,
    updated_at DATETIME,
    created_at DATETIME,
    FOREIGN KEY (id_almacen)
        REFERENCES almacenes (id),
    FOREIGN KEY (matricula_camion)
        REFERENCES camiones (matricula)
);

drop database ESIPROYECTO;

describe users;

select * from personas;


