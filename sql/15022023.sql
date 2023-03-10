PGDMP         #                {            cr    14.6    14.6 ?    r           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            s           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            t           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            u           1262    66778    cr    DATABASE     k   CREATE DATABASE cr WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Dominican Republic.1252';
    DROP DATABASE cr;
                postgres    false                        2615    68428    iniciar    SCHEMA        CREATE SCHEMA iniciar;
    DROP SCHEMA iniciar;
                crduser    false            ;           1255    68793    insertadetallemiscursos()    FUNCTION     ?  CREATE FUNCTION iniciar.insertadetallemiscursos() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  insert into iniciar.tbl_detalle_mis_cursos(id_mis_cursos,id_detalle,id_miembro,estado,id_curso,titulo,descripcion,url,tipo,duracion)
select new.id,det.id,new.id_miembro,'Sin Iniciar',det.id_curso,det.titulo,det.descripcion,det.url,det.tipo,det.duracion from iniciar.tbl_detalle_de_cursos det;
    RETURN NEW;
END;
$$;
 1   DROP FUNCTION iniciar.insertadetallemiscursos();
       iniciar          crduser    false    8            <           1255    68429    spt_movimiento_miembros()    FUNCTION     ?  CREATE FUNCTION iniciar.spt_movimiento_miembros() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

begin
insert into iniciar."tbl_transacciones_de_miembros"(id_miembro,descripcion,
											valor_anterior,valor_actual,estado,agregado_por,agregado_en,
											rol_agregado_id,rol_agregado_nom,modificado_por,modificado_en,
											rol_modificado_id,rol_modificado_nom
										   
										   )values(old.id,'Actualizacion o Modificacion de Nombre de Miembro',
													old.nombre,new.nombre,'Activo',new.agregado_por,new.agregado_en,
											new.rol_agregado_id,new.rol_agregado_nom,new.modificado_por,new.modificado_en,
											new.rol_modificado_id,new.rol_modificado_nom );


