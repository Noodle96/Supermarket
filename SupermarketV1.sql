

-- object: public."Usuario" | type: TABLE --
-- DROP TABLE IF EXISTS public."Usuario" CASCADE;
CREATE TABLE public."Usuario"(
	"idUsuario" serial NOT NULL,
	"nameUsuario" varchar(30),
	"lastNameUsuario" varchar(30),
	"fechaNacimiento" date,
	status bool DEFAULT true,
	image varchar(50),
	email varchar(30) NOT NULL,
	password varchar(255),
	sexo varchar(2),
	direccion varchar(100),
	"isEliminate" varchar(2) DEFAULT 0,
	created_at timestamp,
	"lastSession" timestamp,
	CONSTRAINT unique_email UNIQUE (email),
	CONSTRAINT "pk_idUsuario" PRIMARY KEY ("idUsuario")

);
-- ddl-end --
ALTER TABLE public."Usuario" OWNER TO postgres;
-- ddl-end --

-- object: public."Agencia" | type: TABLE --
-- DROP TABLE IF EXISTS public."Agencia" CASCADE;
CREATE TABLE public."Agencia"(
	"idAgencia" serial NOT NULL,
	"nameAgencia" varchar(30),
	direccion varchar(30),
	"cantidadCuentas" bigint,
	CONSTRAINT "pk_idAgencia" PRIMARY KEY ("idAgencia")

);
-- ddl-end --
ALTER TABLE public."Agencia" OWNER TO postgres;
-- ddl-end --

-- object: public."Cuenta" | type: TABLE --
-- DROP TABLE IF EXISTS public."Cuenta" CASCADE;
CREATE TABLE public."Cuenta"(
	"nroCuenta" serial NOT NULL,
	tipo varchar(30),
	saldo float,
	"fechaInicio" date,
	"idUsuario_Usuario" integer,
	"idAgencia_Agencia" integer,
	CONSTRAINT "pk_nroCuenta" PRIMARY KEY ("nroCuenta")

);
-- ddl-end --
ALTER TABLE public."Cuenta" OWNER TO postgres;
-- ddl-end --

-- object: "Usuario_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Cuenta" DROP CONSTRAINT IF EXISTS "Usuario_fk" CASCADE;
ALTER TABLE public."Cuenta" ADD CONSTRAINT "Usuario_fk" FOREIGN KEY ("idUsuario_Usuario")
REFERENCES public."Usuario" ("idUsuario") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: "Agencia_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Cuenta" DROP CONSTRAINT IF EXISTS "Agencia_fk" CASCADE;
ALTER TABLE public."Cuenta" ADD CONSTRAINT "Agencia_fk" FOREIGN KEY ("idAgencia_Agencia")
REFERENCES public."Agencia" ("idAgencia") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: public."TelefonoUsuario" | type: TABLE --
-- DROP TABLE IF EXISTS public."TelefonoUsuario" CASCADE;
CREATE TABLE public."TelefonoUsuario"(
	"idUsuario_Usuario" integer NOT NULL,
	telefono varchar(20),
	CONSTRAINT "TelefonoUsuario_pk" PRIMARY KEY ("idUsuario_Usuario")

);
-- ddl-end --
ALTER TABLE public."TelefonoUsuario" OWNER TO postgres;
-- ddl-end --

-- object: "Usuario_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TelefonoUsuario" DROP CONSTRAINT IF EXISTS "Usuario_fk" CASCADE;
ALTER TABLE public."TelefonoUsuario" ADD CONSTRAINT "Usuario_fk" FOREIGN KEY ("idUsuario_Usuario")
REFERENCES public."Usuario" ("idUsuario") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: public."Persona" | type: TABLE --
-- DROP TABLE IF EXISTS public."Persona" CASCADE;
CREATE TABLE public."Persona"(
	"dniPersona" varchar(30) NOT NULL,
	names varchar(30),
	image varchar(50),
	apellido1 varchar(30),
	apellido2 varchar(30),
	"emailPersona" varchar(30),
	"isWorking" boolean,
	telefono varchar(30),
	"fechaInicioContrato" date NOT NULL,
	"fechaFinalContrato" date,
	"fechaNacimiento" date,
	direccion varchar(50),
	sexo varchar(30),
	"idTienda_Tienda" integer,
	CONSTRAINT "pk_dniPersona" PRIMARY KEY ("dniPersona"),
	CONSTRAINT unique_email_1 UNIQUE ("emailPersona")

);
-- ddl-end --
ALTER TABLE public."Persona" OWNER TO postgres;
-- ddl-end --

-- object: public."Salidos" | type: TABLE --
-- DROP TABLE IF EXISTS public."Salidos" CASCADE;
CREATE TABLE public."Salidos"(
	"dniPersona_Persona" varchar(30) NOT NULL,
	"fechaInicio" date,
	"fechaFinal" date,
	CONSTRAINT "Salidos_pk" PRIMARY KEY ("dniPersona_Persona")

);
-- ddl-end --
ALTER TABLE public."Salidos" OWNER TO postgres;
-- ddl-end --

-- object: "Persona_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Salidos" DROP CONSTRAINT IF EXISTS "Persona_fk" CASCADE;
ALTER TABLE public."Salidos" ADD CONSTRAINT "Persona_fk" FOREIGN KEY ("dniPersona_Persona")
REFERENCES public."Persona" ("dniPersona") MATCH FULL
ON DELETE NO ACTION ON UPDATE CASCADE;
-- ddl-end --

-- object: public."Automovil" | type: TABLE --
-- DROP TABLE IF EXISTS public."Automovil" CASCADE;
CREATE TABLE public."Automovil"(
	"idMovil" serial NOT NULL,
	"idUsuario_Usuario" integer,
	modelo varchar(30) NOT NULL,
	marca varchar(30),
	descripcion text,
	CONSTRAINT "pk_idMovil" PRIMARY KEY ("idMovil")

);
-- ddl-end --
ALTER TABLE public."Automovil" OWNER TO postgres;
-- ddl-end --

-- object: "Usuario_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Automovil" DROP CONSTRAINT IF EXISTS "Usuario_fk" CASCADE;
ALTER TABLE public."Automovil" ADD CONSTRAINT "Usuario_fk" FOREIGN KEY ("idUsuario_Usuario")
REFERENCES public."Usuario" ("idUsuario") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public."Tienda" | type: TABLE --
-- DROP TABLE IF EXISTS public."Tienda" CASCADE;
CREATE TABLE public."Tienda"(
	"idTienda" serial NOT NULL,
	"nameTienda" varchar(30),
	"departamentoT" varchar(30),
	"provinciaT" varchar(30),
	"direccionT" varchar(30),
	telefono varchar(30),
	CONSTRAINT "pk_idTienda" PRIMARY KEY ("idTienda")

);
-- ddl-end --
ALTER TABLE public."Tienda" OWNER TO postgres;
-- ddl-end --

-- object: "Tienda_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Persona" DROP CONSTRAINT IF EXISTS "Tienda_fk" CASCADE;
ALTER TABLE public."Persona" ADD CONSTRAINT "Tienda_fk" FOREIGN KEY ("idTienda_Tienda")
REFERENCES public."Tienda" ("idTienda") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public."Mercaderista" | type: TABLE --
-- DROP TABLE IF EXISTS public."Mercaderista" CASCADE;
CREATE TABLE public."Mercaderista"(
	"dniPersona_Persona" varchar(30) NOT NULL,
	"idProveedor_Proveedor" integer,
	CONSTRAINT "Mercaderista_pk" PRIMARY KEY ("dniPersona_Persona")

);
-- ddl-end --
ALTER TABLE public."Mercaderista" OWNER TO postgres;
-- ddl-end --

-- object: public."Personal" | type: TABLE --
-- DROP TABLE IF EXISTS public."Personal" CASCADE;
CREATE TABLE public."Personal"(
	"dniPersona_Persona" varchar(30) NOT NULL,
	"idSistemaP_SistemaPrevisional" integer,
	CONSTRAINT "Personal_pk" PRIMARY KEY ("dniPersona_Persona")

);
-- ddl-end --
ALTER TABLE public."Personal" OWNER TO postgres;
-- ddl-end --

-- object: public."Administrador" | type: TABLE --
-- DROP TABLE IF EXISTS public."Administrador" CASCADE;
CREATE TABLE public."Administrador"(
	"dniPersona_Persona" varchar(30) NOT NULL,
	"nameContrato_ContratoEspecial" varchar(30),
	CONSTRAINT "Administrador_pk" PRIMARY KEY ("dniPersona_Persona")

);
-- ddl-end --
ALTER TABLE public."Administrador" OWNER TO postgres;
-- ddl-end --