return new;
end 
$$;
 1   DROP FUNCTION iniciar.spt_movimiento_miembros();
       iniciar          postgres    false    8                       1259    68430     tbl_informacion_adicional    TABLE     )  CREATE TABLE iniciar." tbl_informacion_adicional" (
    id bigint NOT NULL,
    id_pais bigint NOT NULL,
    id_miembro bigint NOT NULL,
    id_tipo_informacion bigint NOT NULL,
    valor character(1000) NOT NULL,
    estado character(10) NOT NULL,
    agregado_por character(100) NOT NULL,
    agregado_en time without time zone NOT NULL,
    rol_agregado_id bigint,
    rol_agregado_nom character(100),
    modificado_por character(100),
    modificado_en time without time zone,
    rol_modificado_id bigint,
    rol_modificado_nom character(100)
);
 1   DROP TABLE iniciar." tbl_informacion_adicional";
       iniciar         heap    crduser    false    8            v           0    0 "   TABLE " tbl_informacion_adicional"    COMMENT     ?   COMMENT ON TABLE iniciar." tbl_informacion_adicional" IS 'Aqui se almacena los diferentes tipos de informacion relacionada a un miembro';
          iniciar          crduser    false    262                       1259    68435 !    tbl_informacion_adicional_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar." tbl_informacion_adicional_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE iniciar." tbl_informacion_adicional_id_seq";
       iniciar          crduser    false    262    8            w           0    0 !    tbl_informacion_adicional_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE iniciar." tbl_informacion_adicional_id_seq" OWNED BY iniciar." tbl_informacion_adicional".id;
          iniciar          crduser    false    263                       1259    68436    tbl_area_de_accion    TABLE       CREATE TABLE iniciar.tbl_area_de_accion (
    id bigint NOT NULL,
    id_pais bigint NOT NULL,
    id_area bigint NOT NULL,
    id_sede bigint NOT NULL,
    descripcion character(100) NOT NULL,
    estado character(10) NOT NULL,
    agregado_por character(100) NOT NULL,
    agregado_en time without time zone NOT NULL,
    rol_agregado_id bigint,
    rol_agregado_nom character(100),
    modificado_por character(100),
    modificado_en time without time zone,
    rol_modificado_id bigint,
    rol_modificado_nom character(100)
);
 '   DROP TABLE iniciar.tbl_area_de_accion;
       iniciar         heap    crduser    false    8            x           0    0    TABLE tbl_area_de_accion    COMMENT     B   COMMENT ON TABLE iniciar.tbl_area_de_accion IS 'Area de Accion ';
          iniciar          crduser    false    264            	           1259    68441    tbl_area_de_accion_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar.tbl_area_de_accion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE iniciar.tbl_area_de_accion_id_seq;
       iniciar          crduser    false    8    264            y           0    0    tbl_area_de_accion_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE iniciar.tbl_area_de_accion_id_seq OWNED BY iniciar.tbl_area_de_accion.id;
          iniciar          crduser    false    265            
           1259    68442    tbl_areas_id_seq    SEQUENCE     z   CREATE SEQUENCE iniciar.tbl_areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE iniciar.tbl_areas_id_seq;
       iniciar          crduser    false    8                       1259    68443 	   tbl_areas    TABLE     Z  CREATE TABLE iniciar.tbl_areas (
    id bigint DEFAULT nextval('iniciar.tbl_areas_id_seq'::regclass) NOT NULL,
    id_pais bigint NOT NULL,
    id_sede bigint NOT NULL,
    nombre character varying(100) NOT NULL,
    estado character varying(10) NOT NULL,
    agregado_por character varying(100) NOT NULL,
    agregado_en timestamp without time zone NOT NULL,
    rol_agregado_id bigint,
    rol_agregado_nom character varying(100),
    modificado_por character varying(100),
    modificado_en timestamp without time zone,
    rol_modificado_id bigint,
    rol_modificado_nom character varying(100)
);
    DROP TABLE iniciar.tbl_areas;
       iniciar         heap    crduser    false    266    8            z           0    0    TABLE tbl_areas    COMMENT     S   COMMENT ON TABLE iniciar.tbl_areas IS 'Esto almacendra todas las areas por sedes';
          iniciar          crduser    false    267                       1259    68449 
   tbl_cursos    TABLE     ?  CREATE TABLE iniciar.tbl_cursos (
    id bigint NOT NULL,
    id_pais bigint NOT NULL,
    descripcion character varying(10000) NOT NULL,
    duracion numeric(2,2),
    tipo character varying(100),
    estado character varying(50),
    agregado_por character varying(100) NOT NULL,
    agregado_en timestamp without time zone NOT NULL,
    rol_agregado_id bigint,
    rol_agregado_nom character varying(100),
    modificado_por character varying(100),
    modificado_en timestamp without time zone,
    rol_modificado_id bigint,
    rol_modificado_nom character varying,
    portada character varying(1000),
    nombre character varying(1000),
    idcolection character varying(500),
    uuid character varying(500)
);
    DROP TABLE iniciar.tbl_cursos;
       iniciar         heap    postgres    false    8            {           0    0    TABLE tbl_cursos    COMMENT     I   COMMENT ON TABLE iniciar.tbl_cursos IS 'aqui se crean todos los cursos';
          iniciar          postgres    false    268                       1259    68454    tbl_cursos_id_seq    SEQUENCE     {   CREATE SEQUENCE iniciar.tbl_cursos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE iniciar.tbl_cursos_id_seq;
       iniciar          postgres    false    268    8            |           0    0    tbl_cursos_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE iniciar.tbl_cursos_id_seq OWNED BY iniciar.tbl_cursos.id;
          iniciar          postgres    false    269                       1259    68455    tbl_det_roles_id_seq    SEQUENCE     ~   CREATE SEQUENCE iniciar.tbl_det_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE iniciar.tbl_det_roles_id_seq;
       iniciar          neoalex    false    8            }           0    0    SEQUENCE tbl_det_roles_id_seq    ACL     ?   GRANT ALL ON SEQUENCE iniciar.tbl_det_roles_id_seq TO crduser;
          iniciar          neoalex    false    270                       1259    68456    tbl_det_roles    TABLE     ?  CREATE TABLE iniciar.tbl_det_roles (
    id bigint DEFAULT nextval('iniciar.tbl_det_roles_id_seq'::regclass) NOT NULL,
    id_pais bigint NOT NULL,
    id_roles bigint NOT NULL,
    id_opcion bigint NOT NULL,
    estado character varying(50) NOT NULL,
    agregado_por character varying(100) NOT NULL,
    agregado_en timestamp without time zone NOT NULL,
    modificado_por character(100),
    modificado_en timestamp without time zone,
    leer boolean NOT NULL,
    escribir boolean NOT NULL,
    imprimir boolean NOT NULL,
    eliminar boolean NOT NULL,
    rol_agregado_id bigint,
    rol_agregado_nom character varying,
    rol_modificado_id bigint,
    rol_modificado_nom character varying
);
 "   DROP TABLE iniciar.tbl_det_roles;
       iniciar         heap    crduser    false    270    8                       1259    68462    tbl_detalle_de_cursos    TABLE       CREATE TABLE iniciar.tbl_detalle_de_cursos (
    id bigint NOT NULL,
    id_curso bigint NOT NULL,
    titulo character varying(100) NOT NULL,
    descripcion character varying(1000) NOT NULL,
    tipo character varying(20),
    url character varying(1000),
    id_formulario bigint,
    portada character varying(1000),
    agregado_por character varying(100),
    agregado_en timestamp without time zone,
    rol_agregado_id bigint,
    rol_agregado_nom character varying(100),
    modificado_por character varying(100),
    modificado_en timestamp without time zone,
    rol_modificado_id bigint,
    rol_modificado_nom character varying(100),
    uuid character varying(500),
    estado character varying(50),
    guid character varying(500),
    duracion bigint
);
 *   DROP TABLE iniciar.tbl_detalle_de_cursos;
       iniciar         heap    postgres    false    8                       1259    68467    tbl_detalle_de_cursos_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar.tbl_detalle_de_cursos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE iniciar.tbl_detalle_de_cursos_id_seq;
       iniciar          postgres    false    272    8            ~           0    0    tbl_detalle_de_cursos_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE iniciar.tbl_detalle_de_cursos_id_seq OWNED BY iniciar.tbl_detalle_de_cursos.id;
          iniciar          postgres    false    273            9           1259    68776    tbl_detalle_mis_cursos    TABLE     ?  CREATE TABLE iniciar.tbl_detalle_mis_cursos (
    id bigint NOT NULL,
    id_mis_cursos bigint NOT NULL,
    id_detalle bigint NOT NULL,
    id_miembro bigint NOT NULL,
    tiempo bigint,
    estado character varying(100),
    id_curso bigint NOT NULL,
    titulo character varying(100),
    descripcion character varying(1000),
    url character varying(1000),
    tipo character varying(100),
    duracion bigint
);
 +   DROP TABLE iniciar.tbl_detalle_mis_cursos;
       iniciar         heap    postgres    false    8            8           1259    68775    tbl_detalle_mis_cursos_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar.tbl_detalle_mis_cursos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE iniciar.tbl_detalle_mis_cursos_id_seq;
       iniciar          postgres    false    313    8                       0    0    tbl_detalle_mis_cursos_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE iniciar.tbl_detalle_mis_cursos_id_seq OWNED BY iniciar.tbl_detalle_mis_cursos.id;
          iniciar          postgres    false    312                       1259    68468    tbl_division_id_seq    SEQUENCE     }   CREATE SEQUENCE iniciar.tbl_division_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE iniciar.tbl_division_id_seq;
       iniciar          crduser    false    8                       1259    68469    tbl_division    TABLE     \  CREATE TABLE iniciar.tbl_division (
    id bigint DEFAULT nextval('iniciar.tbl_division_id_seq'::regclass) NOT NULL,
    id_pais bigint NOT NULL,
    id_tipo_division bigint NOT NULL,
    nombre character varying NOT NULL,
    depende bigint,
    estado character varying,
    agregado_por character varying NOT NULL,
    agregado_en timestamp without time zone NOT NULL,
    rol_agregado_id bigint,
    rol_agregado_nom character varying,
    modificado_por character varying,
    modificado_en timestamp without time zone,
    rol_modificado_id bigint,
    rol_modificado_nom character varying(100)
);
 !   DROP TABLE iniciar.tbl_division;
       iniciar         heap    crduser    false    274    8            ?           0    0    TABLE tbl_division    COMMENT     N   COMMENT ON TABLE iniciar.tbl_division IS 'Tabla de Divisiones de los paises';
          iniciar          crduser    false    275                       1259    68475    tbl_imagenes_miembros    TABLE     ]  CREATE TABLE iniciar.tbl_imagenes_miembros (
    id bigint NOT NULL,
    id_miembro bigint NOT NULL,
    id_pais bigint NOT NULL,
    url character varying(1000) NOT NULL,
    descripcion character varying(100) NOT NULL,
    agregado_por character varying(100) NOT NULL,
    agregado_en timestamp without time zone NOT NULL,
    rol_agregado_id bigint,
    rol_agregado_nom character varying(100),
    modificado_por character varying(100),
    modificado_en timestamp without time zone,
    rol_modificado_id bigint,
    rol_modificado_nom character varying,
    estado character varying(10) NOT NULL
);
 *   DROP TABLE iniciar.tbl_imagenes_miembros;
       iniciar         heap    postgres    false    8            ?           0    0    TABLE tbl_imagenes_miembros    COMMENT     g   COMMENT ON TABLE iniciar.tbl_imagenes_miembros IS 'Aqui se almacena todas las images de los miembros';
          iniciar          postgres    false    276                       1259    68480    tbl_imagenes_miembros_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar.tbl_imagenes_miembros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE iniciar.tbl_imagenes_miembros_id_seq;
       iniciar          postgres    false    276    8            ?           0    0    tbl_imagenes_miembros_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE iniciar.tbl_imagenes_miembros_id_seq OWNED BY iniciar.tbl_imagenes_miembros.id;
          iniciar          postgres    false    277                       1259    68481    tbl_miembros_id_seq    SEQUENCE     }   CREATE SEQUENCE iniciar.tbl_miembros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE iniciar.tbl_miembros_id_seq;
       iniciar          postgres    false    8            ?           0    0    SEQUENCE tbl_miembros_id_seq    ACL     >   GRANT ALL ON SEQUENCE iniciar.tbl_miembros_id_seq TO crduser;
          iniciar          postgres    false    278                       1259    68482    tbl_miembros    TABLE     Q  CREATE TABLE iniciar.tbl_miembros (
    id bigint DEFAULT nextval('iniciar.tbl_miembros_id_seq'::regclass) NOT NULL,
    id_pais bigint NOT NULL,
    id_sede bigint,
    id_area bigint,
    nombre character varying(100) NOT NULL,
    apellido character varying(100) NOT NULL,
    nacionalidad character varying(100) NOT NULL,
    lugar_de_nacimiento character varying(100) NOT NULL,
    fecha_de_nacimiento date NOT NULL,
    id_tipo_documento bigint NOT NULL,
    documento character varying(50) NOT NULL,
    estado character varying(10) NOT NULL,
    agregado_por character varying(100) NOT NULL,
    agregado_en timestamp without time zone NOT NULL,
    rol_agregado_id bigint,
    rol_agregado_nom character varying(100),
    modificado_por character varying(100),
    modificado_en timestamp without time zone,
    rol_modificado_id bigint,
    rol_modificado_nom character varying(100),
    tiempo_voluntariado numeric(15,2),
    email character varying(100),
    fecha_de_registro date NOT NULL,
    fecha_de_finalizacion date,
    tipo_miembro bigint NOT NULL,
    uuid character varying(100)
);
 !   DROP TABLE iniciar.tbl_miembros;
       iniciar         heap    crduser    false    278    8            ?           0    0    TABLE tbl_miembros    COMMENT     j   COMMENT ON TABLE iniciar.tbl_miembros IS 'Esto almacena todo los miembro tanto voluntario asalariado y ';
          iniciar          crduser    false    279                       1259    68488    tbl_miembros_posiciones    TABLE     *  CREATE TABLE iniciar.tbl_miembros_posiciones (
    id bigint NOT NULL,
    id_pais bigint NOT NULL,
    id_miembro bigint NOT NULL,
    estado character varying(50) NOT NULL,
    agregado_por character varying(100) NOT NULL,
    agregado_en timestamp without time zone NOT NULL,
    rol_agregado_id bigint,
    rol_agregado_nom character varying(100),
    modificado_por character varying(100),
    modificado_en timestamp without time zone,
    rol_modificado_id bigint,
    rol_modificado_nom character varying(100),
    id_posicion bigint NOT NULL
);
 ,   DROP TABLE iniciar.tbl_miembros_posiciones;
       iniciar         heap    postgres    false    8            ?           0    0    TABLE tbl_miembros_posiciones    COMMENT     ?   COMMENT ON TABLE iniciar.tbl_miembros_posiciones IS 'Esta Tabla Contiene los Miembros y las Posiciones  asociadas a este miembro';
          iniciar          postgres    false    280                       1259    68491    tbl_miembros_posiciones_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar.tbl_miembros_posiciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE iniciar.tbl_miembros_posiciones_id_seq;
       iniciar          postgres    false    8    280            ?           0    0    tbl_miembros_posiciones_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE iniciar.tbl_miembros_posiciones_id_seq OWNED BY iniciar.tbl_miembros_posiciones.id;
          iniciar          postgres    false    281            7           1259    68767    tbl_mis_cursos    TABLE     g  CREATE TABLE iniciar.tbl_mis_cursos (
    id bigint NOT NULL,
    id_miembro bigint NOT NULL,
    id_curso bigint NOT NULL,
    fecha_de_inicio date NOT NULL,
    fecha_de_finalizacion date,
    completado character varying(50),
    estado character varying(50) NOT NULL,
    agregado_por character varying(100) NOT NULL,
    agregado_en timestamp without time zone NOT NULL,
    rol_agregado_id bigint,
    rol_agregado_nom character varying(100),
    modificado_por character varying(100),
    modificado_en timestamp with time zone,
    rol_modificado_id bigint,
    rol_modificado_nom character varying(100)
);
 #   DROP TABLE iniciar.tbl_mis_cursos;
       iniciar         heap    postgres    false    8            6           1259    68766    tbl_mis_cursos_id_seq    SEQUENCE        CREATE SEQUENCE iniciar.tbl_mis_cursos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE iniciar.tbl_mis_cursos_id_seq;
       iniciar          postgres    false    311    8            ?           0    0    tbl_mis_cursos_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE iniciar.tbl_mis_cursos_id_seq OWNED BY iniciar.tbl_mis_cursos.id;
          iniciar          postgres    false    310                       1259    68492    tbl_modulos_id_seq    SEQUENCE     |   CREATE SEQUENCE iniciar.tbl_modulos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE iniciar.tbl_modulos_id_seq;
       iniciar          neoalex    false    8                       1259    68493    tbl_modulos    TABLE     ?   CREATE TABLE iniciar.tbl_modulos (
    id bigint DEFAULT nextval('iniciar.tbl_modulos_id_seq'::regclass) NOT NULL,
    id_pais bigint NOT NULL,
    descripcion character(100) NOT NULL,
    estado character(50) NOT NULL
);
     DROP TABLE iniciar.tbl_modulos;
       iniciar         heap    crduser    false    282    8            ?           0    0    TABLE tbl_modulos    COMMENT     |   COMMENT ON TABLE iniciar.tbl_modulos IS 'almacena todos los modulos de la aplicacion en principio solo es los voluntarios';
          iniciar          crduser    false    283                       1259    68497    tbl_opciones_id_seq    SEQUENCE     }   CREATE SEQUENCE iniciar.tbl_opciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE iniciar.tbl_opciones_id_seq;
       iniciar          neoalex    false    8            ?           0    0    SEQUENCE tbl_opciones_id_seq    ACL     >   GRANT ALL ON SEQUENCE iniciar.tbl_opciones_id_seq TO crduser;
          iniciar          neoalex    false    284                       1259    68498    tbl_opciones    TABLE     @  CREATE TABLE iniciar.tbl_opciones (
    id bigint DEFAULT nextval('iniciar.tbl_opciones_id_seq'::regclass) NOT NULL,
    id_pais bigint NOT NULL,
    descripcion character varying(100) NOT NULL,
    estado character varying(50) NOT NULL,
    agregado_por character varying(100) NOT NULL,
    agregado_en timestamp without time zone NOT NULL,
    modificado_por character(100),
    modificado_en timestamp without time zone,
    rol_agregado_id bigint,
    rol_agregado_nom character varying(100),
    rol_modificado_id bigint,
    rol_modificado_nom character varying(100)
);
 !   DROP TABLE iniciar.tbl_opciones;
       iniciar         heap    crduser    false    284    8            ?           0    0    TABLE tbl_opciones    COMMENT     g   COMMENT ON TABLE iniciar.tbl_opciones IS 'esto almacena todas las opciones del menu de la aplicacion';
          iniciar          crduser    false    285                       1259    68504 
   tbl_paises    TABLE     ?  CREATE TABLE iniciar.tbl_paises (
    id bigint NOT NULL,
    codigo integer NOT NULL,
    bandera bytea,
    nombre character varying NOT NULL,
    alpha2 character varying NOT NULL,
    alpha3 character varying NOT NULL,
    domains character varying NOT NULL,
    habitantes character varying NOT NULL,
    superficie integer NOT NULL,
    estado character varying NOT NULL,
    ruta_bandera character varying NOT NULL
);
    DROP TABLE iniciar.tbl_paises;
       iniciar         heap    crduser    false    8            ?           0    0    TABLE tbl_paises    COMMENT     U   COMMENT ON TABLE iniciar.tbl_paises IS 'Tabla Donde se almacenara todos los paises';
          iniciar          crduser    false    286                       1259    68509    tbl_pais_id_seq    SEQUENCE     y   CREATE SEQUENCE iniciar.tbl_pais_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE iniciar.tbl_pais_id_seq;
       iniciar          crduser    false    8    286            ?           0    0    tbl_pais_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE iniciar.tbl_pais_id_seq OWNED BY iniciar.tbl_paises.id;
          iniciar          crduser    false    287                        1259    68510    tbl_paises_id_seq    SEQUENCE     {   CREATE SEQUENCE iniciar.tbl_paises_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE iniciar.tbl_paises_id_seq;
       iniciar          crduser    false    286    8            ?           0    0    tbl_paises_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE iniciar.tbl_paises_id_seq OWNED BY iniciar.tbl_paises.id;
          iniciar          crduser    false    288            !           1259    68511    tbl_posiciones_id_seq    SEQUENCE        CREATE SEQUENCE iniciar.tbl_posiciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE iniciar.tbl_posiciones_id_seq;
       iniciar          postgres    false    8            ?           0    0    SEQUENCE tbl_posiciones_id_seq    ACL     @   GRANT ALL ON SEQUENCE iniciar.tbl_posiciones_id_seq TO crduser;
          iniciar          postgres    false    289            "           1259    68512    tbl_posiciones    TABLE     ?  CREATE TABLE iniciar.tbl_posiciones (
    id bigint DEFAULT nextval('iniciar.tbl_posiciones_id_seq'::regclass) NOT NULL,
    id_pais bigint NOT NULL,
    id_sede bigint NOT NULL,
    id_area bigint,
    id_rol bigint,
    nombre character varying(100) NOT NULL,
    posiciones_disponible integer DEFAULT 1 NOT NULL,
    depende bigint,
    estado character varying(10) NOT NULL,
    agregado_por character varying(100) NOT NULL,
    agregado_en timestamp without time zone NOT NULL,
    rol_agregado_id bigint,
    rol_agregado_nom character varying(100),
    modificado_por character varying(100),
    modificado_en timestamp without time zone,
    rol_modificado_id bigint,
    rol_modificado_nom character(1)
);
 #   DROP TABLE iniciar.tbl_posiciones;
       iniciar         heap    crduser    false    289    8            ?           0    0    TABLE tbl_posiciones    COMMENT     h   COMMENT ON TABLE iniciar.tbl_posiciones IS 'Esto almacena las posiciones disponibles por area y sede ';
          iniciar          crduser    false    290            ?           0    0    COLUMN tbl_posiciones.id_rol    COMMENT     K   COMMENT ON COLUMN iniciar.tbl_posiciones.id_rol IS 'esto es para los rol';
          iniciar          crduser    false    290            #           1259    68517    tbl_roles_id_seq    SEQUENCE     z   CREATE SEQUENCE iniciar.tbl_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE iniciar.tbl_roles_id_seq;
       iniciar          neoalex    false    8            ?           0    0    SEQUENCE tbl_roles_id_seq    ACL     ;   GRANT ALL ON SEQUENCE iniciar.tbl_roles_id_seq TO crduser;
          iniciar          neoalex    false    291            $           1259    68518 	   tbl_roles    TABLE     a  CREATE TABLE iniciar.tbl_roles (
    id bigint DEFAULT nextval('iniciar.tbl_roles_id_seq'::regclass) NOT NULL,
    id_pais bigint NOT NULL,
    id_modulo bigint NOT NULL,
    descripcion character varying(100) NOT NULL,
    estado character varying(10) NOT NULL,
    agregado_por character varying(100) NOT NULL,
    agregado_en timestamp without time zone NOT NULL,
    rol_agregado_id bigint,
    rol_agregado_nom character varying(100),
    modificado_por character varying(100),
    modificado_en timestamp without time zone,
    rol_modificado_id bigint,
    rol_modificado_nom character varying(100)
);
    DROP TABLE iniciar.tbl_roles;
       iniciar         heap    crduser    false    291    8            ?           0    0    TABLE tbl_roles    COMMENT     A   COMMENT ON TABLE iniciar.tbl_roles IS 'Definicion de los roles';
          iniciar          crduser    false    292            %           1259    68524    tbl_sedes_id_seq    SEQUENCE     z   CREATE SEQUENCE iniciar.tbl_sedes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE iniciar.tbl_sedes_id_seq;
       iniciar          crduser    false    8            &           1259    68525 	   tbl_sedes    TABLE     ?  CREATE TABLE iniciar.tbl_sedes (
    id bigint DEFAULT nextval('iniciar.tbl_sedes_id_seq'::regclass) NOT NULL,
    id_pais bigint NOT NULL,
    id_division bigint NOT NULL,
    id_tipo_sede bigint NOT NULL,
    nombre character varying(100) NOT NULL,
    voluntarios integer DEFAULT 0 NOT NULL,
    depende bigint,
    estado character varying(10),
    agregado_por character varying(100) NOT NULL,
    agregado_en timestamp without time zone NOT NULL,
    rol_agregado_id bigint,
    rol_agregado_nom character varying(100),
    modificado_por character varying(100),
    modificado_en timestamp without time zone,
    rol_modificado_id bigint,
    rol_modificado_nom character varying(100)
);
    DROP TABLE iniciar.tbl_sedes;
       iniciar         heap    crduser    false    293    8            ?           0    0    TABLE tbl_sedes    COMMENT     P   COMMENT ON TABLE iniciar.tbl_sedes IS 'Son las diferentes sedes de los paises';
          iniciar          crduser    false    294            '           1259    68532    tbl_tipo_division_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar.tbl_tipo_division_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE iniciar.tbl_tipo_division_id_seq;
       iniciar          crduser    false    8            (           1259    68533    tbl_tipo_informacion    TABLE     ?  CREATE TABLE iniciar.tbl_tipo_informacion (
    id bigint NOT NULL,
    id_pais bigint NOT NULL,
    id_sede bigint NOT NULL,
    descripcion character(100) NOT NULL,
    estado character(10) NOT NULL,
    agregado_por character(100) NOT NULL,
    agregado_en time without time zone NOT NULL,
    rol_agregado_id bigint,
    rol_agregado_nom character(100),
    modificado_por character(100),
    modificado_en time without time zone,
    rol_modificado_id bigint,
    rol_modificado_nom character(100)
);
 )   DROP TABLE iniciar.tbl_tipo_informacion;
       iniciar         heap    crduser    false    8            ?           0    0    TABLE tbl_tipo_informacion    COMMENT     }   COMMENT ON TABLE iniciar.tbl_tipo_informacion IS 'Esto almacendra los diferentes tipos de informacion para los voluntarios';
          iniciar          crduser    false    296            )           1259    68538    tbl_tipo_informacion_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar.tbl_tipo_informacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE iniciar.tbl_tipo_informacion_id_seq;
       iniciar          crduser    false    8    296            ?           0    0    tbl_tipo_informacion_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE iniciar.tbl_tipo_informacion_id_seq OWNED BY iniciar.tbl_tipo_informacion.id;
          iniciar          crduser    false    297            *           1259    68539    tbl_tipodivision    TABLE     ?  CREATE TABLE iniciar.tbl_tipodivision (
    id bigint NOT NULL,
    id_pais bigint NOT NULL,
    nombre character(50) NOT NULL,
    depende bigint,
    estado character(50) NOT NULL,
    agregado_por character(100) NOT NULL,
    agregado_en timestamp without time zone NOT NULL,
    rol_agregado_id bigint,
    rol_agregado_nom character(100),
    modificado_por character(100),
    modificado_en timestamp without time zone,
    rol_modificado_id bigint,
    rol_modificado_nom character(100)
);
 %   DROP TABLE iniciar.tbl_tipodivision;
       iniciar         heap    crduser    false    8            +           1259    68544    tbl_tipodivision_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar.tbl_tipodivision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE iniciar.tbl_tipodivision_id_seq;
       iniciar          crduser    false    8    298            ?           0    0    tbl_tipodivision_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE iniciar.tbl_tipodivision_id_seq OWNED BY iniciar.tbl_tipodivision.id;
          iniciar          crduser    false    299            ,           1259    68545    tbl_tipos_de_miembros    TABLE     ?   CREATE TABLE iniciar.tbl_tipos_de_miembros (
    id bigint NOT NULL,
    id_pais bigint NOT NULL,
    descripcion character(100) NOT NULL,
    estado character(10) NOT NULL,
    calcular_tiempo boolean
);
 *   DROP TABLE iniciar.tbl_tipos_de_miembros;
       iniciar         heap    crduser    false    8            ?           0    0    TABLE tbl_tipos_de_miembros    COMMENT     \   COMMENT ON TABLE iniciar.tbl_tipos_de_miembros IS 'Esto almacena todos Tipos de miembros ';
          iniciar          crduser    false    300            -           1259    68548    tbl_tipos_de_miembros_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar.tbl_tipos_de_miembros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE iniciar.tbl_tipos_de_miembros_id_seq;
       iniciar          crduser    false    8    300            ?           0    0    tbl_tipos_de_miembros_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE iniciar.tbl_tipos_de_miembros_id_seq OWNED BY iniciar.tbl_tipos_de_miembros.id;
          iniciar          crduser    false    301            .           1259    68549    tbl_tipos_documentos_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar.tbl_tipos_documentos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE iniciar.tbl_tipos_documentos_id_seq;
       iniciar          postgres    false    8            ?           0    0 $   SEQUENCE tbl_tipos_documentos_id_seq    ACL     F   GRANT ALL ON SEQUENCE iniciar.tbl_tipos_documentos_id_seq TO crduser;
          iniciar          postgres    false    302            /           1259    68550    tbl_tipos_documentos    TABLE     X  CREATE TABLE iniciar.tbl_tipos_documentos (
    id bigint DEFAULT nextval('iniciar.tbl_tipos_documentos_id_seq'::regclass) NOT NULL,
    id_pais bigint NOT NULL,
    descripcion character varying(100) NOT NULL,
    estado character varying(10) NOT NULL,
    agregado_por character varying(100) NOT NULL,
    agregado_en timestamp without time zone NOT NULL,
    rol_agregado_id bigint,
    rol_agregado_nom character varying(100),
    modificado_por character varying(100),
    modificado_en timestamp without time zone,
    rol_modificado_id bigint,
    rol_modificado_nom character varying(100)
);
 )   DROP TABLE iniciar.tbl_tipos_documentos;
       iniciar         heap    crduser    false    302    8            ?           0    0    TABLE tbl_tipos_documentos    COMMENT     S   COMMENT ON TABLE iniciar.tbl_tipos_documentos IS 'tipos de Documentos por paises';
          iniciar          crduser    false    303            0           1259    68556    tbl_tipos_sedes_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar.tbl_tipos_sedes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE iniciar.tbl_tipos_sedes_id_seq;
       iniciar          crduser    false    8            1           1259    68557    tbl_tipos_sedes    TABLE     o  CREATE TABLE iniciar.tbl_tipos_sedes (
    id bigint DEFAULT nextval('iniciar.tbl_tipos_sedes_id_seq'::regclass) NOT NULL,
    id_tipo_division bigint NOT NULL,
    id_pais bigint NOT NULL,
    nombre character varying(100) NOT NULL,
    estado character varying(10) NOT NULL,
    agregado_por character varying(100) NOT NULL,
    agregado_en timestamp without time zone NOT NULL,
    rol_agregado_id bigint,
    rol_agregado_nom character varying(100),
    modificado_por character varying(100),
    modificado_en timestamp without time zone,
    rol_modificado_id bigint,
    rol_modificado_nom character varying(100)
);
 $   DROP TABLE iniciar.tbl_tipos_sedes;
       iniciar         heap    crduser    false    304    8            ?           0    0    TABLE tbl_tipos_sedes    COMMENT     k   COMMENT ON TABLE iniciar.tbl_tipos_sedes IS 'Alamacena los tipos de sedes dependendiendo de la division ';
          iniciar          crduser    false    305            2           1259    68563 $   tbl_transacciones_de_miembros_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar.tbl_transacciones_de_miembros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE iniciar.tbl_transacciones_de_miembros_id_seq;
       iniciar          crduser    false    8            3           1259    68564    tbl_transacciones_de_miembros    TABLE     y  CREATE TABLE iniciar.tbl_transacciones_de_miembros (
    id bigint DEFAULT nextval('iniciar.tbl_transacciones_de_miembros_id_seq'::regclass) NOT NULL,
    id_miembro bigint NOT NULL,
    descripcion character(1000) NOT NULL,
    valor_anterior character(1000),
    valor_actual character(1000),
    estado character(10),
    agregado_por character(100) NOT NULL,
    agregado_en timestamp without time zone NOT NULL,
    rol_agregado_id bigint,
    rol_agregado_nom character(100),
    modificado_por character(100),
    modificado_en timestamp without time zone,
    rol_modificado_id bigint,
    rol_modificado_nom character(1)
);
 2   DROP TABLE iniciar.tbl_transacciones_de_miembros;
       iniciar         heap    crduser    false    306    8            ?           0    0 #   TABLE tbl_transacciones_de_miembros    COMMENT     v   COMMENT ON TABLE iniciar.tbl_transacciones_de_miembros IS 'Esto Almacenara todas las transacciones de los miembros ';
          iniciar          crduser    false    307            4           1259    68570    tbl_users_id_seq    SEQUENCE     z   CREATE SEQUENCE iniciar.tbl_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE iniciar.tbl_users_id_seq;
       iniciar          neoalex    false    8            ?           0    0    SEQUENCE tbl_users_id_seq    ACL     ;   GRANT ALL ON SEQUENCE iniciar.tbl_users_id_seq TO crduser;
          iniciar          neoalex    false    308            5           1259    68571 	   tbl_users    TABLE     ?  CREATE TABLE iniciar.tbl_users (
    id bigint DEFAULT nextval('iniciar.tbl_users_id_seq'::regclass) NOT NULL,
    id_pais bigint NOT NULL,
    id_miembro bigint NOT NULL,
    usuario character varying(100) NOT NULL,
    password character varying(10000) NOT NULL,
    estado character varying(50) NOT NULL,
    agregado_en timestamp without time zone NOT NULL,
    modificado_en timestamp without time zone
);
    DROP TABLE iniciar.tbl_users;
       iniciar         heap    crduser    false    308    8            J           2604    68577     tbl_informacion_adicional id    DEFAULT     ?   ALTER TABLE ONLY iniciar." tbl_informacion_adicional" ALTER COLUMN id SET DEFAULT nextval('iniciar." tbl_informacion_adicional_id_seq"'::regclass);
 O   ALTER TABLE iniciar." tbl_informacion_adicional" ALTER COLUMN id DROP DEFAULT;
       iniciar          crduser    false    263    262            K           2604    68578    tbl_area_de_accion id    DEFAULT     ?   ALTER TABLE ONLY iniciar.tbl_area_de_accion ALTER COLUMN id SET DEFAULT nextval('iniciar.tbl_area_de_accion_id_seq'::regclass);
 E   ALTER TABLE iniciar.tbl_area_de_accion ALTER COLUMN id DROP DEFAULT;
       iniciar          crduser    false    265    264            M           2604    68579    tbl_cursos id    DEFAULT     p   ALTER TABLE ONLY iniciar.tbl_cursos ALTER COLUMN id SET DEFAULT nextval('iniciar.tbl_cursos_id_seq'::regclass);
 =   ALTER TABLE iniciar.tbl_cursos ALTER COLUMN id DROP DEFAULT;
       iniciar          postgres    false    269    268            O           2604    68580    tbl_detalle_de_cursos id    DEFAULT     ?   ALTER TABLE ONLY iniciar.tbl_detalle_de_cursos ALTER COLUMN id SET DEFAULT nextval('iniciar.tbl_detalle_de_cursos_id_seq'::regclass);
 H   ALTER TABLE iniciar.tbl_detalle_de_cursos ALTER COLUMN id DROP DEFAULT;
       iniciar          postgres    false    273    272            d           2604    68779    tbl_detalle_mis_cursos id    DEFAULT     ?   ALTER TABLE ONLY iniciar.tbl_detalle_mis_cursos ALTER COLUMN id SET DEFAULT nextval('iniciar.tbl_detalle_mis_cursos_id_seq'::regclass);
 I   ALTER TABLE iniciar.tbl_detalle_mis_cursos ALTER COLUMN id DROP DEFAULT;
       iniciar          postgres    false    312    313    313            Q           2604    68581    tbl_imagenes_miembros id    DEFAULT     ?   ALTER TABLE ONLY iniciar.tbl_imagenes_miembros ALTER COLUMN id SET DEFAULT nextval('iniciar.tbl_imagenes_miembros_id_seq'::regclass);
 H   ALTER TABLE iniciar.tbl_imagenes_miembros ALTER COLUMN id DROP DEFAULT;
       iniciar          postgres    false    277    276            S           2604    68582    tbl_miembros_posiciones id    DEFAULT     ?   ALTER TABLE ONLY iniciar.tbl_miembros_posiciones ALTER COLUMN id SET DEFAULT nextval('iniciar.tbl_miembros_posiciones_id_seq'::regclass);
 J   ALTER TABLE iniciar.tbl_miembros_posiciones ALTER COLUMN id DROP DEFAULT;
       iniciar          postgres    false    281    280            c           2604    68770    tbl_mis_cursos id    DEFAULT     x   ALTER TABLE ONLY iniciar.tbl_mis_cursos ALTER COLUMN id SET DEFAULT nextval('iniciar.tbl_mis_cursos_id_seq'::regclass);
 A   ALTER TABLE iniciar.tbl_mis_cursos ALTER COLUMN id DROP DEFAULT;
       iniciar          postgres    false    311    310    311            V           2604    68583    tbl_paises id    DEFAULT     p   ALTER TABLE ONLY iniciar.tbl_paises ALTER COLUMN id SET DEFAULT nextval('iniciar.tbl_paises_id_seq'::regclass);
 =   ALTER TABLE iniciar.tbl_paises ALTER COLUMN id DROP DEFAULT;
       iniciar          crduser    false    288    286            \           2604    68584    tbl_tipo_informacion id    DEFAULT     ?   ALTER TABLE ONLY iniciar.tbl_tipo_informacion ALTER COLUMN id SET DEFAULT nextval('iniciar.tbl_tipo_informacion_id_seq'::regclass);
 G   ALTER TABLE iniciar.tbl_tipo_informacion ALTER COLUMN id DROP DEFAULT;
       iniciar          crduser    false    297    296            ]           2604    68585    tbl_tipodivision id    DEFAULT     |   ALTER TABLE ONLY iniciar.tbl_tipodivision ALTER COLUMN id SET DEFAULT nextval('iniciar.tbl_tipodivision_id_seq'::regclass);
 C   ALTER TABLE iniciar.tbl_tipodivision ALTER COLUMN id DROP DEFAULT;
       iniciar          crduser    false    299    298            ^           2604    68586    tbl_tipos_de_miembros id    DEFAULT     ?   ALTER TABLE ONLY iniciar.tbl_tipos_de_miembros ALTER COLUMN id SET DEFAULT nextval('iniciar.tbl_tipos_de_miembros_id_seq'::regclass);
 H   ALTER TABLE iniciar.tbl_tipos_de_miembros ALTER COLUMN id DROP DEFAULT;
       iniciar          crduser    false    301    300            <          0    68430     tbl_informacion_adicional 
   TABLE DATA           ?   COPY iniciar." tbl_informacion_adicional" (id, id_pais, id_miembro, id_tipo_informacion, valor, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    262   ?0      >          0    68436    tbl_area_de_accion 
   TABLE DATA           ?   COPY iniciar.tbl_area_de_accion (id, id_pais, id_area, id_sede, descripcion, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    264   ?0      A          0    68443 	   tbl_areas 
   TABLE DATA           ?   COPY iniciar.tbl_areas (id, id_pais, id_sede, nombre, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    267   1      B          0    68449 
   tbl_cursos 
   TABLE DATA           ?   COPY iniciar.tbl_cursos (id, id_pais, descripcion, duracion, tipo, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom, portada, nombre, idcolection, uuid) FROM stdin;
    iniciar          postgres    false    268   ?1      E          0    68456    tbl_det_roles 
   TABLE DATA           ?   COPY iniciar.tbl_det_roles (id, id_pais, id_roles, id_opcion, estado, agregado_por, agregado_en, modificado_por, modificado_en, leer, escribir, imprimir, eliminar, rol_agregado_id, rol_agregado_nom, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    271   ?2      F          0    68462    tbl_detalle_de_cursos 
   TABLE DATA             COPY iniciar.tbl_detalle_de_cursos (id, id_curso, titulo, descripcion, tipo, url, id_formulario, portada, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom, uuid, estado, guid, duracion) FROM stdin;
    iniciar          postgres    false    272   @3      o          0    68776    tbl_detalle_mis_cursos 
   TABLE DATA           ?   COPY iniciar.tbl_detalle_mis_cursos (id, id_mis_cursos, id_detalle, id_miembro, tiempo, estado, id_curso, titulo, descripcion, url, tipo, duracion) FROM stdin;
    iniciar          postgres    false    313   P4      I          0    68469    tbl_division 
   TABLE DATA           ?   COPY iniciar.tbl_division (id, id_pais, id_tipo_division, nombre, depende, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    275   ?4      J          0    68475    tbl_imagenes_miembros 
   TABLE DATA           ?   COPY iniciar.tbl_imagenes_miembros (id, id_miembro, id_pais, url, descripcion, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom, estado) FROM stdin;
    iniciar          postgres    false    276   V5      M          0    68482    tbl_miembros 
   TABLE DATA           ?  COPY iniciar.tbl_miembros (id, id_pais, id_sede, id_area, nombre, apellido, nacionalidad, lugar_de_nacimiento, fecha_de_nacimiento, id_tipo_documento, documento, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom, tiempo_voluntariado, email, fecha_de_registro, fecha_de_finalizacion, tipo_miembro, uuid) FROM stdin;
    iniciar          crduser    false    279   s5      N          0    68488    tbl_miembros_posiciones 
   TABLE DATA           ?   COPY iniciar.tbl_miembros_posiciones (id, id_pais, id_miembro, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom, id_posicion) FROM stdin;
    iniciar          postgres    false    280   .6      m          0    68767    tbl_mis_cursos 
   TABLE DATA             COPY iniciar.tbl_mis_cursos (id, id_miembro, id_curso, fecha_de_inicio, fecha_de_finalizacion, completado, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          postgres    false    311   K6      Q          0    68493    tbl_modulos 
   TABLE DATA           H   COPY iniciar.tbl_modulos (id, id_pais, descripcion, estado) FROM stdin;
    iniciar          crduser    false    283   ?6      S          0    68498    tbl_opciones 
   TABLE DATA           ?   COPY iniciar.tbl_opciones (id, id_pais, descripcion, estado, agregado_por, agregado_en, modificado_por, modificado_en, rol_agregado_id, rol_agregado_nom, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    285   ?6      T          0    68504 
   tbl_paises 
   TABLE DATA           ?   COPY iniciar.tbl_paises (id, codigo, bandera, nombre, alpha2, alpha3, domains, habitantes, superficie, estado, ruta_bandera) FROM stdin;
    iniciar          crduser    false    286   p7      X          0    68512    tbl_posiciones 
   TABLE DATA             COPY iniciar.tbl_posiciones (id, id_pais, id_sede, id_area, id_rol, nombre, posiciones_disponible, depende, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    290   ?7      Z          0    68518 	   tbl_roles 
   TABLE DATA           ?   COPY iniciar.tbl_roles (id, id_pais, id_modulo, descripcion, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    292   j8      \          0    68525 	   tbl_sedes 
   TABLE DATA           ?   COPY iniciar.tbl_sedes (id, id_pais, id_division, id_tipo_sede, nombre, voluntarios, depende, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    294   9      ^          0    68533    tbl_tipo_informacion 
   TABLE DATA           ?   COPY iniciar.tbl_tipo_informacion (id, id_pais, id_sede, descripcion, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    296   v9      `          0    68539    tbl_tipodivision 
   TABLE DATA           ?   COPY iniciar.tbl_tipodivision (id, id_pais, nombre, depende, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    298   ?9      b          0    68545    tbl_tipos_de_miembros 
   TABLE DATA           c   COPY iniciar.tbl_tipos_de_miembros (id, id_pais, descripcion, estado, calcular_tiempo) FROM stdin;
    iniciar          crduser    false    300   G:      e          0    68550    tbl_tipos_documentos 
   TABLE DATA           ?   COPY iniciar.tbl_tipos_documentos (id, id_pais, descripcion, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    303   ?:      g          0    68557    tbl_tipos_sedes 
   TABLE DATA           ?   COPY iniciar.tbl_tipos_sedes (id, id_tipo_division, id_pais, nombre, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    305   ;      i          0    68564    tbl_transacciones_de_miembros 
   TABLE DATA           ?   COPY iniciar.tbl_transacciones_de_miembros (id, id_miembro, descripcion, valor_anterior, valor_actual, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    307   ?;      k          0    68571 	   tbl_users 
   TABLE DATA           t   COPY iniciar.tbl_users (id, id_pais, id_miembro, usuario, password, estado, agregado_en, modificado_en) FROM stdin;
    iniciar          crduser    false    309   ?;      ?           0    0 !    tbl_informacion_adicional_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('iniciar." tbl_informacion_adicional_id_seq"', 1, false);
          iniciar          crduser    false    263            ?           0    0    tbl_area_de_accion_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('iniciar.tbl_area_de_accion_id_seq', 1, false);
          iniciar          crduser    false    265            ?           0    0    tbl_areas_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('iniciar.tbl_areas_id_seq', 1, true);
          iniciar          crduser    false    266            ?           0    0    tbl_cursos_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('iniciar.tbl_cursos_id_seq', 12, true);
          iniciar          postgres    false    269            ?           0    0    tbl_det_roles_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('iniciar.tbl_det_roles_id_seq', 2, true);
          iniciar          neoalex    false    270            ?           0    0    tbl_detalle_de_cursos_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('iniciar.tbl_detalle_de_cursos_id_seq', 2, true);
          iniciar          postgres    false    273            ?           0    0    tbl_detalle_mis_cursos_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('iniciar.tbl_detalle_mis_cursos_id_seq', 3, true);
          iniciar          postgres    false    312            ?           0    0    tbl_division_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('iniciar.tbl_division_id_seq', 1, true);
          iniciar          crduser    false    274            ?           0    0    tbl_imagenes_miembros_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('iniciar.tbl_imagenes_miembros_id_seq', 1, false);
          iniciar          postgres    false    277            ?           0    0    tbl_miembros_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('iniciar.tbl_miembros_id_seq', 29, true);
          iniciar          postgres    false    278            ?           0    0    tbl_miembros_posiciones_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('iniciar.tbl_miembros_posiciones_id_seq', 1, false);
          iniciar          postgres    false    281            ?           0    0    tbl_mis_cursos_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('iniciar.tbl_mis_cursos_id_seq', 7, true);
          iniciar          postgres    false    310            ?           0    0    tbl_modulos_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('iniciar.tbl_modulos_id_seq', 1, false);
          iniciar          neoalex    false    282            ?           0    0    tbl_opciones_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('iniciar.tbl_opciones_id_seq', 1, true);
          iniciar          neoalex    false    284            ?           0    0    tbl_pais_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('iniciar.tbl_pais_id_seq', 1, false);
          iniciar          crduser    false    287            ?           0    0    tbl_paises_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('iniciar.tbl_paises_id_seq', 1, true);
          iniciar          crduser    false    288            ?           0    0    tbl_posiciones_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('iniciar.tbl_posiciones_id_seq', 1, true);
          iniciar          postgres    false    289            ?           0    0    tbl_roles_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('iniciar.tbl_roles_id_seq', 5, true);
          iniciar          neoalex    false    291            ?           0    0    tbl_sedes_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('iniciar.tbl_sedes_id_seq', 1, true);
          iniciar          crduser    false    293            ?           0    0    tbl_tipo_division_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('iniciar.tbl_tipo_division_id_seq', 1, false);
          iniciar          crduser    false    295            ?           0    0    tbl_tipo_informacion_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('iniciar.tbl_tipo_informacion_id_seq', 1, false);
          iniciar          crduser    false    297            ?           0    0    tbl_tipodivision_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('iniciar.tbl_tipodivision_id_seq', 7, true);
          iniciar          crduser    false    299            ?           0    0    tbl_tipos_de_miembros_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('iniciar.tbl_tipos_de_miembros_id_seq', 4, true);
          iniciar          crduser    false    301            ?           0    0    tbl_tipos_documentos_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('iniciar.tbl_tipos_documentos_id_seq', 2, true);
          iniciar          postgres    false    302            ?           0    0    tbl_tipos_sedes_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('iniciar.tbl_tipos_sedes_id_seq', 3, true);
          iniciar          crduser    false    304            ?           0    0 $   tbl_transacciones_de_miembros_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('iniciar.tbl_transacciones_de_miembros_id_seq', 1, true);
          iniciar          crduser    false    306            ?           0    0    tbl_users_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('iniciar.tbl_users_id_seq', 38, true);
          iniciar          neoalex    false    308            f           2606    68588 :    tbl_informacion_adicional  tbl_informacion_adicional_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY iniciar." tbl_informacion_adicional"
    ADD CONSTRAINT " tbl_informacion_adicional_pkey" PRIMARY KEY (id);
 i   ALTER TABLE ONLY iniciar." tbl_informacion_adicional" DROP CONSTRAINT " tbl_informacion_adicional_pkey";
       iniciar            crduser    false    262            ?           2606    68590 /   tbl_tipodivision PK_27eed919f4ed4d1fa2bd15e4405 
   CONSTRAINT     p   ALTER TABLE ONLY iniciar.tbl_tipodivision
    ADD CONSTRAINT "PK_27eed919f4ed4d1fa2bd15e4405" PRIMARY KEY (id);
 \   ALTER TABLE ONLY iniciar.tbl_tipodivision DROP CONSTRAINT "PK_27eed919f4ed4d1fa2bd15e4405";
       iniciar            crduser    false    298            l           2606    68735    tbl_cursos Uq_Cursosnombre 
   CONSTRAINT     Z   ALTER TABLE ONLY iniciar.tbl_cursos
    ADD CONSTRAINT "Uq_Cursosnombre" UNIQUE (nombre);
 G   ALTER TABLE ONLY iniciar.tbl_cursos DROP CONSTRAINT "Uq_Cursosnombre";
       iniciar            postgres    false    268            x           2606    68592    tbl_miembros pk_miembrocorreo 
   CONSTRAINT     Z   ALTER TABLE ONLY iniciar.tbl_miembros
    ADD CONSTRAINT pk_miembrocorreo UNIQUE (email);
 H   ALTER TABLE ONLY iniciar.tbl_miembros DROP CONSTRAINT pk_miembrocorreo;
       iniciar            crduser    false    279            z           2606    68594 $   tbl_miembros pk_miembrodocumentotipo 
   CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_miembros
    ADD CONSTRAINT pk_miembrodocumentotipo UNIQUE (documento) INCLUDE (id_tipo_documento);
 O   ALTER TABLE ONLY iniciar.tbl_miembros DROP CONSTRAINT pk_miembrodocumentotipo;
       iniciar            crduser    false    279    279            h           2606    68596 *   tbl_area_de_accion tbl_area_de_accion_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY iniciar.tbl_area_de_accion
    ADD CONSTRAINT tbl_area_de_accion_pkey PRIMARY KEY (id);
 U   ALTER TABLE ONLY iniciar.tbl_area_de_accion DROP CONSTRAINT tbl_area_de_accion_pkey;
       iniciar            crduser    false    264            j           2606    68598    tbl_areas tbl_areas_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY iniciar.tbl_areas
    ADD CONSTRAINT tbl_areas_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY iniciar.tbl_areas DROP CONSTRAINT tbl_areas_pkey;
       iniciar            crduser    false    267            n           2606    68600    tbl_cursos tbl_cursos_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY iniciar.tbl_cursos
    ADD CONSTRAINT tbl_cursos_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY iniciar.tbl_cursos DROP CONSTRAINT tbl_cursos_pkey;
       iniciar            postgres    false    268            p           2606    68602     tbl_det_roles tbl_det_roles_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY iniciar.tbl_det_roles
    ADD CONSTRAINT tbl_det_roles_pkey PRIMARY KEY (id);
 K   ALTER TABLE ONLY iniciar.tbl_det_roles DROP CONSTRAINT tbl_det_roles_pkey;
       iniciar            crduser    false    271            r           2606    68604 0   tbl_detalle_de_cursos tbl_detalle_de_cursos_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY iniciar.tbl_detalle_de_cursos
    ADD CONSTRAINT tbl_detalle_de_cursos_pkey PRIMARY KEY (id);
 [   ALTER TABLE ONLY iniciar.tbl_detalle_de_cursos DROP CONSTRAINT tbl_detalle_de_cursos_pkey;
       iniciar            postgres    false    272            ?           2606    68781 2   tbl_detalle_mis_cursos tbl_detalle_mis_cursos_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY iniciar.tbl_detalle_mis_cursos
    ADD CONSTRAINT tbl_detalle_mis_cursos_pkey PRIMARY KEY (id);
 ]   ALTER TABLE ONLY iniciar.tbl_detalle_mis_cursos DROP CONSTRAINT tbl_detalle_mis_cursos_pkey;
       iniciar            postgres    false    313            t           2606    68606    tbl_division tbl_division_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY iniciar.tbl_division
    ADD CONSTRAINT tbl_division_pkey PRIMARY KEY (id);
 I   ALTER TABLE ONLY iniciar.tbl_division DROP CONSTRAINT tbl_division_pkey;
       iniciar            crduser    false    275            v           2606    68608 0   tbl_imagenes_miembros tbl_imagenes_miembros_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY iniciar.tbl_imagenes_miembros
    ADD CONSTRAINT tbl_imagenes_miembros_pkey PRIMARY KEY (id);
 [   ALTER TABLE ONLY iniciar.tbl_imagenes_miembros DROP CONSTRAINT tbl_imagenes_miembros_pkey;
       iniciar            postgres    false    276            |           2606    68610    tbl_miembros tbl_miembros_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY iniciar.tbl_miembros
    ADD CONSTRAINT tbl_miembros_pkey PRIMARY KEY (id);
 I   ALTER TABLE ONLY iniciar.tbl_miembros DROP CONSTRAINT tbl_miembros_pkey;
       iniciar            crduser    false    279            ~           2606    68612 4   tbl_miembros_posiciones tbl_miembros_posiciones_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY iniciar.tbl_miembros_posiciones
    ADD CONSTRAINT tbl_miembros_posiciones_pkey PRIMARY KEY (id);
 _   ALTER TABLE ONLY iniciar.tbl_miembros_posiciones DROP CONSTRAINT tbl_miembros_posiciones_pkey;
       iniciar            postgres    false    280            ?           2606    68772 "   tbl_mis_cursos tbl_mis_cursos_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY iniciar.tbl_mis_cursos
    ADD CONSTRAINT tbl_mis_cursos_pkey PRIMARY KEY (id);
 M   ALTER TABLE ONLY iniciar.tbl_mis_cursos DROP CONSTRAINT tbl_mis_cursos_pkey;
       iniciar            postgres    false    311            ?           2606    68614    tbl_modulos tbl_modulos_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY iniciar.tbl_modulos
    ADD CONSTRAINT tbl_modulos_pkey PRIMARY KEY (id);
 G   ALTER TABLE ONLY iniciar.tbl_modulos DROP CONSTRAINT tbl_modulos_pkey;
       iniciar            crduser    false    283            ?           2606    68616    tbl_opciones tbl_opciones_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY iniciar.tbl_opciones
    ADD CONSTRAINT tbl_opciones_pkey PRIMARY KEY (id);
 I   ALTER TABLE ONLY iniciar.tbl_opciones DROP CONSTRAINT tbl_opciones_pkey;
       iniciar            crduser    false    285            ?           2606    68618    tbl_paises tbl_pais_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY iniciar.tbl_paises
    ADD CONSTRAINT tbl_pais_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY iniciar.tbl_paises DROP CONSTRAINT tbl_pais_pkey;
       iniciar            crduser    false    286            ?           2606    68620 "   tbl_posiciones tbl_posiciones_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY iniciar.tbl_posiciones
    ADD CONSTRAINT tbl_posiciones_pkey PRIMARY KEY (id);
 M   ALTER TABLE ONLY iniciar.tbl_posiciones DROP CONSTRAINT tbl_posiciones_pkey;
       iniciar            crduser    false    290            ?           2606    68622    tbl_roles tbl_roles_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY iniciar.tbl_roles
    ADD CONSTRAINT tbl_roles_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY iniciar.tbl_roles DROP CONSTRAINT tbl_roles_pkey;
       iniciar            crduser    false    292            ?           2606    68624    tbl_sedes tbl_sedes_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY iniciar.tbl_sedes
    ADD CONSTRAINT tbl_sedes_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY iniciar.tbl_sedes DROP CONSTRAINT tbl_sedes_pkey;
       iniciar            crduser    false    294            ?           2606    68626 .   tbl_tipo_informacion tbl_tipo_informacion_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY iniciar.tbl_tipo_informacion
    ADD CONSTRAINT tbl_tipo_informacion_pkey PRIMARY KEY (id);
 Y   ALTER TABLE ONLY iniciar.tbl_tipo_informacion DROP CONSTRAINT tbl_tipo_informacion_pkey;
       iniciar            crduser    false    296            ?           2606    68628 0   tbl_tipos_de_miembros tbl_tipos_de_miembros_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY iniciar.tbl_tipos_de_miembros
    ADD CONSTRAINT tbl_tipos_de_miembros_pkey PRIMARY KEY (id);
 [   ALTER TABLE ONLY iniciar.tbl_tipos_de_miembros DROP CONSTRAINT tbl_tipos_de_miembros_pkey;
       iniciar            crduser    false    300            ?           2606    68630 .   tbl_tipos_documentos tbl_tipos_documentos_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY iniciar.tbl_tipos_documentos
    ADD CONSTRAINT tbl_tipos_documentos_pkey PRIMARY KEY (id);
 Y   ALTER TABLE ONLY iniciar.tbl_tipos_documentos DROP CONSTRAINT tbl_tipos_documentos_pkey;
       iniciar            crduser    false    303            ?           2606    68632 $   tbl_tipos_sedes tbl_tipos_sedes_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY iniciar.tbl_tipos_sedes
    ADD CONSTRAINT tbl_tipos_sedes_pkey PRIMARY KEY (id);
 O   ALTER TABLE ONLY iniciar.tbl_tipos_sedes DROP CONSTRAINT tbl_tipos_sedes_pkey;
       iniciar            crduser    false    305            ?           2606    68634 @   tbl_transacciones_de_miembros tbl_transacciones_de_miembros_pkey 
   CONSTRAINT        ALTER TABLE ONLY iniciar.tbl_transacciones_de_miembros
    ADD CONSTRAINT tbl_transacciones_de_miembros_pkey PRIMARY KEY (id);
 k   ALTER TABLE ONLY iniciar.tbl_transacciones_de_miembros DROP CONSTRAINT tbl_transacciones_de_miembros_pkey;
       iniciar            crduser    false    307            ?           2606    68636    tbl_users tbl_users_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY iniciar.tbl_users
    ADD CONSTRAINT tbl_users_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY iniciar.tbl_users DROP CONSTRAINT tbl_users_pkey;
       iniciar            crduser    false    309            ?           2606    68638    tbl_users tbl_users_usuario_key 
   CONSTRAINT     ^   ALTER TABLE ONLY iniciar.tbl_users
    ADD CONSTRAINT tbl_users_usuario_key UNIQUE (usuario);
 J   ALTER TABLE ONLY iniciar.tbl_users DROP CONSTRAINT tbl_users_usuario_key;
       iniciar            crduser    false    309            ?           2620    68639    tbl_miembros tr_miembro    TRIGGER     ?   CREATE TRIGGER tr_miembro BEFORE UPDATE ON iniciar.tbl_miembros FOR EACH ROW EXECUTE FUNCTION iniciar.spt_movimiento_miembros();
 1   DROP TRIGGER tr_miembro ON iniciar.tbl_miembros;
       iniciar          crduser    false    279    316            ?           2620    68794     tbl_mis_cursos trigger_miscursos    TRIGGER     ?   CREATE TRIGGER trigger_miscursos AFTER INSERT ON iniciar.tbl_mis_cursos FOR EACH ROW EXECUTE FUNCTION iniciar.insertadetallemiscursos();
 :   DROP TRIGGER trigger_miscursos ON iniciar.tbl_mis_cursos;
       iniciar          postgres    false    315    311            ?           2606    68640 !   tbl_area_de_accion FK_accion_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_area_de_accion
    ADD CONSTRAINT "FK_accion_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 N   ALTER TABLE ONLY iniciar.tbl_area_de_accion DROP CONSTRAINT "FK_accion_pais";
       iniciar          crduser    false    286    264    3460            ?           2606    68645 '    tbl_informacion_adicional FK_adic_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar." tbl_informacion_adicional"
    ADD CONSTRAINT "FK_adic_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 V   ALTER TABLE ONLY iniciar." tbl_informacion_adicional" DROP CONSTRAINT "FK_adic_pais";
       iniciar          crduser    false    3460    262    286            ?           2606    68650    tbl_areas FK_area_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_areas
    ADD CONSTRAINT "FK_area_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 C   ALTER TABLE ONLY iniciar.tbl_areas DROP CONSTRAINT "FK_area_pais";
       iniciar          crduser    false    286    3460    267            ?           2606    68655    tbl_tipodivision FK_div_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_tipodivision
    ADD CONSTRAINT "FK_div_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 I   ALTER TABLE ONLY iniciar.tbl_tipodivision DROP CONSTRAINT "FK_div_pais";
       iniciar          crduser    false    286    3460    298            ?           2606    68660    tbl_miembros FK_miembro_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_miembros
    ADD CONSTRAINT "FK_miembro_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 I   ALTER TABLE ONLY iniciar.tbl_miembros DROP CONSTRAINT "FK_miembro_pais";
       iniciar          crduser    false    279    3460    286            ?           2606    68665    tbl_posiciones FK_posicion_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_posiciones
    ADD CONSTRAINT "FK_posicion_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 L   ALTER TABLE ONLY iniciar.tbl_posiciones DROP CONSTRAINT "FK_posicion_pais";
       iniciar          crduser    false    3460    286    290            ?           2606    68670    tbl_sedes FK_sede_paises    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_sedes
    ADD CONSTRAINT "FK_sede_paises" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 E   ALTER TABLE ONLY iniciar.tbl_sedes DROP CONSTRAINT "FK_sede_paises";
       iniciar          crduser    false    294    3460    286            ?           2606    68675 )   tbl_tipo_informacion FK_tinformacion_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_tipo_informacion
    ADD CONSTRAINT "FK_tinformacion_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 V   ALTER TABLE ONLY iniciar.tbl_tipo_informacion DROP CONSTRAINT "FK_tinformacion_pais";
       iniciar          crduser    false    296    286    3460            ?           2606    68680 !   tbl_tipos_sedes FK_tipo_sede_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_tipos_sedes
    ADD CONSTRAINT "FK_tipo_sede_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 N   ALTER TABLE ONLY iniciar.tbl_tipos_sedes DROP CONSTRAINT "FK_tipo_sede_pais";
       iniciar          crduser    false    305    286    3460            ?           2606    68685 +   tbl_tipos_de_miembros FK_tiposmiembros_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_tipos_de_miembros
    ADD CONSTRAINT "FK_tiposmiembros_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 X   ALTER TABLE ONLY iniciar.tbl_tipos_de_miembros DROP CONSTRAINT "FK_tiposmiembros_pais";
       iniciar          crduser    false    300    286    3460            ?           2606    68690    tbl_detalle_de_cursos Fk_Cursos    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_detalle_de_cursos
    ADD CONSTRAINT "Fk_Cursos" FOREIGN KEY (id_curso) REFERENCES iniciar.tbl_cursos(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 L   ALTER TABLE ONLY iniciar.tbl_detalle_de_cursos DROP CONSTRAINT "Fk_Cursos";
       iniciar          postgres    false    272    268    3438            ?           2606    68695 '    tbl_informacion_adicional Fk_adic_tipo    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar." tbl_informacion_adicional"
    ADD CONSTRAINT "Fk_adic_tipo" FOREIGN KEY (id_tipo_informacion) REFERENCES iniciar.tbl_tipo_informacion(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 V   ALTER TABLE ONLY iniciar." tbl_informacion_adicional" DROP CONSTRAINT "Fk_adic_tipo";
       iniciar          crduser    false    262    296    3468            ?           2606    68700    tbl_division Fk_division_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_division
    ADD CONSTRAINT "Fk_division_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 J   ALTER TABLE ONLY iniciar.tbl_division DROP CONSTRAINT "Fk_division_pais";
       iniciar          crduser    false    286    275    3460            ?           2606    68705 )   tbl_transacciones_de_miembros Fk_miembros    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_transacciones_de_miembros
    ADD CONSTRAINT "Fk_miembros" FOREIGN KEY (id_miembro) REFERENCES iniciar.tbl_miembros(id);
 V   ALTER TABLE ONLY iniciar.tbl_transacciones_de_miembros DROP CONSTRAINT "Fk_miembros";
       iniciar          crduser    false    3452    307    279            ?           2606    68710 +   tbl_tipos_documentos Fk_tipo_documento_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_tipos_documentos
    ADD CONSTRAINT "Fk_tipo_documento_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 X   ALTER TABLE ONLY iniciar.tbl_tipos_documentos DROP CONSTRAINT "Fk_tipo_documento_pais";
       iniciar          crduser    false    286    303    3460            ?           2606    68715 /   tbl_division tbl_division_id_tipo_division_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_division
    ADD CONSTRAINT tbl_division_id_tipo_division_fkey FOREIGN KEY (id_tipo_division) REFERENCES iniciar.tbl_tipodivision(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 Z   ALTER TABLE ONLY iniciar.tbl_division DROP CONSTRAINT tbl_division_id_tipo_division_fkey;
       iniciar          crduser    false    275    298    3470            <      x?????? ? ?      >      x?????? ? ?      A   c   x?3?4B?ҲԼ?ҔN???̲|μԴ?ĜL????Ģ?|????????\N###]c]#KCc+c+??yɉE??)?
)??1~p????? "?      B     x??P?n?0<?W?k?~@???K?????????6U???Vm??QWsX͌4????%??*??1?7?????Rqz.s???C?F?~?f?j4%?????¶W?ך?ns~?Ko+T=W?lV]?/9?S_?yIfZ???4??Yp4????E??!fC&?	?	?%?,YRC?r?d}pap4? ??????%?7F??`lׂr???<H5H?]?w?I.Q<??r?^??Gݻ<????EU??W(?Z??e?A?Yo? w?5???۵'??EH\??-O?,?w~P?5      E   {   x?3?4C???̲|μԴ?ĜL????Ģ?|????????\N##c]C]cC+c+C=KS??*?4 4?t?KN,JOL?WHIU??r??0"?C+c=cCK?% JpZ???? ?o6?      F      x????n? ?k?~??ڸ;]?Ju??	???}|??O?b?};?14?-?=?????K*???5???_??C*?-xH??֭???9??>X1???
????S#?T?^>9?TXɱ?:?Y??V+? ???C?^l????'5?'?~C????r?ޖ㑣?NM?sX?????ǃf??#{\?=?m???jc g#?CB??ww?e?(??у|?????-???#7d??W}?8?L5	=???F????	t      o   ?   x?ǻ?  ?????}@???n????\?M?4@?????`?:??????ξ?N???`9rI?q?<2ȨoǗ??Z?r?|6ۈ???@̿v?*0ZtBRBI?OYn?I?q????h?{????W?Or?`???e??p?/?      I   V   x?3?4??ļ?|???̼?| ?3/1?$?,??/5?$1'3(?8?(3?????H??X??R???????? ?:?
9c???+F??? )?      J      x?????? ? ?      M   ?   x?u???0Dg?+???$?S&
????P?6?J??CY?MO?Ng{`pp9?>=u6C?4?u?%G-
g-K5_???t ?? 9??'b??:?????_J?/:?y??c?<??N`?~,?̆e?y?C+]X??߂Ebt?Vn?=:?JWAUF??O*??9J??K?4???>d      N      x?????? ? ?      m   N   x?3?4B##c]#]C??rL.?,???suq??
2wp?u???s??ER?`hlebaeh?gdjՉ??b???? 7Fs      Q   1   x?3?4???O)??WHIU??)?+I,??W?2?tL.?,#?X?=... ?.?      S   v   x?]?;
?0@g??@?d;?xj)]s/?v? ??	=?c???c`??*????/-R?G??<eU?퐮??l?+涁#????u.?=?D??O??????c??)͖j?i?MBc??g"?      T   d   x?3?424????J-8?+)'39Q?%?73??K?t?"_N??|NCcSNsS 陗?\?Y?ϙQRRPl??_TZ????????Z????????? j??      X   v   x?3?4?°??Ҽ?Ģ?|NK(????tL.?,???KM+I???+?/)qH?M???K???4202?50?56T04?26?21?3?0?蚗?X???????
2
M??????9H"Ə+F??? ??$0      Z   ?   x?3?4°??Ҽ?Ģ?|N???̲|μԴ?ĜL???b??Cznbf?^r~.????????????????????׼?Ģ?Ĕ|??T??8?2[???_????/B???Ȝ|Í???V????;?"?M å?J?R?JJS?i?)??4:F??? UׇA      \   R   x?3?4??ԔT???????N??N???̲|N?Դ?ĜL????Ģ?|N###]c]#KCc+c+?jT????? ??o      ^      x?????? ? ?      `   ?   x??ӱ? ??????`4vk?? 1?]nP??4` ???????7?r????d?>8?)?h?,udP??'{?????R?[??փCyU???h?lĎ??????8??Q??>>j???st0??UĖ?????Fc????{???/T???????_{?*r+J?M0?i      b   C   x?3?4???)?+I,??W??tL.?,[?Y?e?ձ81hgb
?lM?2A?k??????=... ?=?      e   p   x?3?4?H,N,?/*I?tL.?,???KM+I???/N,??O?4202?50?56T04?22?25г00???CC\?@??SSJs??6??T???a?c+cs=#c?m\1z\\\ ?.6      g   Y   x?3?4B?ԔT?Լ???N???̲|μԴ?Ĝ̢"s????????\N###]c]##+j/-.M,??????#?=... w?      i      x?????? ? ?      k   ?   x??M?0 ???_?aWǾ??? ?"*?,	/?L?[?A???G(`??ꞩ?.?|ه?yb? ??1??|o???U5?????]????X?û?G????G?{?T?X˸??M?3?\d?g??X^HVHE??МPCB?M$v     