-- object: "Persona_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Mercaderista" DROP CONSTRAINT IF EXISTS "Persona_fk" CASCADE;
ALTER TABLE public."Mercaderista" ADD CONSTRAINT "Persona_fk" FOREIGN KEY ("dniPersona_Persona")
REFERENCES public."Persona" ("dniPersona") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: "Persona_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Personal" DROP CONSTRAINT IF EXISTS "Persona_fk" CASCADE;
ALTER TABLE public."Personal" ADD CONSTRAINT "Persona_fk" FOREIGN KEY ("dniPersona_Persona")
REFERENCES public."Persona" ("dniPersona") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: "Persona_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Administrador" DROP CONSTRAINT IF EXISTS "Persona_fk" CASCADE;
ALTER TABLE public."Administrador" ADD CONSTRAINT "Persona_fk" FOREIGN KEY ("dniPersona_Persona")
REFERENCES public."Persona" ("dniPersona") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: public."Proveedor" | type: TABLE --
-- DROP TABLE IF EXISTS public."Proveedor" CASCADE;
CREATE TABLE public."Proveedor"(
	"idProveedor" serial NOT NULL,
	"nameProveedor" varchar(30),
	pais varchar(30),
	departamento varchar(30),
	provincia varchar(30),
	direccion varchar(30),
	homepage varchar(30),
	telefono varchar(30),
	"personaContacto" varchar(30),
	CONSTRAINT "pk_idProvee" PRIMARY KEY ("idProveedor")

);
-- ddl-end --
ALTER TABLE public."Proveedor" OWNER TO postgres;
-- ddl-end --

-- object: "Proveedor_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Mercaderista" DROP CONSTRAINT IF EXISTS "Proveedor_fk" CASCADE;
ALTER TABLE public."Mercaderista" ADD CONSTRAINT "Proveedor_fk" FOREIGN KEY ("idProveedor_Proveedor")
REFERENCES public."Proveedor" ("idProveedor") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public."Producto" | type: TABLE --
-- DROP TABLE IF EXISTS public."Producto" CASCADE;
CREATE TABLE public."Producto"(
	"idProducto" serial NOT NULL,
	"idCategoria_Categoria" integer,
	"idProveedor_Proveedor" integer,
	"nameProducto" varchar(30),
	"reOrderLevel" bigint,
	"orderQuantly" bigint,
	stocklevel bigint,
	"precioUnidad" float,
	"descuentoAVG" float,
	"precioDescuento" float,
	image varchar(50),
	CONSTRAINT "pk_idProducto" PRIMARY KEY ("idProducto")

);
-- ddl-end --
ALTER TABLE public."Producto" OWNER TO postgres;
-- ddl-end --

-- object: "Proveedor_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Producto" DROP CONSTRAINT IF EXISTS "Proveedor_fk" CASCADE;
ALTER TABLE public."Producto" ADD CONSTRAINT "Proveedor_fk" FOREIGN KEY ("idProveedor_Proveedor")
REFERENCES public."Proveedor" ("idProveedor") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public."Area" | type: TABLE --
-- DROP TABLE IF EXISTS public."Area" CASCADE;
CREATE TABLE public."Area"(
	"idArea" serial NOT NULL,
	"dniPersona_Persona_Personal" varchar(30),
	"nameArea" varchar(30),
	descripcion text,
	CONSTRAINT "pk_idArea" PRIMARY KEY ("idArea")

);
-- ddl-end --
ALTER TABLE public."Area" OWNER TO postgres;
-- ddl-end --

-- object: public."Categoria" | type: TABLE --
-- DROP TABLE IF EXISTS public."Categoria" CASCADE;
CREATE TABLE public."Categoria"(
	"idCategoria" serial NOT NULL,
	"idArea_Area" integer,
	"nameCategoria" varchar(30),
	CONSTRAINT "pk_idCateg" PRIMARY KEY ("idCategoria")

);
-- ddl-end --
ALTER TABLE public."Categoria" OWNER TO postgres;
-- ddl-end --

-- object: "Area_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Categoria" DROP CONSTRAINT IF EXISTS "Area_fk" CASCADE;
ALTER TABLE public."Categoria" ADD CONSTRAINT "Area_fk" FOREIGN KEY ("idArea_Area")
REFERENCES public."Area" ("idArea") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Categoria_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Producto" DROP CONSTRAINT IF EXISTS "Categoria_fk" CASCADE;
ALTER TABLE public."Producto" ADD CONSTRAINT "Categoria_fk" FOREIGN KEY ("idCategoria_Categoria")
REFERENCES public."Categoria" ("idCategoria") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public."TrabajaParaMercaderista" | type: TABLE --
-- DROP TABLE IF EXISTS public."TrabajaParaMercaderista" CASCADE;
CREATE TABLE public."TrabajaParaMercaderista"(
	"dniPersona_Persona_Mercaderista" varchar(30) NOT NULL,
	"idArea_Area" integer NOT NULL,
	"cantidadHoras" bigint,
	"pagoPorHora" float,
	CONSTRAINT "TrabajaParaMercaderista_pk" PRIMARY KEY ("dniPersona_Persona_Mercaderista","idArea_Area")

);
-- ddl-end --
ALTER TABLE public."TrabajaParaMercaderista" OWNER TO postgres;
-- ddl-end --

-- object: "Mercaderista_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TrabajaParaMercaderista" DROP CONSTRAINT IF EXISTS "Mercaderista_fk" CASCADE;
ALTER TABLE public."TrabajaParaMercaderista" ADD CONSTRAINT "Mercaderista_fk" FOREIGN KEY ("dniPersona_Persona_Mercaderista")
REFERENCES public."Mercaderista" ("dniPersona_Persona") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: "Area_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TrabajaParaMercaderista" DROP CONSTRAINT IF EXISTS "Area_fk" CASCADE;
ALTER TABLE public."TrabajaParaMercaderista" ADD CONSTRAINT "Area_fk" FOREIGN KEY ("idArea_Area")
REFERENCES public."Area" ("idArea") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: "Personal_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Area" DROP CONSTRAINT IF EXISTS "Personal_fk" CASCADE;
ALTER TABLE public."Area" ADD CONSTRAINT "Personal_fk" FOREIGN KEY ("dniPersona_Persona_Personal")
REFERENCES public."Personal" ("dniPersona_Persona") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public."TrabajaParaPersonal" | type: TABLE --
-- DROP TABLE IF EXISTS public."TrabajaParaPersonal" CASCADE;
CREATE TABLE public."TrabajaParaPersonal"(
	"dniPersona_Persona_Personal" varchar(30) NOT NULL,
	"idArea_Area" integer NOT NULL,
	"cantidadHoras" bigint,
	"pagoPorHora" float,
	CONSTRAINT "TrabajaParaPersonal_pk" PRIMARY KEY ("idArea_Area","dniPersona_Persona_Personal")

);
-- ddl-end --
ALTER TABLE public."TrabajaParaPersonal" OWNER TO postgres;
-- ddl-end --

-- object: "Area_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TrabajaParaPersonal" DROP CONSTRAINT IF EXISTS "Area_fk" CASCADE;
ALTER TABLE public."TrabajaParaPersonal" ADD CONSTRAINT "Area_fk" FOREIGN KEY ("idArea_Area")
REFERENCES public."Area" ("idArea") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: "Personal_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TrabajaParaPersonal" DROP CONSTRAINT IF EXISTS "Personal_fk" CASCADE;
ALTER TABLE public."TrabajaParaPersonal" ADD CONSTRAINT "Personal_fk" FOREIGN KEY ("dniPersona_Persona_Personal")
REFERENCES public."Personal" ("dniPersona_Persona") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: public."SistemaPrevisional" | type: TABLE --
-- DROP TABLE IF EXISTS public."SistemaPrevisional" CASCADE;
CREATE TABLE public."SistemaPrevisional"(
	"idSistemaP" serial NOT NULL,
	"nameSistemaP" varchar(30),
	"porcentajeAporte" float,
	descripcion text,
	CONSTRAINT "pk_idSistemaP" PRIMARY KEY ("idSistemaP")

);
-- ddl-end --
ALTER TABLE public."SistemaPrevisional" OWNER TO postgres;
-- ddl-end --

-- object: "SistemaPrevisional_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Personal" DROP CONSTRAINT IF EXISTS "SistemaPrevisional_fk" CASCADE;
ALTER TABLE public."Personal" ADD CONSTRAINT "SistemaPrevisional_fk" FOREIGN KEY ("idSistemaP_SistemaPrevisional")
REFERENCES public."SistemaPrevisional" ("idSistemaP") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public."Almacen" | type: TABLE --
-- DROP TABLE IF EXISTS public."Almacen" CASCADE;
CREATE TABLE public."Almacen"(
	"idAlmacen" serial NOT NULL,
	"nameAlmacen" varchar(30),
	telefono varchar(30),
	correo varchar(30),
	CONSTRAINT "pk_idAlmacen" PRIMARY KEY ("idAlmacen")

);
-- ddl-end --
ALTER TABLE public."Almacen" OWNER TO postgres;
-- ddl-end --

-- object: public."AlmacenInterno" | type: TABLE --
-- DROP TABLE IF EXISTS public."AlmacenInterno" CASCADE;
CREATE TABLE public."AlmacenInterno"(
	"dniPersona_Persona_Personal" varchar(30) NOT NULL,
	"idAlmacen_Almacen" integer NOT NULL,
	"idTienda_Tienda" integer,
	"cantidadLosas" smallint,
	CONSTRAINT "AlmacenInterno_pk" PRIMARY KEY ("idAlmacen_Almacen","dniPersona_Persona_Personal")

);
-- ddl-end --
ALTER TABLE public."AlmacenInterno" OWNER TO postgres;
-- ddl-end --

-- object: public."AlmacenExterno" | type: TABLE --
-- DROP TABLE IF EXISTS public."AlmacenExterno" CASCADE;
CREATE TABLE public."AlmacenExterno"(
	"idAlmacen_Almacen" integer NOT NULL,
	departamento varchar(30),
	provincia varchar(30),
	direccion varchar(30),
	"personaContacto" varchar(30),
	CONSTRAINT "AlmacenExterno_pk" PRIMARY KEY ("idAlmacen_Almacen")

);
-- ddl-end --
ALTER TABLE public."AlmacenExterno" OWNER TO postgres;
-- ddl-end --

-- object: "Almacen_fk" | type: CONSTRAINT --
-- ALTER TABLE public."AlmacenInterno" DROP CONSTRAINT IF EXISTS "Almacen_fk" CASCADE;
ALTER TABLE public."AlmacenInterno" ADD CONSTRAINT "Almacen_fk" FOREIGN KEY ("idAlmacen_Almacen")
REFERENCES public."Almacen" ("idAlmacen") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Almacen_fk" | type: CONSTRAINT --
-- ALTER TABLE public."AlmacenExterno" DROP CONSTRAINT IF EXISTS "Almacen_fk" CASCADE;
ALTER TABLE public."AlmacenExterno" ADD CONSTRAINT "Almacen_fk" FOREIGN KEY ("idAlmacen_Almacen")
REFERENCES public."Almacen" ("idAlmacen") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Personal_fk" | type: CONSTRAINT --
-- ALTER TABLE public."AlmacenInterno" DROP CONSTRAINT IF EXISTS "Personal_fk" CASCADE;
ALTER TABLE public."AlmacenInterno" ADD CONSTRAINT "Personal_fk" FOREIGN KEY ("dniPersona_Persona_Personal")
REFERENCES public."Personal" ("dniPersona_Persona") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: "Tienda_fk" | type: CONSTRAINT --
-- ALTER TABLE public."AlmacenInterno" DROP CONSTRAINT IF EXISTS "Tienda_fk" CASCADE;
ALTER TABLE public."AlmacenInterno" ADD CONSTRAINT "Tienda_fk" FOREIGN KEY ("idTienda_Tienda")
REFERENCES public."Tienda" ("idTienda") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: public."Estacionamiento" | type: TABLE --
-- DROP TABLE IF EXISTS public."Estacionamiento" CASCADE;
CREATE TABLE public."Estacionamiento"(
	"idEstac" serial NOT NULL,
	"idTienda_Tienda" integer,
	nivel varchar(30),
	CONSTRAINT "pk_idEstac" PRIMARY KEY ("idEstac")

);
-- ddl-end --
ALTER TABLE public."Estacionamiento" OWNER TO postgres;
-- ddl-end --

-- object: "Tienda_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Estacionamiento" DROP CONSTRAINT IF EXISTS "Tienda_fk" CASCADE;
ALTER TABLE public."Estacionamiento" ADD CONSTRAINT "Tienda_fk" FOREIGN KEY ("idTienda_Tienda")
REFERENCES public."Tienda" ("idTienda") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: public."Registro" | type: TABLE --
-- DROP TABLE IF EXISTS public."Registro" CASCADE;
CREATE TABLE public."Registro"(
	"idRegistro" smallint NOT NULL,
	"idMovil_Automovil" integer,
	"idEstac_Estacionamiento" integer,
	"dniPersona_Persona_Personal" varchar(30),
	"dniConductor" varchar(30),
	CONSTRAINT "pk_idReg" PRIMARY KEY ("idRegistro")

);
-- ddl-end --
ALTER TABLE public."Registro" OWNER TO postgres;
-- ddl-end --

-- object: "Estacionamiento_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Registro" DROP CONSTRAINT IF EXISTS "Estacionamiento_fk" CASCADE;
ALTER TABLE public."Registro" ADD CONSTRAINT "Estacionamiento_fk" FOREIGN KEY ("idEstac_Estacionamiento")
REFERENCES public."Estacionamiento" ("idEstac") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: "Automovil_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Registro" DROP CONSTRAINT IF EXISTS "Automovil_fk" CASCADE;
ALTER TABLE public."Registro" ADD CONSTRAINT "Automovil_fk" FOREIGN KEY ("idMovil_Automovil")
REFERENCES public."Automovil" ("idMovil") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: public."detalleRegistro" | type: TABLE --
-- DROP TABLE IF EXISTS public."detalleRegistro" CASCADE;
CREATE TABLE public."detalleRegistro"(
	"idRegistroDetalle" serial NOT NULL,
	"idRegistro_Registro" smallint,
	"HoraEntrada" time,
	"horaSalida" time,
	"Fraccion" float,
	CONSTRAINT "pk_idDR" PRIMARY KEY ("idRegistroDetalle")

);
-- ddl-end --
ALTER TABLE public."detalleRegistro" OWNER TO postgres;
-- ddl-end --

-- object: "Registro_fk" | type: CONSTRAINT --
-- ALTER TABLE public."detalleRegistro" DROP CONSTRAINT IF EXISTS "Registro_fk" CASCADE;
ALTER TABLE public."detalleRegistro" ADD CONSTRAINT "Registro_fk" FOREIGN KEY ("idRegistro_Registro")
REFERENCES public."Registro" ("idRegistro") MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: "Personal_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Registro" DROP CONSTRAINT IF EXISTS "Personal_fk" CASCADE;
ALTER TABLE public."Registro" ADD CONSTRAINT "Personal_fk" FOREIGN KEY ("dniPersona_Persona_Personal")
REFERENCES public."Personal" ("dniPersona_Persona") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public."ContratoEspecial" | type: TABLE --
-- DROP TABLE IF EXISTS public."ContratoEspecial" CASCADE;
CREATE TABLE public."ContratoEspecial"(
	"nameContrato" varchar(30) NOT NULL,
	descripcion text,
	CONSTRAINT "pk_nameCon" PRIMARY KEY ("nameContrato")

);
-- ddl-end --
ALTER TABLE public."ContratoEspecial" OWNER TO postgres;
-- ddl-end --

-- object: "ContratoEspecial_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Administrador" DROP CONSTRAINT IF EXISTS "ContratoEspecial_fk" CASCADE;
ALTER TABLE public."Administrador" ADD CONSTRAINT "ContratoEspecial_fk" FOREIGN KEY ("nameContrato_ContratoEspecial")
REFERENCES public."ContratoEspecial" ("nameContrato") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public."AdminRecursos" | type: TABLE --
-- DROP TABLE IF EXISTS public."AdminRecursos" CASCADE;
CREATE TABLE public."AdminRecursos"(
	"dniPersona_Persona_Administrador" varchar(30) NOT NULL,
	CONSTRAINT "AdminRecursos_pk" PRIMARY KEY ("dniPersona_Persona_Administrador")

);
-- ddl-end --
ALTER TABLE public."AdminRecursos" OWNER TO postgres;
-- ddl-end --

-- object: public."AdminHumanidades" | type: TABLE --
-- DROP TABLE IF EXISTS public."AdminHumanidades" CASCADE;
CREATE TABLE public."AdminHumanidades"(
	"dniPersona_Persona_Administrador" varchar(30) NOT NULL,
	CONSTRAINT "AdminHumanidades_pk" PRIMARY KEY ("dniPersona_Persona_Administrador")

);
-- ddl-end --
ALTER TABLE public."AdminHumanidades" OWNER TO postgres;
-- ddl-end --

-- object: "Administrador_fk" | type: CONSTRAINT --
-- ALTER TABLE public."AdminRecursos" DROP CONSTRAINT IF EXISTS "Administrador_fk" CASCADE;
ALTER TABLE public."AdminRecursos" ADD CONSTRAINT "Administrador_fk" FOREIGN KEY ("dniPersona_Persona_Administrador")
REFERENCES public."Administrador" ("dniPersona_Persona") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Administrador_fk" | type: CONSTRAINT --
-- ALTER TABLE public."AdminHumanidades" DROP CONSTRAINT IF EXISTS "Administrador_fk" CASCADE;
ALTER TABLE public."AdminHumanidades" ADD CONSTRAINT "Administrador_fk" FOREIGN KEY ("dniPersona_Persona_Administrador")
REFERENCES public."Administrador" ("dniPersona_Persona") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public."Shipper" | type: TABLE --
-- DROP TABLE IF EXISTS public."Shipper" CASCADE;
CREATE TABLE public."Shipper"(
	"idCompañia" serial NOT NULL,
	"nameCompañia" varchar(30),
	telefono varchar(30),
	CONSTRAINT "pk_idCom" PRIMARY KEY ("idCompañia")

);
-- ddl-end --
ALTER TABLE public."Shipper" OWNER TO postgres;
-- ddl-end --

-- object: public."Order" | type: TABLE --
-- DROP TABLE IF EXISTS public."Order" CASCADE;
CREATE TABLE public."Order"(
	"idOrder" serial NOT NULL,
	"dniPersona_Persona_Personal" varchar(30),
	"idUsuario_Usuario" integer,
	"idCompañia_Shipper" integer,
	"dateOrder" date,
	"shipName" varchar(30),
	"shipVia" varchar(30),
	"shippedDate" date,
	"shipDepartamento" varchar(30),
	"shipProvincia" varchar(30),
	direccion varchar(30),
	CONSTRAINT "ṕk_idOrder" PRIMARY KEY ("idOrder")

);
-- ddl-end --
ALTER TABLE public."Order" OWNER TO postgres;
-- ddl-end --

-- object: "Usuario_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Order" DROP CONSTRAINT IF EXISTS "Usuario_fk" CASCADE;
ALTER TABLE public."Order" ADD CONSTRAINT "Usuario_fk" FOREIGN KEY ("idUsuario_Usuario")
REFERENCES public."Usuario" ("idUsuario") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Shipper_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Order" DROP CONSTRAINT IF EXISTS "Shipper_fk" CASCADE;
ALTER TABLE public."Order" ADD CONSTRAINT "Shipper_fk" FOREIGN KEY ("idCompañia_Shipper")
REFERENCES public."Shipper" ("idCompañia") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Personal_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Order" DROP CONSTRAINT IF EXISTS "Personal_fk" CASCADE;
ALTER TABLE public."Order" ADD CONSTRAINT "Personal_fk" FOREIGN KEY ("dniPersona_Persona_Personal")
REFERENCES public."Personal" ("dniPersona_Persona") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public."DetailsOrden" | type: TABLE --
-- DROP TABLE IF EXISTS public."DetailsOrden" CASCADE;
CREATE TABLE public."DetailsOrden"(
	"idProducto_Producto" integer NOT NULL,
	"idOrder_Order" integer NOT NULL,
	cantidad bigint,
	descuento float,
	CONSTRAINT "DetailsOrden_pk" PRIMARY KEY ("idOrder_Order","idProducto_Producto")

);
-- ddl-end --
ALTER TABLE public."DetailsOrden" OWNER TO postgres;
-- ddl-end --

-- object: "Order_fk" | type: CONSTRAINT --
-- ALTER TABLE public."DetailsOrden" DROP CONSTRAINT IF EXISTS "Order_fk" CASCADE;
ALTER TABLE public."DetailsOrden" ADD CONSTRAINT "Order_fk" FOREIGN KEY ("idOrder_Order")
REFERENCES public."Order" ("idOrder") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Producto_fk" | type: CONSTRAINT --
-- ALTER TABLE public."DetailsOrden" DROP CONSTRAINT IF EXISTS "Producto_fk" CASCADE;
ALTER TABLE public."DetailsOrden" ADD CONSTRAINT "Producto_fk" FOREIGN KEY ("idProducto_Producto")
REFERENCES public."Producto" ("idProducto") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


