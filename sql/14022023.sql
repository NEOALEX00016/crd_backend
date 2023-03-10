PGDMP     +    ;                {            cr    14.6    14.6 ?   9           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            :           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ;           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            <           1262    66778    cr    DATABASE     k   CREATE DATABASE cr WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Dominican Republic.1252';
    DROP DATABASE cr;
                postgres    false                        2615    68428    iniciar    SCHEMA        CREATE SCHEMA iniciar;
    DROP SCHEMA iniciar;
                crduser    false                        2615    66780    siv    SCHEMA        CREATE SCHEMA siv;
    DROP SCHEMA siv;
                postgres    false            =           0    0 
   SCHEMA siv    COMMENT     ;   COMMENT ON SCHEMA siv IS 'Sistema integral de Voluntario';
                   postgres    false    5            >           0    0 
   SCHEMA siv    ACL     6   GRANT ALL ON SCHEMA siv TO crduser WITH GRANT OPTION;
                   postgres    false    5                        3079    68721 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                   false            ?           0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    2            ;           1255    68793    insertadetallemiscursos()    FUNCTION     ?  CREATE FUNCTION iniciar.insertadetallemiscursos() RETURNS trigger
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
       iniciar          postgres    false    8            :           1255    68782    insert_log()    FUNCTION     6  CREATE FUNCTION public.insert_log() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  insert into iniciar.tbl_detalle_mis_cursos(id_mis_cursos,id_detalle,id_miembro,estado,id_curso)
select new.id,det.id,new.id_miembro,'Activo',det.id_curso from iniciar.tbl_detalle_de_cursos det;
    RETURN NEW;
END;
$$;
 #   DROP FUNCTION public.insert_log();
       public          crduser    false                       1259    68430     tbl_informacion_adicional    TABLE     )  CREATE TABLE iniciar." tbl_informacion_adicional" (
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
       iniciar         heap    crduser    false    8            @           0    0 "   TABLE " tbl_informacion_adicional"    COMMENT     ?   COMMENT ON TABLE iniciar." tbl_informacion_adicional" IS 'Aqui se almacena los diferentes tipos de informacion relacionada a un miembro';
          iniciar          crduser    false    262                       1259    68435 !    tbl_informacion_adicional_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar." tbl_informacion_adicional_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE iniciar." tbl_informacion_adicional_id_seq";
       iniciar          crduser    false    262    8            A           0    0 !    tbl_informacion_adicional_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE iniciar." tbl_informacion_adicional_id_seq" OWNED BY iniciar." tbl_informacion_adicional".id;
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
       iniciar         heap    crduser    false    8            B           0    0    TABLE tbl_area_de_accion    COMMENT     B   COMMENT ON TABLE iniciar.tbl_area_de_accion IS 'Area de Accion ';
          iniciar          crduser    false    264            	           1259    68441    tbl_area_de_accion_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar.tbl_area_de_accion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE iniciar.tbl_area_de_accion_id_seq;
       iniciar          crduser    false    8    264            C           0    0    tbl_area_de_accion_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE iniciar.tbl_area_de_accion_id_seq OWNED BY iniciar.tbl_area_de_accion.id;
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
       iniciar         heap    crduser    false    266    8            D           0    0    TABLE tbl_areas    COMMENT     S   COMMENT ON TABLE iniciar.tbl_areas IS 'Esto almacendra todas las areas por sedes';
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
       iniciar         heap    postgres    false    8            E           0    0    TABLE tbl_cursos    COMMENT     I   COMMENT ON TABLE iniciar.tbl_cursos IS 'aqui se crean todos los cursos';
          iniciar          postgres    false    268                       1259    68454    tbl_cursos_id_seq    SEQUENCE     {   CREATE SEQUENCE iniciar.tbl_cursos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE iniciar.tbl_cursos_id_seq;
       iniciar          postgres    false    268    8            F           0    0    tbl_cursos_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE iniciar.tbl_cursos_id_seq OWNED BY iniciar.tbl_cursos.id;
          iniciar          postgres    false    269                       1259    68455    tbl_det_roles_id_seq    SEQUENCE     ~   CREATE SEQUENCE iniciar.tbl_det_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE iniciar.tbl_det_roles_id_seq;
       iniciar          neoalex    false    8            G           0    0    SEQUENCE tbl_det_roles_id_seq    ACL     ?   GRANT ALL ON SEQUENCE iniciar.tbl_det_roles_id_seq TO crduser;
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
       iniciar          postgres    false    272    8            H           0    0    tbl_detalle_de_cursos_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE iniciar.tbl_detalle_de_cursos_id_seq OWNED BY iniciar.tbl_detalle_de_cursos.id;
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
       iniciar          postgres    false    313    8            I           0    0    tbl_detalle_mis_cursos_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE iniciar.tbl_detalle_mis_cursos_id_seq OWNED BY iniciar.tbl_detalle_mis_cursos.id;
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
       iniciar         heap    crduser    false    274    8            J           0    0    TABLE tbl_division    COMMENT     N   COMMENT ON TABLE iniciar.tbl_division IS 'Tabla de Divisiones de los paises';
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
       iniciar         heap    postgres    false    8            K           0    0    TABLE tbl_imagenes_miembros    COMMENT     g   COMMENT ON TABLE iniciar.tbl_imagenes_miembros IS 'Aqui se almacena todas las images de los miembros';
          iniciar          postgres    false    276                       1259    68480    tbl_imagenes_miembros_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar.tbl_imagenes_miembros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE iniciar.tbl_imagenes_miembros_id_seq;
       iniciar          postgres    false    276    8            L           0    0    tbl_imagenes_miembros_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE iniciar.tbl_imagenes_miembros_id_seq OWNED BY iniciar.tbl_imagenes_miembros.id;
          iniciar          postgres    false    277                       1259    68481    tbl_miembros_id_seq    SEQUENCE     }   CREATE SEQUENCE iniciar.tbl_miembros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE iniciar.tbl_miembros_id_seq;
       iniciar          postgres    false    8            M           0    0    SEQUENCE tbl_miembros_id_seq    ACL     >   GRANT ALL ON SEQUENCE iniciar.tbl_miembros_id_seq TO crduser;
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
       iniciar         heap    crduser    false    278    8            N           0    0    TABLE tbl_miembros    COMMENT     j   COMMENT ON TABLE iniciar.tbl_miembros IS 'Esto almacena todo los miembro tanto voluntario asalariado y ';
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
       iniciar         heap    postgres    false    8            O           0    0    TABLE tbl_miembros_posiciones    COMMENT     ?   COMMENT ON TABLE iniciar.tbl_miembros_posiciones IS 'Esta Tabla Contiene los Miembros y las Posiciones  asociadas a este miembro';
          iniciar          postgres    false    280                       1259    68491    tbl_miembros_posiciones_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar.tbl_miembros_posiciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE iniciar.tbl_miembros_posiciones_id_seq;
       iniciar          postgres    false    8    280            P           0    0    tbl_miembros_posiciones_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE iniciar.tbl_miembros_posiciones_id_seq OWNED BY iniciar.tbl_miembros_posiciones.id;
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
       iniciar          postgres    false    311    8            Q           0    0    tbl_mis_cursos_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE iniciar.tbl_mis_cursos_id_seq OWNED BY iniciar.tbl_mis_cursos.id;
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
       iniciar         heap    crduser    false    282    8            R           0    0    TABLE tbl_modulos    COMMENT     |   COMMENT ON TABLE iniciar.tbl_modulos IS 'almacena todos los modulos de la aplicacion en principio solo es los voluntarios';
          iniciar          crduser    false    283                       1259    68497    tbl_opciones_id_seq    SEQUENCE     }   CREATE SEQUENCE iniciar.tbl_opciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE iniciar.tbl_opciones_id_seq;
       iniciar          neoalex    false    8            S           0    0    SEQUENCE tbl_opciones_id_seq    ACL     >   GRANT ALL ON SEQUENCE iniciar.tbl_opciones_id_seq TO crduser;
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
       iniciar         heap    crduser    false    284    8            T           0    0    TABLE tbl_opciones    COMMENT     g   COMMENT ON TABLE iniciar.tbl_opciones IS 'esto almacena todas las opciones del menu de la aplicacion';
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
       iniciar         heap    crduser    false    8            U           0    0    TABLE tbl_paises    COMMENT     U   COMMENT ON TABLE iniciar.tbl_paises IS 'Tabla Donde se almacenara todos los paises';
          iniciar          crduser    false    286                       1259    68509    tbl_pais_id_seq    SEQUENCE     y   CREATE SEQUENCE iniciar.tbl_pais_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE iniciar.tbl_pais_id_seq;
       iniciar          crduser    false    8    286            V           0    0    tbl_pais_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE iniciar.tbl_pais_id_seq OWNED BY iniciar.tbl_paises.id;
          iniciar          crduser    false    287                        1259    68510    tbl_paises_id_seq    SEQUENCE     {   CREATE SEQUENCE iniciar.tbl_paises_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE iniciar.tbl_paises_id_seq;
       iniciar          crduser    false    286    8            W           0    0    tbl_paises_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE iniciar.tbl_paises_id_seq OWNED BY iniciar.tbl_paises.id;
          iniciar          crduser    false    288            !           1259    68511    tbl_posiciones_id_seq    SEQUENCE        CREATE SEQUENCE iniciar.tbl_posiciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE iniciar.tbl_posiciones_id_seq;
       iniciar          postgres    false    8            X           0    0    SEQUENCE tbl_posiciones_id_seq    ACL     @   GRANT ALL ON SEQUENCE iniciar.tbl_posiciones_id_seq TO crduser;
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
       iniciar         heap    crduser    false    289    8            Y           0    0    TABLE tbl_posiciones    COMMENT     h   COMMENT ON TABLE iniciar.tbl_posiciones IS 'Esto almacena las posiciones disponibles por area y sede ';
          iniciar          crduser    false    290            Z           0    0    COLUMN tbl_posiciones.id_rol    COMMENT     K   COMMENT ON COLUMN iniciar.tbl_posiciones.id_rol IS 'esto es para los rol';
          iniciar          crduser    false    290            #           1259    68517    tbl_roles_id_seq    SEQUENCE     z   CREATE SEQUENCE iniciar.tbl_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE iniciar.tbl_roles_id_seq;
       iniciar          neoalex    false    8            [           0    0    SEQUENCE tbl_roles_id_seq    ACL     ;   GRANT ALL ON SEQUENCE iniciar.tbl_roles_id_seq TO crduser;
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
       iniciar         heap    crduser    false    291    8            \           0    0    TABLE tbl_roles    COMMENT     A   COMMENT ON TABLE iniciar.tbl_roles IS 'Definicion de los roles';
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
       iniciar         heap    crduser    false    293    8            ]           0    0    TABLE tbl_sedes    COMMENT     P   COMMENT ON TABLE iniciar.tbl_sedes IS 'Son las diferentes sedes de los paises';
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
       iniciar         heap    crduser    false    8            ^           0    0    TABLE tbl_tipo_informacion    COMMENT     }   COMMENT ON TABLE iniciar.tbl_tipo_informacion IS 'Esto almacendra los diferentes tipos de informacion para los voluntarios';
          iniciar          crduser    false    296            )           1259    68538    tbl_tipo_informacion_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar.tbl_tipo_informacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE iniciar.tbl_tipo_informacion_id_seq;
       iniciar          crduser    false    8    296            _           0    0    tbl_tipo_informacion_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE iniciar.tbl_tipo_informacion_id_seq OWNED BY iniciar.tbl_tipo_informacion.id;
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
       iniciar          crduser    false    8    298            `           0    0    tbl_tipodivision_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE iniciar.tbl_tipodivision_id_seq OWNED BY iniciar.tbl_tipodivision.id;
          iniciar          crduser    false    299            ,           1259    68545    tbl_tipos_de_miembros    TABLE     ?   CREATE TABLE iniciar.tbl_tipos_de_miembros (
    id bigint NOT NULL,
    id_pais bigint NOT NULL,
    descripcion character(100) NOT NULL,
    estado character(10) NOT NULL,
    calcular_tiempo boolean
);
 *   DROP TABLE iniciar.tbl_tipos_de_miembros;
       iniciar         heap    crduser    false    8            a           0    0    TABLE tbl_tipos_de_miembros    COMMENT     \   COMMENT ON TABLE iniciar.tbl_tipos_de_miembros IS 'Esto almacena todos Tipos de miembros ';
          iniciar          crduser    false    300            -           1259    68548    tbl_tipos_de_miembros_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar.tbl_tipos_de_miembros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE iniciar.tbl_tipos_de_miembros_id_seq;
       iniciar          crduser    false    8    300            b           0    0    tbl_tipos_de_miembros_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE iniciar.tbl_tipos_de_miembros_id_seq OWNED BY iniciar.tbl_tipos_de_miembros.id;
          iniciar          crduser    false    301            .           1259    68549    tbl_tipos_documentos_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar.tbl_tipos_documentos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE iniciar.tbl_tipos_documentos_id_seq;
       iniciar          postgres    false    8            c           0    0 $   SEQUENCE tbl_tipos_documentos_id_seq    ACL     F   GRANT ALL ON SEQUENCE iniciar.tbl_tipos_documentos_id_seq TO crduser;
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
       iniciar         heap    crduser    false    302    8            d           0    0    TABLE tbl_tipos_documentos    COMMENT     S   COMMENT ON TABLE iniciar.tbl_tipos_documentos IS 'tipos de Documentos por paises';
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
       iniciar         heap    crduser    false    304    8            e           0    0    TABLE tbl_tipos_sedes    COMMENT     k   COMMENT ON TABLE iniciar.tbl_tipos_sedes IS 'Alamacena los tipos de sedes dependendiendo de la division ';
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
       iniciar         heap    crduser    false    306    8            f           0    0 #   TABLE tbl_transacciones_de_miembros    COMMENT     v   COMMENT ON TABLE iniciar.tbl_transacciones_de_miembros IS 'Esto Almacenara todas las transacciones de los miembros ';
          iniciar          crduser    false    307            4           1259    68570    tbl_users_id_seq    SEQUENCE     z   CREATE SEQUENCE iniciar.tbl_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE iniciar.tbl_users_id_seq;
       iniciar          neoalex    false    8            g           0    0    SEQUENCE tbl_users_id_seq    ACL     ;   GRANT ALL ON SEQUENCE iniciar.tbl_users_id_seq TO crduser;
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
       iniciar         heap    crduser    false    308    8                       1259    67466 
   tbl_paises    TABLE     ?  CREATE TABLE public.tbl_paises (
    nombre character varying NOT NULL,
    alpha2 character varying NOT NULL,
    alpha3 character varying NOT NULL,
    codigo integer NOT NULL,
    domains character varying NOT NULL,
    habitantes character varying NOT NULL,
    superficie integer NOT NULL,
    bandera bytea,
    estado character varying NOT NULL,
    ruta_bandera character varying NOT NULL,
    id bigint NOT NULL
);
    DROP TABLE public.tbl_paises;
       public         heap    crduser    false                       1259    67475    tbl_paises_id_seq    SEQUENCE     z   CREATE SEQUENCE public.tbl_paises_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.tbl_paises_id_seq;
       public          crduser    false    260            h           0    0    tbl_paises_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.tbl_paises_id_seq OWNED BY public.tbl_paises.id;
          public          crduser    false    261            ?            1259    66809    tbl_hist_posiciones    TABLE     ?  CREATE TABLE siv.tbl_hist_posiciones (
    id bigint NOT NULL,
    id_posicion bigint NOT NULL,
    id_voluntario bigint NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_finalizacion date,
    estado character(10) DEFAULT 'Activo'::bpchar NOT NULL,
    agregado_por character(100) NOT NULL,
    agregado_en date NOT NULL,
    modificado_por character(100),
    modificado_en date
);
 $   DROP TABLE siv.tbl_hist_posiciones;
       siv         heap    postgres    false    5            i           0    0    TABLE tbl_hist_posiciones    COMMENT     ?   COMMENT ON TABLE siv.tbl_hist_posiciones IS 'Esto es para las posiciones de ocupadas para el tipo posiciones esto mantendra un historial de todas las posiciones ocupadas por un voluntario';
          siv          postgres    false    212            ?            1259    66813    posiciones_id_seq    SEQUENCE     w   CREATE SEQUENCE siv.posiciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE siv.posiciones_id_seq;
       siv          postgres    false    212    5            j           0    0    posiciones_id_seq    SEQUENCE OWNED BY     J   ALTER SEQUENCE siv.posiciones_id_seq OWNED BY siv.tbl_hist_posiciones.id;
          siv          postgres    false    213            ?            1259    66814    tb_tipos_actividades    TABLE     ^  CREATE TABLE siv.tb_tipos_actividades (
    id bigint NOT NULL,
    id_pais bigint NOT NULL,
    id_areas bigint NOT NULL,
    descripcion bigint NOT NULL,
    estado character(50) DEFAULT 'Activo'::bpchar NOT NULL,
    agregado_por character(100) NOT NULL,
    agregado_en date NOT NULL,
    modificado_por character(100),
    modificado_en date
);
 %   DROP TABLE siv.tb_tipos_actividades;
       siv         heap    postgres    false    5            ?            1259    66818    tbl_actividades    TABLE     6  CREATE TABLE siv.tbl_actividades (
    id bigint NOT NULL,
    id_pais bigint NOT NULL,
    id_sede bigint NOT NULL,
    id_voluntario_creador bigint NOT NULL,
    fecha_de_actividad date NOT NULL,
    descripcion character(500) NOT NULL,
    estado character(50) DEFAULT 'Activo'::bpchar NOT NULL,
    agregado_por character(100) NOT NULL,
    agregado_en timestamp without time zone NOT NULL,
    modificado_por character(100),
    modificado_en timestamp without time zone,
    direccion character(500) NOT NULL,
    geo character(500),
    id_division bigint
);
     DROP TABLE siv.tbl_actividades;
       siv         heap    postgres    false    5            k           0    0    TABLE tbl_actividades    COMMENT     U   COMMENT ON TABLE siv.tbl_actividades IS 'Aqui se almacenara todas las actividades ';
          siv          postgres    false    215            ?            1259    66824    tbl_activicades_id_seq    SEQUENCE     |   CREATE SEQUENCE siv.tbl_activicades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE siv.tbl_activicades_id_seq;
       siv          postgres    false    215    5            l           0    0    tbl_activicades_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE siv.tbl_activicades_id_seq OWNED BY siv.tbl_actividades.id;
          siv          postgres    false    216            ?            1259    66825    tbl_areas_id_seq    SEQUENCE     v   CREATE SEQUENCE siv.tbl_areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE siv.tbl_areas_id_seq;
       siv          postgres    false    5            ?            1259    66826 	   tbl_areas    TABLE     ?  CREATE TABLE siv.tbl_areas (
    id bigint DEFAULT nextval('siv.tbl_areas_id_seq'::regclass) NOT NULL,
    id_pais bigint NOT NULL,
    id_sede bigint NOT NULL,
    nombre character(50) NOT NULL,
    estado character(10) DEFAULT 'Activo'::bpchar NOT NULL,
    agregado_por character(100) NOT NULL,
    agragado_en date NOT NULL,
    modificado_por character(100),
    modificado_en date
);
    DROP TABLE siv.tbl_areas;
       siv         heap    postgres    false    217    5            m           0    0    TABLE tbl_areas    COMMENT     Q   COMMENT ON TABLE siv.tbl_areas IS 'esto almacena todas las areas perteneciente';
          siv          postgres    false    218            ?            1259    66831    tbl_areas_de_accion    TABLE     ?  CREATE TABLE siv.tbl_areas_de_accion (
    id bigint NOT NULL,
    id_pais bigint NOT NULL,
    id_area bigint NOT NULL,
    id_sede bigint NOT NULL,
    descripcion character(100) NOT NULL,
    estado character(50) DEFAULT 'Activo'::bpchar NOT NULL,
    agregado_por character(100) NOT NULL,
    agregado_en date NOT NULL,
    modificado_por character(100),
    modificado_en date
);
 $   DROP TABLE siv.tbl_areas_de_accion;
       siv         heap    postgres    false    5            n           0    0    TABLE tbl_areas_de_accion    COMMENT     Z   COMMENT ON TABLE siv.tbl_areas_de_accion IS 'Estas son las Areas de Accion de cada area';
          siv          postgres    false    219            ?            1259    66835    tbl_areas_de_accion_id_seq    SEQUENCE     ?   CREATE SEQUENCE siv.tbl_areas_de_accion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE siv.tbl_areas_de_accion_id_seq;
       siv          postgres    false    5    219            o           0    0    tbl_areas_de_accion_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE siv.tbl_areas_de_accion_id_seq OWNED BY siv.tbl_areas_de_accion.id;
          siv          postgres    false    220            ?            1259    66836    tbl_capacitacion    TABLE     >   CREATE TABLE siv.tbl_capacitacion (
    id bigint NOT NULL
);
 !   DROP TABLE siv.tbl_capacitacion;
       siv         heap    crduser    false    5            p           0    0    TABLE tbl_capacitacion    COMMENT     P   COMMENT ON TABLE siv.tbl_capacitacion IS 'Aqui se almacena los capacitaciones';
          siv          crduser    false    221            ?            1259    66839    tbl_capacitacion_id_seq    SEQUENCE     }   CREATE SEQUENCE siv.tbl_capacitacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE siv.tbl_capacitacion_id_seq;
       siv          crduser    false    221    5            q           0    0    tbl_capacitacion_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE siv.tbl_capacitacion_id_seq OWNED BY siv.tbl_capacitacion.id;
          siv          crduser    false    222            ?            1259    66840    tbl_capacitaciones_voluntarios    TABLE     L   CREATE TABLE siv.tbl_capacitaciones_voluntarios (
    id bigint NOT NULL
);
 /   DROP TABLE siv.tbl_capacitaciones_voluntarios;
       siv         heap    crduser    false    5            r           0    0 $   TABLE tbl_capacitaciones_voluntarios    COMMENT     h   COMMENT ON TABLE siv.tbl_capacitaciones_voluntarios IS 'Capacitaciones que han tomado los voluntarios';
          siv          crduser    false    223            ?            1259    66843 %   tbl_capacitaciones_voluntarios_id_seq    SEQUENCE     ?   CREATE SEQUENCE siv.tbl_capacitaciones_voluntarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE siv.tbl_capacitaciones_voluntarios_id_seq;
       siv          crduser    false    5    223            s           0    0 %   tbl_capacitaciones_voluntarios_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE siv.tbl_capacitaciones_voluntarios_id_seq OWNED BY siv.tbl_capacitaciones_voluntarios.id;
          siv          crduser    false    224            ?            1259    66844 #   tbl_detalle_capacitacion_voluntario    TABLE     Q   CREATE TABLE siv.tbl_detalle_capacitacion_voluntario (
    id bigint NOT NULL
);
 4   DROP TABLE siv.tbl_detalle_capacitacion_voluntario;
       siv         heap    crduser    false    5            t           0    0 )   TABLE tbl_detalle_capacitacion_voluntario    COMMENT     h   COMMENT ON TABLE siv.tbl_detalle_capacitacion_voluntario IS 'detalle de la capacitacion de voluntario';
          siv          crduser    false    225            ?            1259    66847 *   tbl_detalle_capacitacion_voluntario_id_seq    SEQUENCE     ?   CREATE SEQUENCE siv.tbl_detalle_capacitacion_voluntario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE siv.tbl_detalle_capacitacion_voluntario_id_seq;
       siv          crduser    false    5    225            u           0    0 *   tbl_detalle_capacitacion_voluntario_id_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE siv.tbl_detalle_capacitacion_voluntario_id_seq OWNED BY siv.tbl_detalle_capacitacion_voluntario.id;
          siv          crduser    false    226            ?            1259    66848    tbl_detalle_capacitaciones    TABLE     H   CREATE TABLE siv.tbl_detalle_capacitaciones (
    id bigint NOT NULL
);
 +   DROP TABLE siv.tbl_detalle_capacitaciones;
       siv         heap    crduser    false    5            ?            1259    66851 !   tbl_detalle_capacitaciones_id_seq    SEQUENCE     ?   CREATE SEQUENCE siv.tbl_detalle_capacitaciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE siv.tbl_detalle_capacitaciones_id_seq;
       siv          crduser    false    227    5            v           0    0 !   tbl_detalle_capacitaciones_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE siv.tbl_detalle_capacitaciones_id_seq OWNED BY siv.tbl_detalle_capacitaciones.id;
          siv          crduser    false    228            ?            1259    66852    tbl_detalle_examen_capacitacion    TABLE     M   CREATE TABLE siv.tbl_detalle_examen_capacitacion (
    id bigint NOT NULL
);
 0   DROP TABLE siv.tbl_detalle_examen_capacitacion;
       siv         heap    crduser    false    5            w           0    0 %   TABLE tbl_detalle_examen_capacitacion    COMMENT     V   COMMENT ON TABLE siv.tbl_detalle_examen_capacitacion IS 'detalle de la capacitacion';
          siv          crduser    false    229            ?            1259    66855 &   tbl_detalle_examen_capacitacion_id_seq    SEQUENCE     ?   CREATE SEQUENCE siv.tbl_detalle_examen_capacitacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE siv.tbl_detalle_examen_capacitacion_id_seq;
       siv          crduser    false    5    229            x           0    0 &   tbl_detalle_examen_capacitacion_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE siv.tbl_detalle_examen_capacitacion_id_seq OWNED BY siv.tbl_detalle_examen_capacitacion.id;
          siv          crduser    false    230            ?            1259    66856    tbl_detalle_tipo_actividad    TABLE     ?  CREATE TABLE siv.tbl_detalle_tipo_actividad (
    id bigint NOT NULL,
    id_pais bigint NOT NULL,
    id_actividad bigint NOT NULL,
    id_tipo_actividad bigint NOT NULL,
    estado character(50) DEFAULT 'Activo'::bpchar NOT NULL,
    agregado_por character(100) NOT NULL,
    agregado_en timestamp without time zone,
    modificado_por character(100),
    modificado_en timestamp without time zone
);
 +   DROP TABLE siv.tbl_detalle_tipo_actividad;
       siv         heap    postgres    false    5            y           0    0     TABLE tbl_detalle_tipo_actividad    COMMENT     u   COMMENT ON TABLE siv.tbl_detalle_tipo_actividad IS 'Aqui se almacena todos los tipos de actividad que ser realizar';
          siv          postgres    false    231            ?            1259    66860 !   tbl_detalle_tipo_actividad_id_seq    SEQUENCE     ?   CREATE SEQUENCE siv.tbl_detalle_tipo_actividad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE siv.tbl_detalle_tipo_actividad_id_seq;
       siv          postgres    false    5    231            z           0    0 !   tbl_detalle_tipo_actividad_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE siv.tbl_detalle_tipo_actividad_id_seq OWNED BY siv.tbl_detalle_tipo_actividad.id;
          siv          postgres    false    232            ?            1259    66861    tbl_division    TABLE     ?  CREATE TABLE siv.tbl_division (
    id bigint NOT NULL,
    id_tipo_division bigint NOT NULL,
    nombre character(100) NOT NULL,
    depende bigint,
    estado character(10) NOT NULL,
    agregado_por character(100) NOT NULL,
    agregado_en date NOT NULL,
    modificado_por character(100),
    modificado_en date
);
    DROP TABLE siv.tbl_division;
       siv         heap    postgres    false    5            {           0    0    TABLE tbl_division    COMMENT     U   COMMENT ON TABLE siv.tbl_division IS 'Este es el Nombre de la division territorial';
          siv          postgres    false    233            ?            1259    66864    tbl_division_id_seq    SEQUENCE     y   CREATE SEQUENCE siv.tbl_division_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE siv.tbl_division_id_seq;
       siv          postgres    false    233    5            |           0    0    tbl_division_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE siv.tbl_division_id_seq OWNED BY siv.tbl_division.id;
          siv          postgres    false    234            ?            1259    66865    tbl_examen_capacitacion    TABLE     E   CREATE TABLE siv.tbl_examen_capacitacion (
    id bigint NOT NULL
);
 (   DROP TABLE siv.tbl_examen_capacitacion;
       siv         heap    crduser    false    5            }           0    0    TABLE tbl_examen_capacitacion    COMMENT     Y   COMMENT ON TABLE siv.tbl_examen_capacitacion IS 'maestro del examen de la capacitacion';
          siv          crduser    false    235            ?            1259    66868    tbl_examen_capacitacion_id_seq    SEQUENCE     ?   CREATE SEQUENCE siv.tbl_examen_capacitacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE siv.tbl_examen_capacitacion_id_seq;
       siv          crduser    false    235    5            ~           0    0    tbl_examen_capacitacion_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE siv.tbl_examen_capacitacion_id_seq OWNED BY siv.tbl_examen_capacitacion.id;
          siv          crduser    false    236            ?            1259    66869    tbl_informacion_adicional    TABLE     ?  CREATE TABLE siv.tbl_informacion_adicional (
    id bigint NOT NULL,
    id_pais bigint NOT NULL,
    id_voluntario bigint NOT NULL,
    id_sede bigint NOT NULL,
    "id_tipo_información" bigint NOT NULL,
    valor character(200) NOT NULL,
    estado character(50) DEFAULT 'Activo'::bpchar NOT NULL,
    agregado_por character(100) NOT NULL,
    agregado_en date NOT NULL,
    modificado_por character(100),
    modificado_en date
);
 *   DROP TABLE siv.tbl_informacion_adicional;
       siv         heap    postgres    false    5                       0    0    TABLE tbl_informacion_adicional    COMMENT     z   COMMENT ON TABLE siv.tbl_informacion_adicional IS 'Esta Tabla almacena toda la informacion adicional de los voluntarios';
          siv          postgres    false    237            ?            1259    66873     tbl_informacion_adicional_id_seq    SEQUENCE     ?   CREATE SEQUENCE siv.tbl_informacion_adicional_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE siv.tbl_informacion_adicional_id_seq;
       siv          postgres    false    5    237            ?           0    0     tbl_informacion_adicional_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE siv.tbl_informacion_adicional_id_seq OWNED BY siv.tbl_informacion_adicional.id;
          siv          postgres    false    238            ?            1259    66874    tbl_pais    TABLE     ?  CREATE TABLE siv.tbl_pais (
    id bigint NOT NULL,
    nombre character(50) NOT NULL,
    alpha2 character(2) NOT NULL,
    alpha3 character(3) NOT NULL,
    codigo integer NOT NULL,
    domains character(10) NOT NULL,
    habitantes integer,
    superficie numeric(15,2),
    bandera bytea,
    estado character(10) NOT NULL,
    agregado_por character(100) NOT NULL,
    agregado_en date NOT NULL,
    modificado_por character(100),
    modificado_en date
);
    DROP TABLE siv.tbl_pais;
       siv         heap    postgres    false    5            ?            1259    66879    tbl_pais_id_seq    SEQUENCE     u   CREATE SEQUENCE siv.tbl_pais_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE siv.tbl_pais_id_seq;
       siv          postgres    false    5    239            ?           0    0    tbl_pais_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE siv.tbl_pais_id_seq OWNED BY siv.tbl_pais.id;
          siv          postgres    false    240            ?            1259    66880    tbl_tipos_de_posiciones_id_seq    SEQUENCE     ?   CREATE SEQUENCE siv.tbl_tipos_de_posiciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE siv.tbl_tipos_de_posiciones_id_seq;
       siv          postgres    false    5            ?            1259    66881    tbl_posiciones    TABLE     ?  CREATE TABLE siv.tbl_posiciones (
    id bigint DEFAULT nextval('siv.tbl_tipos_de_posiciones_id_seq'::regclass) NOT NULL,
    id_pais bigint NOT NULL,
    id_area bigint NOT NULL,
    nombre character(100) NOT NULL,
    posiciones_disponible integer DEFAULT 1 NOT NULL,
    depende bigint DEFAULT 0 NOT NULL,
    estados character(50) DEFAULT 'Activo'::bpchar NOT NULL,
    agregado_por character(100) NOT NULL,
    agregado_en date NOT NULL,
    modificado_por character(100),
    modificado_en date
);
    DROP TABLE siv.tbl_posiciones;
       siv         heap    postgres    false    241    5            ?           0    0    TABLE tbl_posiciones    COMMENT     P   COMMENT ON TABLE siv.tbl_posiciones IS 'Son los tipos de posiciones por sedes';
          siv          postgres    false    242            ?            1259    66888    tbl_resultado_examen_voluntario    TABLE     M   CREATE TABLE siv.tbl_resultado_examen_voluntario (
    id bigint NOT NULL
);
 0   DROP TABLE siv.tbl_resultado_examen_voluntario;
       siv         heap    crduser    false    5            ?           0    0 %   TABLE tbl_resultado_examen_voluntario    COMMENT     U   COMMENT ON TABLE siv.tbl_resultado_examen_voluntario IS 'examen de la capacitacion';
          siv          crduser    false    243            ?            1259    66891 &   tbl_resultado_examen_voluntario_id_seq    SEQUENCE     ?   CREATE SEQUENCE siv.tbl_resultado_examen_voluntario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE siv.tbl_resultado_examen_voluntario_id_seq;
       siv          crduser    false    5    243            ?           0    0 &   tbl_resultado_examen_voluntario_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE siv.tbl_resultado_examen_voluntario_id_seq OWNED BY siv.tbl_resultado_examen_voluntario.id;
          siv          crduser    false    244            ?            1259    66892    tbl_sedes_id_seq    SEQUENCE     v   CREATE SEQUENCE siv.tbl_sedes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE siv.tbl_sedes_id_seq;
       siv          postgres    false    5            ?            1259    66893 	   tbl_sedes    TABLE     ?  CREATE TABLE siv.tbl_sedes (
    id bigint DEFAULT nextval('siv.tbl_sedes_id_seq'::regclass) NOT NULL,
    id_tipo_sede bigint NOT NULL,
    id_division bigint NOT NULL,
    nombre character(100) NOT NULL,
    voluntarios integer DEFAULT 0 NOT NULL,
    depende bigint DEFAULT 0 NOT NULL,
    estado character(10) DEFAULT 'Activo'::bpchar NOT NULL,
    agregado_por character(100) NOT NULL,
    agregado_en date NOT NULL,
    modificado_por character(100),
    modificado_en date
);
    DROP TABLE siv.tbl_sedes;
       siv         heap    postgres    false    245    5            ?           0    0    TABLE tbl_sedes    COMMENT     A   COMMENT ON TABLE siv.tbl_sedes IS 'todas las sedes almacenadas';
          siv          postgres    false    246            ?            1259    66900    tbl_tipo_division    TABLE     ;  CREATE TABLE siv.tbl_tipo_division (
    id bigint NOT NULL,
    id_pais bigint NOT NULL,
    nombre character(50) NOT NULL,
    depende integer,
    estado character(10) NOT NULL,
    agregado_por character(100) NOT NULL,
    agregado_en date NOT NULL,
    modificado_por character(100),
    modificado_en date
);
 "   DROP TABLE siv.tbl_tipo_division;
       siv         heap    postgres    false    5            ?           0    0    TABLE tbl_tipo_division    COMMENT     ?   COMMENT ON TABLE siv.tbl_tipo_division IS 'Esta tabla almacena los diferentes tipos de division geografica por los diferentes paises';
          siv          postgres    false    247            ?            1259    66903    tbl_tipo_division_id_seq    SEQUENCE     ~   CREATE SEQUENCE siv.tbl_tipo_division_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE siv.tbl_tipo_division_id_seq;
       siv          postgres    false    5    247            ?           0    0    tbl_tipo_division_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE siv.tbl_tipo_division_id_seq OWNED BY siv.tbl_tipo_division.id;
          siv          postgres    false    248            ?            1259    66904    tbl_tipo_informacion    TABLE     e  CREATE TABLE siv.tbl_tipo_informacion (
    id bigint NOT NULL,
    id_pais bigint NOT NULL,
    id_sede bigint NOT NULL,
    descripcion character(100) NOT NULL,
    estado character(50) DEFAULT 'Activo'::bpchar NOT NULL,
    agregado_por character(100) NOT NULL,
    agregado_en date NOT NULL,
    modificado_por character(100),
    modificado_en date
);
 %   DROP TABLE siv.tbl_tipo_informacion;
       siv         heap    postgres    false    5            ?           0    0    TABLE tbl_tipo_informacion    COMMENT     `   COMMENT ON TABLE siv.tbl_tipo_informacion IS 'los tipos de informacion (direccion,cedula etc)';
          siv          postgres    false    249            ?            1259    66908    tbl_tipo_informacion_id_seq    SEQUENCE     ?   CREATE SEQUENCE siv.tbl_tipo_informacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE siv.tbl_tipo_informacion_id_seq;
       siv          postgres    false    5    249            ?           0    0    tbl_tipo_informacion_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE siv.tbl_tipo_informacion_id_seq OWNED BY siv.tbl_tipo_informacion.id;
          siv          postgres    false    250            ?            1259    66909    tbl_tipos_documentos    TABLE     n  CREATE TABLE siv.tbl_tipos_documentos (
    id bigint NOT NULL,
    id_pais bigint NOT NULL,
    descripcion bigint NOT NULL,
    estado character(50) DEFAULT 'Activo'::bpchar NOT NULL,
    agregado_por character(100) NOT NULL,
    agregado_en timestamp without time zone NOT NULL,
    modificado_por character(100),
    modificado_en timestamp without time zone
);
 %   DROP TABLE siv.tbl_tipos_documentos;
       siv         heap    postgres    false    5            ?           0    0    TABLE tbl_tipos_documentos    COMMENT     Q   COMMENT ON TABLE siv.tbl_tipos_documentos IS 'Los tipos de Documentos por pais';
          siv          postgres    false    251            ?            1259    66913    tbl_tipos_documentos_id_seq    SEQUENCE     ?   CREATE SEQUENCE siv.tbl_tipos_documentos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE siv.tbl_tipos_documentos_id_seq;
       siv          postgres    false    251    5            ?           0    0    tbl_tipos_documentos_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE siv.tbl_tipos_documentos_id_seq OWNED BY siv.tbl_tipos_documentos.id;
          siv          postgres    false    252            ?            1259    66914    tbl_tipos_sedes_id_seq    SEQUENCE     |   CREATE SEQUENCE siv.tbl_tipos_sedes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE siv.tbl_tipos_sedes_id_seq;
       siv          postgres    false    5            ?            1259    66915    tbl_tipos_sedes    TABLE     ?  CREATE TABLE siv.tbl_tipos_sedes (
    id bigint DEFAULT nextval('siv.tbl_tipos_sedes_id_seq'::regclass) NOT NULL,
    id_tipo_division bigint NOT NULL,
    nombre character(50) NOT NULL,
    estado character(10) NOT NULL,
    agregado_por character(100) NOT NULL,
    agregado_en date NOT NULL,
    modificado_por character(100),
    modificado_en date,
    depende bigint DEFAULT 0 NOT NULL
);
     DROP TABLE siv.tbl_tipos_sedes;
       siv         heap    postgres    false    253    5            ?           0    0    TABLE tbl_tipos_sedes    COMMENT     e   COMMENT ON TABLE siv.tbl_tipos_sedes IS 'Se almacena los diferentes tipos de sedes que se almacena';
          siv          postgres    false    254            ?            1259    66920    tbl_voluntarios    TABLE     ?  CREATE TABLE siv.tbl_voluntarios (
    id bigint NOT NULL,
    id_pais bigint NOT NULL,
    id_posicion bigint NOT NULL,
    id_area bigint NOT NULL,
    id_sede bigint NOT NULL,
    nombre character(50) NOT NULL,
    apellidos character(50) NOT NULL,
    nombre_completo character(100) NOT NULL,
    nacionalidad character(100) NOT NULL,
    lugar_de_nacimiento character(100) NOT NULL,
    fecha_de_nacimiento date NOT NULL,
    id_tipo_documento bigint,
    documento character(1),
    estado character(50) DEFAULT 'A'::bpchar NOT NULL,
    agregado_por character(50) NOT NULL,
    agregado_en date NOT NULL,
    modificado_por character(50),
    modificado_en date,
    tiempo_voluntariado numeric(15,2),
    depende bigint
);
     DROP TABLE siv.tbl_voluntarios;
       siv         heap    postgres    false    5            ?           0    0    TABLE tbl_voluntarios    COMMENT     a   COMMENT ON TABLE siv.tbl_voluntarios IS 'Esta Tabla Almacena todos los voluntarios del sistema';
          siv          postgres    false    255                        1259    66926    tbl_voluntarios_actividades    TABLE     ?  CREATE TABLE siv.tbl_voluntarios_actividades (
    id bigint NOT NULL,
    id_pais bigint NOT NULL,
    id_actividad bigint NOT NULL,
    id_voluntario bigint NOT NULL,
    tiempo numeric(15,2) NOT NULL,
    estado character(1) NOT NULL,
    comentario character(1),
    agregado_por character(100) NOT NULL,
    agregado_en timestamp without time zone NOT NULL,
    modificado_por character(100),
    modificado_en timestamp without time zone
);
 ,   DROP TABLE siv.tbl_voluntarios_actividades;
       siv         heap    postgres    false    5            ?           0    0 !   TABLE tbl_voluntarios_actividades    COMMENT     k   COMMENT ON TABLE siv.tbl_voluntarios_actividades IS 'Los voluntarios que participaron en las actividades';
          siv          postgres    false    256                       1259    66929 "   tbl_voluntarios_actividades_id_seq    SEQUENCE     ?   CREATE SEQUENCE siv.tbl_voluntarios_actividades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE siv.tbl_voluntarios_actividades_id_seq;
       siv          postgres    false    5    256            ?           0    0 "   tbl_voluntarios_actividades_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE siv.tbl_voluntarios_actividades_id_seq OWNED BY siv.tbl_voluntarios_actividades.id;
          siv          postgres    false    257                       1259    66930    tipos_actividades_id_seq    SEQUENCE     ~   CREATE SEQUENCE siv.tipos_actividades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE siv.tipos_actividades_id_seq;
       siv          postgres    false    5    214            ?           0    0    tipos_actividades_id_seq    SEQUENCE OWNED BY     R   ALTER SEQUENCE siv.tipos_actividades_id_seq OWNED BY siv.tb_tipos_actividades.id;
          siv          postgres    false    258                       1259    66931    voluntarios_id_seq    SEQUENCE     x   CREATE SEQUENCE siv.voluntarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE siv.voluntarios_id_seq;
       siv          postgres    false    255    5            ?           0    0    voluntarios_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE siv.voluntarios_id_seq OWNED BY siv.tbl_voluntarios.id;
          siv          postgres    false    259            ?           2604    68577     tbl_informacion_adicional id    DEFAULT     ?   ALTER TABLE ONLY iniciar." tbl_informacion_adicional" ALTER COLUMN id SET DEFAULT nextval('iniciar." tbl_informacion_adicional_id_seq"'::regclass);
 O   ALTER TABLE iniciar." tbl_informacion_adicional" ALTER COLUMN id DROP DEFAULT;
       iniciar          crduser    false    263    262            ?           2604    68578    tbl_area_de_accion id    DEFAULT     ?   ALTER TABLE ONLY iniciar.tbl_area_de_accion ALTER COLUMN id SET DEFAULT nextval('iniciar.tbl_area_de_accion_id_seq'::regclass);
 E   ALTER TABLE iniciar.tbl_area_de_accion ALTER COLUMN id DROP DEFAULT;
       iniciar          crduser    false    265    264            ?           2604    68579    tbl_cursos id    DEFAULT     p   ALTER TABLE ONLY iniciar.tbl_cursos ALTER COLUMN id SET DEFAULT nextval('iniciar.tbl_cursos_id_seq'::regclass);
 =   ALTER TABLE iniciar.tbl_cursos ALTER COLUMN id DROP DEFAULT;
       iniciar          postgres    false    269    268            ?           2604    68580    tbl_detalle_de_cursos id    DEFAULT     ?   ALTER TABLE ONLY iniciar.tbl_detalle_de_cursos ALTER COLUMN id SET DEFAULT nextval('iniciar.tbl_detalle_de_cursos_id_seq'::regclass);
 H   ALTER TABLE iniciar.tbl_detalle_de_cursos ALTER COLUMN id DROP DEFAULT;
       iniciar          postgres    false    273    272            ?           2604    68779    tbl_detalle_mis_cursos id    DEFAULT     ?   ALTER TABLE ONLY iniciar.tbl_detalle_mis_cursos ALTER COLUMN id SET DEFAULT nextval('iniciar.tbl_detalle_mis_cursos_id_seq'::regclass);
 I   ALTER TABLE iniciar.tbl_detalle_mis_cursos ALTER COLUMN id DROP DEFAULT;
       iniciar          postgres    false    312    313    313            ?           2604    68581    tbl_imagenes_miembros id    DEFAULT     ?   ALTER TABLE ONLY iniciar.tbl_imagenes_miembros ALTER COLUMN id SET DEFAULT nextval('iniciar.tbl_imagenes_miembros_id_seq'::regclass);
 H   ALTER TABLE iniciar.tbl_imagenes_miembros ALTER COLUMN id DROP DEFAULT;
       iniciar          postgres    false    277    276            ?           2604    68582    tbl_miembros_posiciones id    DEFAULT     ?   ALTER TABLE ONLY iniciar.tbl_miembros_posiciones ALTER COLUMN id SET DEFAULT nextval('iniciar.tbl_miembros_posiciones_id_seq'::regclass);
 J   ALTER TABLE iniciar.tbl_miembros_posiciones ALTER COLUMN id DROP DEFAULT;
       iniciar          postgres    false    281    280            ?           2604    68770    tbl_mis_cursos id    DEFAULT     x   ALTER TABLE ONLY iniciar.tbl_mis_cursos ALTER COLUMN id SET DEFAULT nextval('iniciar.tbl_mis_cursos_id_seq'::regclass);
 A   ALTER TABLE iniciar.tbl_mis_cursos ALTER COLUMN id DROP DEFAULT;
       iniciar          postgres    false    311    310    311            ?           2604    68583    tbl_paises id    DEFAULT     p   ALTER TABLE ONLY iniciar.tbl_paises ALTER COLUMN id SET DEFAULT nextval('iniciar.tbl_paises_id_seq'::regclass);
 =   ALTER TABLE iniciar.tbl_paises ALTER COLUMN id DROP DEFAULT;
       iniciar          crduser    false    288    286            ?           2604    68584    tbl_tipo_informacion id    DEFAULT     ?   ALTER TABLE ONLY iniciar.tbl_tipo_informacion ALTER COLUMN id SET DEFAULT nextval('iniciar.tbl_tipo_informacion_id_seq'::regclass);
 G   ALTER TABLE iniciar.tbl_tipo_informacion ALTER COLUMN id DROP DEFAULT;
       iniciar          crduser    false    297    296            ?           2604    68585    tbl_tipodivision id    DEFAULT     |   ALTER TABLE ONLY iniciar.tbl_tipodivision ALTER COLUMN id SET DEFAULT nextval('iniciar.tbl_tipodivision_id_seq'::regclass);
 C   ALTER TABLE iniciar.tbl_tipodivision ALTER COLUMN id DROP DEFAULT;
       iniciar          crduser    false    299    298            ?           2604    68586    tbl_tipos_de_miembros id    DEFAULT     ?   ALTER TABLE ONLY iniciar.tbl_tipos_de_miembros ALTER COLUMN id SET DEFAULT nextval('iniciar.tbl_tipos_de_miembros_id_seq'::regclass);
 H   ALTER TABLE iniciar.tbl_tipos_de_miembros ALTER COLUMN id DROP DEFAULT;
       iniciar          crduser    false    301    300            ?           2604    67476    tbl_paises id    DEFAULT     n   ALTER TABLE ONLY public.tbl_paises ALTER COLUMN id SET DEFAULT nextval('public.tbl_paises_id_seq'::regclass);
 <   ALTER TABLE public.tbl_paises ALTER COLUMN id DROP DEFAULT;
       public          crduser    false    261    260            f           2604    66932    tb_tipos_actividades id    DEFAULT     y   ALTER TABLE ONLY siv.tb_tipos_actividades ALTER COLUMN id SET DEFAULT nextval('siv.tipos_actividades_id_seq'::regclass);
 C   ALTER TABLE siv.tb_tipos_actividades ALTER COLUMN id DROP DEFAULT;
       siv          postgres    false    258    214            h           2604    66933    tbl_actividades id    DEFAULT     r   ALTER TABLE ONLY siv.tbl_actividades ALTER COLUMN id SET DEFAULT nextval('siv.tbl_activicades_id_seq'::regclass);
 >   ALTER TABLE siv.tbl_actividades ALTER COLUMN id DROP DEFAULT;
       siv          postgres    false    216    215            l           2604    66934    tbl_areas_de_accion id    DEFAULT     z   ALTER TABLE ONLY siv.tbl_areas_de_accion ALTER COLUMN id SET DEFAULT nextval('siv.tbl_areas_de_accion_id_seq'::regclass);
 B   ALTER TABLE siv.tbl_areas_de_accion ALTER COLUMN id DROP DEFAULT;
       siv          postgres    false    220    219            m           2604    66935    tbl_capacitacion id    DEFAULT     t   ALTER TABLE ONLY siv.tbl_capacitacion ALTER COLUMN id SET DEFAULT nextval('siv.tbl_capacitacion_id_seq'::regclass);
 ?   ALTER TABLE siv.tbl_capacitacion ALTER COLUMN id DROP DEFAULT;
       siv          crduser    false    222    221            n           2604    66936 !   tbl_capacitaciones_voluntarios id    DEFAULT     ?   ALTER TABLE ONLY siv.tbl_capacitaciones_voluntarios ALTER COLUMN id SET DEFAULT nextval('siv.tbl_capacitaciones_voluntarios_id_seq'::regclass);
 M   ALTER TABLE siv.tbl_capacitaciones_voluntarios ALTER COLUMN id DROP DEFAULT;
       siv          crduser    false    224    223            o           2604    66937 &   tbl_detalle_capacitacion_voluntario id    DEFAULT     ?   ALTER TABLE ONLY siv.tbl_detalle_capacitacion_voluntario ALTER COLUMN id SET DEFAULT nextval('siv.tbl_detalle_capacitacion_voluntario_id_seq'::regclass);
 R   ALTER TABLE siv.tbl_detalle_capacitacion_voluntario ALTER COLUMN id DROP DEFAULT;
       siv          crduser    false    226    225            p           2604    66938    tbl_detalle_capacitaciones id    DEFAULT     ?   ALTER TABLE ONLY siv.tbl_detalle_capacitaciones ALTER COLUMN id SET DEFAULT nextval('siv.tbl_detalle_capacitaciones_id_seq'::regclass);
 I   ALTER TABLE siv.tbl_detalle_capacitaciones ALTER COLUMN id DROP DEFAULT;
       siv          crduser    false    228    227            q           2604    66939 "   tbl_detalle_examen_capacitacion id    DEFAULT     ?   ALTER TABLE ONLY siv.tbl_detalle_examen_capacitacion ALTER COLUMN id SET DEFAULT nextval('siv.tbl_detalle_examen_capacitacion_id_seq'::regclass);
 N   ALTER TABLE siv.tbl_detalle_examen_capacitacion ALTER COLUMN id DROP DEFAULT;
       siv          crduser    false    230    229            s           2604    66940    tbl_detalle_tipo_actividad id    DEFAULT     ?   ALTER TABLE ONLY siv.tbl_detalle_tipo_actividad ALTER COLUMN id SET DEFAULT nextval('siv.tbl_detalle_tipo_actividad_id_seq'::regclass);
 I   ALTER TABLE siv.tbl_detalle_tipo_actividad ALTER COLUMN id DROP DEFAULT;
       siv          postgres    false    232    231            t           2604    66941    tbl_division id    DEFAULT     l   ALTER TABLE ONLY siv.tbl_division ALTER COLUMN id SET DEFAULT nextval('siv.tbl_division_id_seq'::regclass);
 ;   ALTER TABLE siv.tbl_division ALTER COLUMN id DROP DEFAULT;
       siv          postgres    false    234    233            u           2604    66942    tbl_examen_capacitacion id    DEFAULT     ?   ALTER TABLE ONLY siv.tbl_examen_capacitacion ALTER COLUMN id SET DEFAULT nextval('siv.tbl_examen_capacitacion_id_seq'::regclass);
 F   ALTER TABLE siv.tbl_examen_capacitacion ALTER COLUMN id DROP DEFAULT;
       siv          crduser    false    236    235            d           2604    66943    tbl_hist_posiciones id    DEFAULT     q   ALTER TABLE ONLY siv.tbl_hist_posiciones ALTER COLUMN id SET DEFAULT nextval('siv.posiciones_id_seq'::regclass);
 B   ALTER TABLE siv.tbl_hist_posiciones ALTER COLUMN id DROP DEFAULT;
       siv          postgres    false    213    212            w           2604    66944    tbl_informacion_adicional id    DEFAULT     ?   ALTER TABLE ONLY siv.tbl_informacion_adicional ALTER COLUMN id SET DEFAULT nextval('siv.tbl_informacion_adicional_id_seq'::regclass);
 H   ALTER TABLE siv.tbl_informacion_adicional ALTER COLUMN id DROP DEFAULT;
       siv          postgres    false    238    237            x           2604    66945    tbl_pais id    DEFAULT     d   ALTER TABLE ONLY siv.tbl_pais ALTER COLUMN id SET DEFAULT nextval('siv.tbl_pais_id_seq'::regclass);
 7   ALTER TABLE siv.tbl_pais ALTER COLUMN id DROP DEFAULT;
       siv          postgres    false    240    239            }           2604    66946 "   tbl_resultado_examen_voluntario id    DEFAULT     ?   ALTER TABLE ONLY siv.tbl_resultado_examen_voluntario ALTER COLUMN id SET DEFAULT nextval('siv.tbl_resultado_examen_voluntario_id_seq'::regclass);
 N   ALTER TABLE siv.tbl_resultado_examen_voluntario ALTER COLUMN id DROP DEFAULT;
       siv          crduser    false    244    243            ?           2604    66947    tbl_tipo_division id    DEFAULT     v   ALTER TABLE ONLY siv.tbl_tipo_division ALTER COLUMN id SET DEFAULT nextval('siv.tbl_tipo_division_id_seq'::regclass);
 @   ALTER TABLE siv.tbl_tipo_division ALTER COLUMN id DROP DEFAULT;
       siv          postgres    false    248    247            ?           2604    66948    tbl_tipo_informacion id    DEFAULT     |   ALTER TABLE ONLY siv.tbl_tipo_informacion ALTER COLUMN id SET DEFAULT nextval('siv.tbl_tipo_informacion_id_seq'::regclass);
 C   ALTER TABLE siv.tbl_tipo_informacion ALTER COLUMN id DROP DEFAULT;
       siv          postgres    false    250    249            ?           2604    66949    tbl_tipos_documentos id    DEFAULT     |   ALTER TABLE ONLY siv.tbl_tipos_documentos ALTER COLUMN id SET DEFAULT nextval('siv.tbl_tipos_documentos_id_seq'::regclass);
 C   ALTER TABLE siv.tbl_tipos_documentos ALTER COLUMN id DROP DEFAULT;
       siv          postgres    false    252    251            ?           2604    66950    tbl_voluntarios id    DEFAULT     n   ALTER TABLE ONLY siv.tbl_voluntarios ALTER COLUMN id SET DEFAULT nextval('siv.voluntarios_id_seq'::regclass);
 >   ALTER TABLE siv.tbl_voluntarios ALTER COLUMN id DROP DEFAULT;
       siv          postgres    false    259    255            ?           2604    66951    tbl_voluntarios_actividades id    DEFAULT     ?   ALTER TABLE ONLY siv.tbl_voluntarios_actividades ALTER COLUMN id SET DEFAULT nextval('siv.tbl_voluntarios_actividades_id_seq'::regclass);
 J   ALTER TABLE siv.tbl_voluntarios_actividades ALTER COLUMN id DROP DEFAULT;
       siv          postgres    false    257    256                      0    68430     tbl_informacion_adicional 
   TABLE DATA           ?   COPY iniciar." tbl_informacion_adicional" (id, id_pais, id_miembro, id_tipo_informacion, valor, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    262   ?W                0    68436    tbl_area_de_accion 
   TABLE DATA           ?   COPY iniciar.tbl_area_de_accion (id, id_pais, id_area, id_sede, descripcion, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    264   ?W                0    68443 	   tbl_areas 
   TABLE DATA           ?   COPY iniciar.tbl_areas (id, id_pais, id_sede, nombre, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    267   X      	          0    68449 
   tbl_cursos 
   TABLE DATA           ?   COPY iniciar.tbl_cursos (id, id_pais, descripcion, duracion, tipo, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom, portada, nombre, idcolection, uuid) FROM stdin;
    iniciar          postgres    false    268   ?X                0    68456    tbl_det_roles 
   TABLE DATA           ?   COPY iniciar.tbl_det_roles (id, id_pais, id_roles, id_opcion, estado, agregado_por, agregado_en, modificado_por, modificado_en, leer, escribir, imprimir, eliminar, rol_agregado_id, rol_agregado_nom, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    271   ?Y                0    68462    tbl_detalle_de_cursos 
   TABLE DATA             COPY iniciar.tbl_detalle_de_cursos (id, id_curso, titulo, descripcion, tipo, url, id_formulario, portada, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom, uuid, estado, guid, duracion) FROM stdin;
    iniciar          postgres    false    272   HZ      6          0    68776    tbl_detalle_mis_cursos 
   TABLE DATA           ?   COPY iniciar.tbl_detalle_mis_cursos (id, id_mis_cursos, id_detalle, id_miembro, tiempo, estado, id_curso, titulo, descripcion, url, tipo, duracion) FROM stdin;
    iniciar          postgres    false    313   X[                0    68469    tbl_division 
   TABLE DATA           ?   COPY iniciar.tbl_division (id, id_pais, id_tipo_division, nombre, depende, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    275   ?[                0    68475    tbl_imagenes_miembros 
   TABLE DATA           ?   COPY iniciar.tbl_imagenes_miembros (id, id_miembro, id_pais, url, descripcion, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom, estado) FROM stdin;
    iniciar          postgres    false    276   c\                0    68482    tbl_miembros 
   TABLE DATA           ?  COPY iniciar.tbl_miembros (id, id_pais, id_sede, id_area, nombre, apellido, nacionalidad, lugar_de_nacimiento, fecha_de_nacimiento, id_tipo_documento, documento, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom, tiempo_voluntariado, email, fecha_de_registro, fecha_de_finalizacion, tipo_miembro, uuid) FROM stdin;
    iniciar          crduser    false    279   ?\                0    68488    tbl_miembros_posiciones 
   TABLE DATA           ?   COPY iniciar.tbl_miembros_posiciones (id, id_pais, id_miembro, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom, id_posicion) FROM stdin;
    iniciar          postgres    false    280   ;]      4          0    68767    tbl_mis_cursos 
   TABLE DATA             COPY iniciar.tbl_mis_cursos (id, id_miembro, id_curso, fecha_de_inicio, fecha_de_finalizacion, completado, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          postgres    false    311   X]                0    68493    tbl_modulos 
   TABLE DATA           H   COPY iniciar.tbl_modulos (id, id_pais, descripcion, estado) FROM stdin;
    iniciar          crduser    false    283   ?]                0    68498    tbl_opciones 
   TABLE DATA           ?   COPY iniciar.tbl_opciones (id, id_pais, descripcion, estado, agregado_por, agregado_en, modificado_por, modificado_en, rol_agregado_id, rol_agregado_nom, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    285   ?]                0    68504 
   tbl_paises 
   TABLE DATA           ?   COPY iniciar.tbl_paises (id, codigo, bandera, nombre, alpha2, alpha3, domains, habitantes, superficie, estado, ruta_bandera) FROM stdin;
    iniciar          crduser    false    286   }^                0    68512    tbl_posiciones 
   TABLE DATA             COPY iniciar.tbl_posiciones (id, id_pais, id_sede, id_area, id_rol, nombre, posiciones_disponible, depende, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    290   ?^      !          0    68518 	   tbl_roles 
   TABLE DATA           ?   COPY iniciar.tbl_roles (id, id_pais, id_modulo, descripcion, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    292   w_      #          0    68525 	   tbl_sedes 
   TABLE DATA           ?   COPY iniciar.tbl_sedes (id, id_pais, id_division, id_tipo_sede, nombre, voluntarios, depende, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    294   !`      %          0    68533    tbl_tipo_informacion 
   TABLE DATA           ?   COPY iniciar.tbl_tipo_informacion (id, id_pais, id_sede, descripcion, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    296   ?`      '          0    68539    tbl_tipodivision 
   TABLE DATA           ?   COPY iniciar.tbl_tipodivision (id, id_pais, nombre, depende, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    298   ?`      )          0    68545    tbl_tipos_de_miembros 
   TABLE DATA           c   COPY iniciar.tbl_tipos_de_miembros (id, id_pais, descripcion, estado, calcular_tiempo) FROM stdin;
    iniciar          crduser    false    300   Ta      ,          0    68550    tbl_tipos_documentos 
   TABLE DATA           ?   COPY iniciar.tbl_tipos_documentos (id, id_pais, descripcion, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    303   ?a      .          0    68557    tbl_tipos_sedes 
   TABLE DATA           ?   COPY iniciar.tbl_tipos_sedes (id, id_tipo_division, id_pais, nombre, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    305   'b      0          0    68564    tbl_transacciones_de_miembros 
   TABLE DATA           ?   COPY iniciar.tbl_transacciones_de_miembros (id, id_miembro, descripcion, valor_anterior, valor_actual, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    307   ?b      2          0    68571 	   tbl_users 
   TABLE DATA           t   COPY iniciar.tbl_users (id, id_pais, id_miembro, usuario, password, estado, agregado_en, modificado_en) FROM stdin;
    iniciar          crduser    false    309   ?b                0    67466 
   tbl_paises 
   TABLE DATA           ?   COPY public.tbl_paises (nombre, alpha2, alpha3, codigo, domains, habitantes, superficie, bandera, estado, ruta_bandera, id) FROM stdin;
    public          crduser    false    260   Dc      ?          0    66814    tb_tipos_actividades 
   TABLE DATA           ?   COPY siv.tb_tipos_actividades (id, id_pais, id_areas, descripcion, estado, agregado_por, agregado_en, modificado_por, modificado_en) FROM stdin;
    siv          postgres    false    214   ac      ?          0    66818    tbl_actividades 
   TABLE DATA           ?   COPY siv.tbl_actividades (id, id_pais, id_sede, id_voluntario_creador, fecha_de_actividad, descripcion, estado, agregado_por, agregado_en, modificado_por, modificado_en, direccion, geo, id_division) FROM stdin;
    siv          postgres    false    215   ~c      ?          0    66826 	   tbl_areas 
   TABLE DATA           ?   COPY siv.tbl_areas (id, id_pais, id_sede, nombre, estado, agregado_por, agragado_en, modificado_por, modificado_en) FROM stdin;
    siv          postgres    false    218   ?c      ?          0    66831    tbl_areas_de_accion 
   TABLE DATA           ?   COPY siv.tbl_areas_de_accion (id, id_pais, id_area, id_sede, descripcion, estado, agregado_por, agregado_en, modificado_por, modificado_en) FROM stdin;
    siv          postgres    false    219   ?c      ?          0    66836    tbl_capacitacion 
   TABLE DATA           +   COPY siv.tbl_capacitacion (id) FROM stdin;
    siv          crduser    false    221   ?c      ?          0    66840    tbl_capacitaciones_voluntarios 
   TABLE DATA           9   COPY siv.tbl_capacitaciones_voluntarios (id) FROM stdin;
    siv          crduser    false    223   ?c      ?          0    66844 #   tbl_detalle_capacitacion_voluntario 
   TABLE DATA           >   COPY siv.tbl_detalle_capacitacion_voluntario (id) FROM stdin;
    siv          crduser    false    225   d      ?          0    66848    tbl_detalle_capacitaciones 
   TABLE DATA           5   COPY siv.tbl_detalle_capacitaciones (id) FROM stdin;
    siv          crduser    false    227   ,d      ?          0    66852    tbl_detalle_examen_capacitacion 
   TABLE DATA           :   COPY siv.tbl_detalle_examen_capacitacion (id) FROM stdin;
    siv          crduser    false    229   Id      ?          0    66856    tbl_detalle_tipo_actividad 
   TABLE DATA           ?   COPY siv.tbl_detalle_tipo_actividad (id, id_pais, id_actividad, id_tipo_actividad, estado, agregado_por, agregado_en, modificado_por, modificado_en) FROM stdin;
    siv          postgres    false    231   fd      ?          0    66861    tbl_division 
   TABLE DATA           ?   COPY siv.tbl_division (id, id_tipo_division, nombre, depende, estado, agregado_por, agregado_en, modificado_por, modificado_en) FROM stdin;
    siv          postgres    false    233   ?d      ?          0    66865    tbl_examen_capacitacion 
   TABLE DATA           2   COPY siv.tbl_examen_capacitacion (id) FROM stdin;
    siv          crduser    false    235   ?d      ?          0    66809    tbl_hist_posiciones 
   TABLE DATA           ?   COPY siv.tbl_hist_posiciones (id, id_posicion, id_voluntario, fecha_inicio, fecha_finalizacion, estado, agregado_por, agregado_en, modificado_por, modificado_en) FROM stdin;
    siv          postgres    false    212   ?d      ?          0    66869    tbl_informacion_adicional 
   TABLE DATA           ?   COPY siv.tbl_informacion_adicional (id, id_pais, id_voluntario, id_sede, "id_tipo_información", valor, estado, agregado_por, agregado_en, modificado_por, modificado_en) FROM stdin;
    siv          postgres    false    237   ?d      ?          0    66874    tbl_pais 
   TABLE DATA           ?   COPY siv.tbl_pais (id, nombre, alpha2, alpha3, codigo, domains, habitantes, superficie, bandera, estado, agregado_por, agregado_en, modificado_por, modificado_en) FROM stdin;
    siv          postgres    false    239   ?d      ?          0    66881    tbl_posiciones 
   TABLE DATA           ?   COPY siv.tbl_posiciones (id, id_pais, id_area, nombre, posiciones_disponible, depende, estados, agregado_por, agregado_en, modificado_por, modificado_en) FROM stdin;
    siv          postgres    false    242   e      ?          0    66888    tbl_resultado_examen_voluntario 
   TABLE DATA           :   COPY siv.tbl_resultado_examen_voluntario (id) FROM stdin;
    siv          crduser    false    243   1e      ?          0    66893 	   tbl_sedes 
   TABLE DATA           ?   COPY siv.tbl_sedes (id, id_tipo_sede, id_division, nombre, voluntarios, depende, estado, agregado_por, agregado_en, modificado_por, modificado_en) FROM stdin;
    siv          postgres    false    246   Ne      ?          0    66900    tbl_tipo_division 
   TABLE DATA           ?   COPY siv.tbl_tipo_division (id, id_pais, nombre, depende, estado, agregado_por, agregado_en, modificado_por, modificado_en) FROM stdin;
    siv          postgres    false    247   ke      ?          0    66904    tbl_tipo_informacion 
   TABLE DATA           ?   COPY siv.tbl_tipo_informacion (id, id_pais, id_sede, descripcion, estado, agregado_por, agregado_en, modificado_por, modificado_en) FROM stdin;
    siv          postgres    false    249   ?e      ?          0    66909    tbl_tipos_documentos 
   TABLE DATA           ?   COPY siv.tbl_tipos_documentos (id, id_pais, descripcion, estado, agregado_por, agregado_en, modificado_por, modificado_en) FROM stdin;
    siv          postgres    false    251   ?e      ?          0    66915    tbl_tipos_sedes 
   TABLE DATA           ?   COPY siv.tbl_tipos_sedes (id, id_tipo_division, nombre, estado, agregado_por, agregado_en, modificado_por, modificado_en, depende) FROM stdin;
    siv          postgres    false    254   ?e      ?          0    66920    tbl_voluntarios 
   TABLE DATA           ,  COPY siv.tbl_voluntarios (id, id_pais, id_posicion, id_area, id_sede, nombre, apellidos, nombre_completo, nacionalidad, lugar_de_nacimiento, fecha_de_nacimiento, id_tipo_documento, documento, estado, agregado_por, agregado_en, modificado_por, modificado_en, tiempo_voluntariado, depende) FROM stdin;
    siv          postgres    false    255   ?e      ?          0    66926    tbl_voluntarios_actividades 
   TABLE DATA           ?   COPY siv.tbl_voluntarios_actividades (id, id_pais, id_actividad, id_voluntario, tiempo, estado, comentario, agregado_por, agregado_en, modificado_por, modificado_en) FROM stdin;
    siv          postgres    false    256   ?e      ?           0    0 !    tbl_informacion_adicional_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('iniciar." tbl_informacion_adicional_id_seq"', 1, false);
          iniciar          crduser    false    263            ?           0    0    tbl_area_de_accion_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('iniciar.tbl_area_de_accion_id_seq', 1, false);
          iniciar          crduser    false    265            ?           0    0    tbl_areas_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('iniciar.tbl_areas_id_seq', 1, true);
          iniciar          crduser    false    266            ?           0    0    tbl_cursos_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('iniciar.tbl_cursos_id_seq', 12, true);
          iniciar          postgres    false    269            ?           0    0    tbl_det_roles_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('iniciar.tbl_det_roles_id_seq', 2, true);
          iniciar          neoalex    false    270            ?           0    0    tbl_detalle_de_cursos_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('iniciar.tbl_detalle_de_cursos_id_seq', 2, true);
          iniciar          postgres    false    273            ?           0    0    tbl_detalle_mis_cursos_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('iniciar.tbl_detalle_mis_cursos_id_seq', 3, true);
          iniciar          postgres    false    312            ?           0    0    tbl_division_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('iniciar.tbl_division_id_seq', 1, true);
          iniciar          crduser    false    274            ?           0    0    tbl_imagenes_miembros_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('iniciar.tbl_imagenes_miembros_id_seq', 1, false);
          iniciar          postgres    false    277            ?           0    0    tbl_miembros_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('iniciar.tbl_miembros_id_seq', 29, true);
          iniciar          postgres    false    278            ?           0    0    tbl_miembros_posiciones_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('iniciar.tbl_miembros_posiciones_id_seq', 1, false);
          iniciar          postgres    false    281            ?           0    0    tbl_mis_cursos_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('iniciar.tbl_mis_cursos_id_seq', 7, true);
          iniciar          postgres    false    310            ?           0    0    tbl_modulos_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('iniciar.tbl_modulos_id_seq', 1, false);
          iniciar          neoalex    false    282            ?           0    0    tbl_opciones_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('iniciar.tbl_opciones_id_seq', 1, true);
          iniciar          neoalex    false    284            ?           0    0    tbl_pais_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('iniciar.tbl_pais_id_seq', 1, false);
          iniciar          crduser    false    287            ?           0    0    tbl_paises_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('iniciar.tbl_paises_id_seq', 1, true);
          iniciar          crduser    false    288            ?           0    0    tbl_posiciones_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('iniciar.tbl_posiciones_id_seq', 1, true);
          iniciar          postgres    false    289            ?           0    0    tbl_roles_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('iniciar.tbl_roles_id_seq', 5, true);
          iniciar          neoalex    false    291            ?           0    0    tbl_sedes_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('iniciar.tbl_sedes_id_seq', 1, true);
          iniciar          crduser    false    293            ?           0    0    tbl_tipo_division_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('iniciar.tbl_tipo_division_id_seq', 1, false);
          iniciar          crduser    false    295            ?           0    0    tbl_tipo_informacion_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('iniciar.tbl_tipo_informacion_id_seq', 1, false);
          iniciar          crduser    false    297            ?           0    0    tbl_tipodivision_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('iniciar.tbl_tipodivision_id_seq', 7, true);
          iniciar          crduser    false    299            ?           0    0    tbl_tipos_de_miembros_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('iniciar.tbl_tipos_de_miembros_id_seq', 4, true);
          iniciar          crduser    false    301            ?           0    0    tbl_tipos_documentos_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('iniciar.tbl_tipos_documentos_id_seq', 2, true);
          iniciar          postgres    false    302            ?           0    0    tbl_tipos_sedes_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('iniciar.tbl_tipos_sedes_id_seq', 3, true);
          iniciar          crduser    false    304            ?           0    0 $   tbl_transacciones_de_miembros_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('iniciar.tbl_transacciones_de_miembros_id_seq', 1, true);
          iniciar          crduser    false    306            ?           0    0    tbl_users_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('iniciar.tbl_users_id_seq', 38, true);
          iniciar          neoalex    false    308            ?           0    0    tbl_paises_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.tbl_paises_id_seq', 1, false);
          public          crduser    false    261            ?           0    0    posiciones_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('siv.posiciones_id_seq', 1, false);
          siv          postgres    false    213            ?           0    0    tbl_activicades_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('siv.tbl_activicades_id_seq', 1, false);
          siv          postgres    false    216            ?           0    0    tbl_areas_de_accion_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('siv.tbl_areas_de_accion_id_seq', 1, false);
          siv          postgres    false    220            ?           0    0    tbl_areas_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('siv.tbl_areas_id_seq', 1, false);
          siv          postgres    false    217            ?           0    0    tbl_capacitacion_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('siv.tbl_capacitacion_id_seq', 1, false);
          siv          crduser    false    222            ?           0    0 %   tbl_capacitaciones_voluntarios_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('siv.tbl_capacitaciones_voluntarios_id_seq', 1, false);
          siv          crduser    false    224            ?           0    0 *   tbl_detalle_capacitacion_voluntario_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('siv.tbl_detalle_capacitacion_voluntario_id_seq', 1, false);
          siv          crduser    false    226            ?           0    0 !   tbl_detalle_capacitaciones_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('siv.tbl_detalle_capacitaciones_id_seq', 1, false);
          siv          crduser    false    228            ?           0    0 &   tbl_detalle_examen_capacitacion_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('siv.tbl_detalle_examen_capacitacion_id_seq', 1, false);
          siv          crduser    false    230            ?           0    0 !   tbl_detalle_tipo_actividad_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('siv.tbl_detalle_tipo_actividad_id_seq', 1, false);
          siv          postgres    false    232            ?           0    0    tbl_division_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('siv.tbl_division_id_seq', 1, false);
          siv          postgres    false    234            ?           0    0    tbl_examen_capacitacion_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('siv.tbl_examen_capacitacion_id_seq', 1, false);
          siv          crduser    false    236            ?           0    0     tbl_informacion_adicional_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('siv.tbl_informacion_adicional_id_seq', 1, false);
          siv          postgres    false    238            ?           0    0    tbl_pais_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('siv.tbl_pais_id_seq', 1, false);
          siv          postgres    false    240            ?           0    0 &   tbl_resultado_examen_voluntario_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('siv.tbl_resultado_examen_voluntario_id_seq', 1, false);
          siv          crduser    false    244            ?           0    0    tbl_sedes_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('siv.tbl_sedes_id_seq', 1, false);
          siv          postgres    false    245            ?           0    0    tbl_tipo_division_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('siv.tbl_tipo_division_id_seq', 1, false);
          siv          postgres    false    248            ?           0    0    tbl_tipo_informacion_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('siv.tbl_tipo_informacion_id_seq', 1, false);
          siv          postgres    false    250            ?           0    0    tbl_tipos_de_posiciones_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('siv.tbl_tipos_de_posiciones_id_seq', 1, false);
          siv          postgres    false    241            ?           0    0    tbl_tipos_documentos_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('siv.tbl_tipos_documentos_id_seq', 1, false);
          siv          postgres    false    252            ?           0    0    tbl_tipos_sedes_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('siv.tbl_tipos_sedes_id_seq', 1, false);
          siv          postgres    false    253            ?           0    0 "   tbl_voluntarios_actividades_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('siv.tbl_voluntarios_actividades_id_seq', 1, false);
          siv          postgres    false    257            ?           0    0    tipos_actividades_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('siv.tipos_actividades_id_seq', 1, false);
          siv          postgres    false    258            ?           0    0    voluntarios_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('siv.voluntarios_id_seq', 1, false);
          siv          postgres    false    259            ?           2606    68588 :    tbl_informacion_adicional  tbl_informacion_adicional_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY iniciar." tbl_informacion_adicional"
    ADD CONSTRAINT " tbl_informacion_adicional_pkey" PRIMARY KEY (id);
 i   ALTER TABLE ONLY iniciar." tbl_informacion_adicional" DROP CONSTRAINT " tbl_informacion_adicional_pkey";
       iniciar            crduser    false    262                       2606    68590 /   tbl_tipodivision PK_27eed919f4ed4d1fa2bd15e4405 
   CONSTRAINT     p   ALTER TABLE ONLY iniciar.tbl_tipodivision
    ADD CONSTRAINT "PK_27eed919f4ed4d1fa2bd15e4405" PRIMARY KEY (id);
 \   ALTER TABLE ONLY iniciar.tbl_tipodivision DROP CONSTRAINT "PK_27eed919f4ed4d1fa2bd15e4405";
       iniciar            crduser    false    298            ?           2606    68735    tbl_cursos Uq_Cursosnombre 
   CONSTRAINT     Z   ALTER TABLE ONLY iniciar.tbl_cursos
    ADD CONSTRAINT "Uq_Cursosnombre" UNIQUE (nombre);
 G   ALTER TABLE ONLY iniciar.tbl_cursos DROP CONSTRAINT "Uq_Cursosnombre";
       iniciar            postgres    false    268            ?           2606    68592    tbl_miembros pk_miembrocorreo 
   CONSTRAINT     Z   ALTER TABLE ONLY iniciar.tbl_miembros
    ADD CONSTRAINT pk_miembrocorreo UNIQUE (email);
 H   ALTER TABLE ONLY iniciar.tbl_miembros DROP CONSTRAINT pk_miembrocorreo;
       iniciar            crduser    false    279            ?           2606    68594 $   tbl_miembros pk_miembrodocumentotipo 
   CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_miembros
    ADD CONSTRAINT pk_miembrodocumentotipo UNIQUE (documento) INCLUDE (id_tipo_documento);
 O   ALTER TABLE ONLY iniciar.tbl_miembros DROP CONSTRAINT pk_miembrodocumentotipo;
       iniciar            crduser    false    279    279            ?           2606    68596 *   tbl_area_de_accion tbl_area_de_accion_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY iniciar.tbl_area_de_accion
    ADD CONSTRAINT tbl_area_de_accion_pkey PRIMARY KEY (id);
 U   ALTER TABLE ONLY iniciar.tbl_area_de_accion DROP CONSTRAINT tbl_area_de_accion_pkey;
       iniciar            crduser    false    264            ?           2606    68598    tbl_areas tbl_areas_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY iniciar.tbl_areas
    ADD CONSTRAINT tbl_areas_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY iniciar.tbl_areas DROP CONSTRAINT tbl_areas_pkey;
       iniciar            crduser    false    267            ?           2606    68600    tbl_cursos tbl_cursos_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY iniciar.tbl_cursos
    ADD CONSTRAINT tbl_cursos_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY iniciar.tbl_cursos DROP CONSTRAINT tbl_cursos_pkey;
       iniciar            postgres    false    268            ?           2606    68602     tbl_det_roles tbl_det_roles_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY iniciar.tbl_det_roles
    ADD CONSTRAINT tbl_det_roles_pkey PRIMARY KEY (id);
 K   ALTER TABLE ONLY iniciar.tbl_det_roles DROP CONSTRAINT tbl_det_roles_pkey;
       iniciar            crduser    false    271            ?           2606    68604 0   tbl_detalle_de_cursos tbl_detalle_de_cursos_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY iniciar.tbl_detalle_de_cursos
    ADD CONSTRAINT tbl_detalle_de_cursos_pkey PRIMARY KEY (id);
 [   ALTER TABLE ONLY iniciar.tbl_detalle_de_cursos DROP CONSTRAINT tbl_detalle_de_cursos_pkey;
       iniciar            postgres    false    272                       2606    68781 2   tbl_detalle_mis_cursos tbl_detalle_mis_cursos_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY iniciar.tbl_detalle_mis_cursos
    ADD CONSTRAINT tbl_detalle_mis_cursos_pkey PRIMARY KEY (id);
 ]   ALTER TABLE ONLY iniciar.tbl_detalle_mis_cursos DROP CONSTRAINT tbl_detalle_mis_cursos_pkey;
       iniciar            postgres    false    313            ?           2606    68606    tbl_division tbl_division_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY iniciar.tbl_division
    ADD CONSTRAINT tbl_division_pkey PRIMARY KEY (id);
 I   ALTER TABLE ONLY iniciar.tbl_division DROP CONSTRAINT tbl_division_pkey;
       iniciar            crduser    false    275            ?           2606    68608 0   tbl_imagenes_miembros tbl_imagenes_miembros_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY iniciar.tbl_imagenes_miembros
    ADD CONSTRAINT tbl_imagenes_miembros_pkey PRIMARY KEY (id);
 [   ALTER TABLE ONLY iniciar.tbl_imagenes_miembros DROP CONSTRAINT tbl_imagenes_miembros_pkey;
       iniciar            postgres    false    276            ?           2606    68610    tbl_miembros tbl_miembros_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY iniciar.tbl_miembros
    ADD CONSTRAINT tbl_miembros_pkey PRIMARY KEY (id);
 I   ALTER TABLE ONLY iniciar.tbl_miembros DROP CONSTRAINT tbl_miembros_pkey;
       iniciar            crduser    false    279            ?           2606    68612 4   tbl_miembros_posiciones tbl_miembros_posiciones_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY iniciar.tbl_miembros_posiciones
    ADD CONSTRAINT tbl_miembros_posiciones_pkey PRIMARY KEY (id);
 _   ALTER TABLE ONLY iniciar.tbl_miembros_posiciones DROP CONSTRAINT tbl_miembros_posiciones_pkey;
       iniciar            postgres    false    280                       2606    68772 "   tbl_mis_cursos tbl_mis_cursos_pkey 
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
       iniciar            crduser    false    292                       2606    68624    tbl_sedes tbl_sedes_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY iniciar.tbl_sedes
    ADD CONSTRAINT tbl_sedes_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY iniciar.tbl_sedes DROP CONSTRAINT tbl_sedes_pkey;
       iniciar            crduser    false    294                       2606    68626 .   tbl_tipo_informacion tbl_tipo_informacion_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY iniciar.tbl_tipo_informacion
    ADD CONSTRAINT tbl_tipo_informacion_pkey PRIMARY KEY (id);
 Y   ALTER TABLE ONLY iniciar.tbl_tipo_informacion DROP CONSTRAINT tbl_tipo_informacion_pkey;
       iniciar            crduser    false    296                       2606    68628 0   tbl_tipos_de_miembros tbl_tipos_de_miembros_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY iniciar.tbl_tipos_de_miembros
    ADD CONSTRAINT tbl_tipos_de_miembros_pkey PRIMARY KEY (id);
 [   ALTER TABLE ONLY iniciar.tbl_tipos_de_miembros DROP CONSTRAINT tbl_tipos_de_miembros_pkey;
       iniciar            crduser    false    300            	           2606    68630 .   tbl_tipos_documentos tbl_tipos_documentos_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY iniciar.tbl_tipos_documentos
    ADD CONSTRAINT tbl_tipos_documentos_pkey PRIMARY KEY (id);
 Y   ALTER TABLE ONLY iniciar.tbl_tipos_documentos DROP CONSTRAINT tbl_tipos_documentos_pkey;
       iniciar            crduser    false    303                       2606    68632 $   tbl_tipos_sedes tbl_tipos_sedes_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY iniciar.tbl_tipos_sedes
    ADD CONSTRAINT tbl_tipos_sedes_pkey PRIMARY KEY (id);
 O   ALTER TABLE ONLY iniciar.tbl_tipos_sedes DROP CONSTRAINT tbl_tipos_sedes_pkey;
       iniciar            crduser    false    305                       2606    68634 @   tbl_transacciones_de_miembros tbl_transacciones_de_miembros_pkey 
   CONSTRAINT        ALTER TABLE ONLY iniciar.tbl_transacciones_de_miembros
    ADD CONSTRAINT tbl_transacciones_de_miembros_pkey PRIMARY KEY (id);
 k   ALTER TABLE ONLY iniciar.tbl_transacciones_de_miembros DROP CONSTRAINT tbl_transacciones_de_miembros_pkey;
       iniciar            crduser    false    307                       2606    68636    tbl_users tbl_users_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY iniciar.tbl_users
    ADD CONSTRAINT tbl_users_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY iniciar.tbl_users DROP CONSTRAINT tbl_users_pkey;
       iniciar            crduser    false    309                       2606    68638    tbl_users tbl_users_usuario_key 
   CONSTRAINT     ^   ALTER TABLE ONLY iniciar.tbl_users
    ADD CONSTRAINT tbl_users_usuario_key UNIQUE (usuario);
 J   ALTER TABLE ONLY iniciar.tbl_users DROP CONSTRAINT tbl_users_usuario_key;
       iniciar            crduser    false    309            ?           2606    67474 )   tbl_paises PK_84b75cf73c5a20713c73a1c9dc6 
   CONSTRAINT     i   ALTER TABLE ONLY public.tbl_paises
    ADD CONSTRAINT "PK_84b75cf73c5a20713c73a1c9dc6" PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.tbl_paises DROP CONSTRAINT "PK_84b75cf73c5a20713c73a1c9dc6";
       public            crduser    false    260            ?           2606    66963    tbl_division pk_division 
   CONSTRAINT     S   ALTER TABLE ONLY siv.tbl_division
    ADD CONSTRAINT pk_division PRIMARY KEY (id);
 ?   ALTER TABLE ONLY siv.tbl_division DROP CONSTRAINT pk_division;
       siv            postgres    false    233            ?           2606    66965 #   tbl_hist_posiciones posiciones_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY siv.tbl_hist_posiciones
    ADD CONSTRAINT posiciones_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY siv.tbl_hist_posiciones DROP CONSTRAINT posiciones_pkey;
       siv            postgres    false    212            ?           2606    66967 $   tbl_actividades tbl_activicades_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY siv.tbl_actividades
    ADD CONSTRAINT tbl_activicades_pkey PRIMARY KEY (id);
 K   ALTER TABLE ONLY siv.tbl_actividades DROP CONSTRAINT tbl_activicades_pkey;
       siv            postgres    false    215            ?           2606    66969 ,   tbl_areas_de_accion tbl_areas_de_accion_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY siv.tbl_areas_de_accion
    ADD CONSTRAINT tbl_areas_de_accion_pkey PRIMARY KEY (id);
 S   ALTER TABLE ONLY siv.tbl_areas_de_accion DROP CONSTRAINT tbl_areas_de_accion_pkey;
       siv            postgres    false    219            ?           2606    66971    tbl_areas tbl_areas_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY siv.tbl_areas
    ADD CONSTRAINT tbl_areas_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY siv.tbl_areas DROP CONSTRAINT tbl_areas_pkey;
       siv            postgres    false    218            ?           2606    66973 &   tbl_capacitacion tbl_capacitacion_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY siv.tbl_capacitacion
    ADD CONSTRAINT tbl_capacitacion_pkey PRIMARY KEY (id);
 M   ALTER TABLE ONLY siv.tbl_capacitacion DROP CONSTRAINT tbl_capacitacion_pkey;
       siv            crduser    false    221            ?           2606    66975 B   tbl_capacitaciones_voluntarios tbl_capacitaciones_voluntarios_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY siv.tbl_capacitaciones_voluntarios
    ADD CONSTRAINT tbl_capacitaciones_voluntarios_pkey PRIMARY KEY (id);
 i   ALTER TABLE ONLY siv.tbl_capacitaciones_voluntarios DROP CONSTRAINT tbl_capacitaciones_voluntarios_pkey;
       siv            crduser    false    223            ?           2606    66977 L   tbl_detalle_capacitacion_voluntario tbl_detalle_capacitacion_voluntario_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY siv.tbl_detalle_capacitacion_voluntario
    ADD CONSTRAINT tbl_detalle_capacitacion_voluntario_pkey PRIMARY KEY (id);
 s   ALTER TABLE ONLY siv.tbl_detalle_capacitacion_voluntario DROP CONSTRAINT tbl_detalle_capacitacion_voluntario_pkey;
       siv            crduser    false    225            ?           2606    66979 :   tbl_detalle_capacitaciones tbl_detalle_capacitaciones_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY siv.tbl_detalle_capacitaciones
    ADD CONSTRAINT tbl_detalle_capacitaciones_pkey PRIMARY KEY (id);
 a   ALTER TABLE ONLY siv.tbl_detalle_capacitaciones DROP CONSTRAINT tbl_detalle_capacitaciones_pkey;
       siv            crduser    false    227            ?           2606    66981 D   tbl_detalle_examen_capacitacion tbl_detalle_examen_capacitacion_pkey 
   CONSTRAINT        ALTER TABLE ONLY siv.tbl_detalle_examen_capacitacion
    ADD CONSTRAINT tbl_detalle_examen_capacitacion_pkey PRIMARY KEY (id);
 k   ALTER TABLE ONLY siv.tbl_detalle_examen_capacitacion DROP CONSTRAINT tbl_detalle_examen_capacitacion_pkey;
       siv            crduser    false    229            ?           2606    66983 :   tbl_detalle_tipo_actividad tbl_detalle_tipo_actividad_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY siv.tbl_detalle_tipo_actividad
    ADD CONSTRAINT tbl_detalle_tipo_actividad_pkey PRIMARY KEY (id);
 a   ALTER TABLE ONLY siv.tbl_detalle_tipo_actividad DROP CONSTRAINT tbl_detalle_tipo_actividad_pkey;
       siv            postgres    false    231            ?           2606    66985 4   tbl_examen_capacitacion tbl_examen_capacitacion_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY siv.tbl_examen_capacitacion
    ADD CONSTRAINT tbl_examen_capacitacion_pkey PRIMARY KEY (id);
 [   ALTER TABLE ONLY siv.tbl_examen_capacitacion DROP CONSTRAINT tbl_examen_capacitacion_pkey;
       siv            crduser    false    235            ?           2606    66987 8   tbl_informacion_adicional tbl_informacion_adicional_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY siv.tbl_informacion_adicional
    ADD CONSTRAINT tbl_informacion_adicional_pkey PRIMARY KEY (id);
 _   ALTER TABLE ONLY siv.tbl_informacion_adicional DROP CONSTRAINT tbl_informacion_adicional_pkey;
       siv            postgres    false    237            ?           2606    66989    tbl_pais tbl_pais_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY siv.tbl_pais
    ADD CONSTRAINT tbl_pais_pkey PRIMARY KEY (id);
 =   ALTER TABLE ONLY siv.tbl_pais DROP CONSTRAINT tbl_pais_pkey;
       siv            postgres    false    239            ?           2606    66991 D   tbl_resultado_examen_voluntario tbl_resultado_examen_voluntario_pkey 
   CONSTRAINT        ALTER TABLE ONLY siv.tbl_resultado_examen_voluntario
    ADD CONSTRAINT tbl_resultado_examen_voluntario_pkey PRIMARY KEY (id);
 k   ALTER TABLE ONLY siv.tbl_resultado_examen_voluntario DROP CONSTRAINT tbl_resultado_examen_voluntario_pkey;
       siv            crduser    false    243            ?           2606    66993    tbl_sedes tbl_sedes_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY siv.tbl_sedes
    ADD CONSTRAINT tbl_sedes_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY siv.tbl_sedes DROP CONSTRAINT tbl_sedes_pkey;
       siv            postgres    false    246            ?           2606    66995 (   tbl_tipo_division tbl_tipo_division_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY siv.tbl_tipo_division
    ADD CONSTRAINT tbl_tipo_division_pkey PRIMARY KEY (id);
 O   ALTER TABLE ONLY siv.tbl_tipo_division DROP CONSTRAINT tbl_tipo_division_pkey;
       siv            postgres    false    247            ?           2606    66997 .   tbl_tipo_informacion tbl_tipo_informacion_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY siv.tbl_tipo_informacion
    ADD CONSTRAINT tbl_tipo_informacion_pkey PRIMARY KEY (id);
 U   ALTER TABLE ONLY siv.tbl_tipo_informacion DROP CONSTRAINT tbl_tipo_informacion_pkey;
       siv            postgres    false    249            ?           2606    66999 +   tbl_posiciones tbl_tipos_de_posiciones_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY siv.tbl_posiciones
    ADD CONSTRAINT tbl_tipos_de_posiciones_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY siv.tbl_posiciones DROP CONSTRAINT tbl_tipos_de_posiciones_pkey;
       siv            postgres    false    242            ?           2606    67001 .   tbl_tipos_documentos tbl_tipos_documentos_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY siv.tbl_tipos_documentos
    ADD CONSTRAINT tbl_tipos_documentos_pkey PRIMARY KEY (id);
 U   ALTER TABLE ONLY siv.tbl_tipos_documentos DROP CONSTRAINT tbl_tipos_documentos_pkey;
       siv            postgres    false    251            ?           2606    67003 $   tbl_tipos_sedes tbl_tipos_sedes_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY siv.tbl_tipos_sedes
    ADD CONSTRAINT tbl_tipos_sedes_pkey PRIMARY KEY (id);
 K   ALTER TABLE ONLY siv.tbl_tipos_sedes DROP CONSTRAINT tbl_tipos_sedes_pkey;
       siv            postgres    false    254            ?           2606    67005 <   tbl_voluntarios_actividades tbl_voluntarios_actividades_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY siv.tbl_voluntarios_actividades
    ADD CONSTRAINT tbl_voluntarios_actividades_pkey PRIMARY KEY (id);
 c   ALTER TABLE ONLY siv.tbl_voluntarios_actividades DROP CONSTRAINT tbl_voluntarios_actividades_pkey;
       siv            postgres    false    256            ?           2606    67007 +   tb_tipos_actividades tipos_actividades_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY siv.tb_tipos_actividades
    ADD CONSTRAINT tipos_actividades_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY siv.tb_tipos_actividades DROP CONSTRAINT tipos_actividades_pkey;
       siv            postgres    false    214            ?           2606    67009    tbl_pais uq_pais 
   CONSTRAINT     J   ALTER TABLE ONLY siv.tbl_pais
    ADD CONSTRAINT uq_pais UNIQUE (nombre);
 7   ALTER TABLE ONLY siv.tbl_pais DROP CONSTRAINT uq_pais;
       siv            postgres    false    239            ?           2606    67011     tbl_voluntarios voluntarios_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY siv.tbl_voluntarios
    ADD CONSTRAINT voluntarios_pkey PRIMARY KEY (id);
 G   ALTER TABLE ONLY siv.tbl_voluntarios DROP CONSTRAINT voluntarios_pkey;
       siv            postgres    false    255            D           2620    68639    tbl_miembros tr_miembro    TRIGGER     ?   CREATE TRIGGER tr_miembro BEFORE UPDATE ON iniciar.tbl_miembros FOR EACH ROW EXECUTE FUNCTION iniciar.spt_movimiento_miembros();
 1   DROP TRIGGER tr_miembro ON iniciar.tbl_miembros;
       iniciar          crduser    false    279    316            E           2620    68794     tbl_mis_cursos trigger_miscursos    TRIGGER     ?   CREATE TRIGGER trigger_miscursos AFTER INSERT ON iniciar.tbl_mis_cursos FOR EACH ROW EXECUTE FUNCTION iniciar.insertadetallemiscursos();
 :   DROP TRIGGER trigger_miscursos ON iniciar.tbl_mis_cursos;
       iniciar          postgres    false    315    311            6           2606    68640 !   tbl_area_de_accion FK_accion_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_area_de_accion
    ADD CONSTRAINT "FK_accion_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 N   ALTER TABLE ONLY iniciar.tbl_area_de_accion DROP CONSTRAINT "FK_accion_pais";
       iniciar          crduser    false    286    264    3579            4           2606    68645 '    tbl_informacion_adicional FK_adic_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar." tbl_informacion_adicional"
    ADD CONSTRAINT "FK_adic_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 V   ALTER TABLE ONLY iniciar." tbl_informacion_adicional" DROP CONSTRAINT "FK_adic_pais";
       iniciar          crduser    false    3579    262    286            7           2606    68650    tbl_areas FK_area_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_areas
    ADD CONSTRAINT "FK_area_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 C   ALTER TABLE ONLY iniciar.tbl_areas DROP CONSTRAINT "FK_area_pais";
       iniciar          crduser    false    286    3579    267            ?           2606    68655    tbl_tipodivision FK_div_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_tipodivision
    ADD CONSTRAINT "FK_div_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 I   ALTER TABLE ONLY iniciar.tbl_tipodivision DROP CONSTRAINT "FK_div_pais";
       iniciar          crduser    false    286    3579    298            ;           2606    68660    tbl_miembros FK_miembro_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_miembros
    ADD CONSTRAINT "FK_miembro_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 I   ALTER TABLE ONLY iniciar.tbl_miembros DROP CONSTRAINT "FK_miembro_pais";
       iniciar          crduser    false    279    3579    286            <           2606    68665    tbl_posiciones FK_posicion_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_posiciones
    ADD CONSTRAINT "FK_posicion_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 L   ALTER TABLE ONLY iniciar.tbl_posiciones DROP CONSTRAINT "FK_posicion_pais";
       iniciar          crduser    false    3579    286    290            =           2606    68670    tbl_sedes FK_sede_paises    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_sedes
    ADD CONSTRAINT "FK_sede_paises" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 E   ALTER TABLE ONLY iniciar.tbl_sedes DROP CONSTRAINT "FK_sede_paises";
       iniciar          crduser    false    294    3579    286            >           2606    68675 )   tbl_tipo_informacion FK_tinformacion_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_tipo_informacion
    ADD CONSTRAINT "FK_tinformacion_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 V   ALTER TABLE ONLY iniciar.tbl_tipo_informacion DROP CONSTRAINT "FK_tinformacion_pais";
       iniciar          crduser    false    296    286    3579            B           2606    68680 !   tbl_tipos_sedes FK_tipo_sede_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_tipos_sedes
    ADD CONSTRAINT "FK_tipo_sede_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 N   ALTER TABLE ONLY iniciar.tbl_tipos_sedes DROP CONSTRAINT "FK_tipo_sede_pais";
       iniciar          crduser    false    305    286    3579            @           2606    68685 +   tbl_tipos_de_miembros FK_tiposmiembros_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_tipos_de_miembros
    ADD CONSTRAINT "FK_tiposmiembros_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 X   ALTER TABLE ONLY iniciar.tbl_tipos_de_miembros DROP CONSTRAINT "FK_tiposmiembros_pais";
       iniciar          crduser    false    300    286    3579            8           2606    68690    tbl_detalle_de_cursos Fk_Cursos    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_detalle_de_cursos
    ADD CONSTRAINT "Fk_Cursos" FOREIGN KEY (id_curso) REFERENCES iniciar.tbl_cursos(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 L   ALTER TABLE ONLY iniciar.tbl_detalle_de_cursos DROP CONSTRAINT "Fk_Cursos";
       iniciar          postgres    false    272    268    3557            5           2606    68695 '    tbl_informacion_adicional Fk_adic_tipo    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar." tbl_informacion_adicional"
    ADD CONSTRAINT "Fk_adic_tipo" FOREIGN KEY (id_tipo_informacion) REFERENCES iniciar.tbl_tipo_informacion(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 V   ALTER TABLE ONLY iniciar." tbl_informacion_adicional" DROP CONSTRAINT "Fk_adic_tipo";
       iniciar          crduser    false    262    296    3587            9           2606    68700    tbl_division Fk_division_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_division
    ADD CONSTRAINT "Fk_division_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 J   ALTER TABLE ONLY iniciar.tbl_division DROP CONSTRAINT "Fk_division_pais";
       iniciar          crduser    false    286    275    3579            C           2606    68705 )   tbl_transacciones_de_miembros Fk_miembros    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_transacciones_de_miembros
    ADD CONSTRAINT "Fk_miembros" FOREIGN KEY (id_miembro) REFERENCES iniciar.tbl_miembros(id);
 V   ALTER TABLE ONLY iniciar.tbl_transacciones_de_miembros DROP CONSTRAINT "Fk_miembros";
       iniciar          crduser    false    3571    307    279            A           2606    68710 +   tbl_tipos_documentos Fk_tipo_documento_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_tipos_documentos
    ADD CONSTRAINT "Fk_tipo_documento_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 X   ALTER TABLE ONLY iniciar.tbl_tipos_documentos DROP CONSTRAINT "Fk_tipo_documento_pais";
       iniciar          crduser    false    286    303    3579            :           2606    68715 /   tbl_division tbl_division_id_tipo_division_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_division
    ADD CONSTRAINT tbl_division_id_tipo_division_fkey FOREIGN KEY (id_tipo_division) REFERENCES iniciar.tbl_tipodivision(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 Z   ALTER TABLE ONLY iniciar.tbl_division DROP CONSTRAINT tbl_division_id_tipo_division_fkey;
       iniciar          crduser    false    275    298    3589            !           2606    67012 4   tbl_informacion_adicional FK_INFORMACION_VOLUNTARIOS    FK CONSTRAINT     ?   ALTER TABLE ONLY siv.tbl_informacion_adicional
    ADD CONSTRAINT "FK_INFORMACION_VOLUNTARIOS" FOREIGN KEY (id_voluntario) REFERENCES siv.tbl_voluntarios(id) NOT VALID;
 ]   ALTER TABLE ONLY siv.tbl_informacion_adicional DROP CONSTRAINT "FK_INFORMACION_VOLUNTARIOS";
       siv          postgres    false    237    255    3543            "           2606    67017 -   tbl_informacion_adicional FK_TIPO_INFORMACION    FK CONSTRAINT     ?   ALTER TABLE ONLY siv.tbl_informacion_adicional
    ADD CONSTRAINT "FK_TIPO_INFORMACION" FOREIGN KEY ("id_tipo_información") REFERENCES siv.tbl_tipo_informacion(id) NOT VALID;
 V   ALTER TABLE ONLY siv.tbl_informacion_adicional DROP CONSTRAINT "FK_TIPO_INFORMACION";
       siv          postgres    false    237    3537    249            (           2606    67022 !   tbl_tipo_informacion FK_TIPO_PAIS    FK CONSTRAINT     ?   ALTER TABLE ONLY siv.tbl_tipo_informacion
    ADD CONSTRAINT "FK_TIPO_PAIS" FOREIGN KEY (id_pais) REFERENCES siv.tbl_pais(id) NOT VALID;
 J   ALTER TABLE ONLY siv.tbl_tipo_informacion DROP CONSTRAINT "FK_TIPO_PAIS";
       siv          postgres    false    249    239    3525            )           2606    67027 !   tbl_tipo_informacion FK_TIPO_SEDE    FK CONSTRAINT     ?   ALTER TABLE ONLY siv.tbl_tipo_informacion
    ADD CONSTRAINT "FK_TIPO_SEDE" FOREIGN KEY (id_sede) REFERENCES siv.tbl_sedes(id) NOT VALID;
 J   ALTER TABLE ONLY siv.tbl_tipo_informacion DROP CONSTRAINT "FK_TIPO_SEDE";
       siv          postgres    false    246    249    3533            #           2606    67032    tbl_posiciones Fk_area_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY siv.tbl_posiciones
    ADD CONSTRAINT "Fk_area_pais" FOREIGN KEY (id_pais) REFERENCES siv.tbl_pais(id) NOT VALID;
 D   ALTER TABLE ONLY siv.tbl_posiciones DROP CONSTRAINT "Fk_area_pais";
       siv          postgres    false    3525    242    239            $           2606    67037 #   tbl_posiciones Fk_area_tipoposicion    FK CONSTRAINT     ?   ALTER TABLE ONLY siv.tbl_posiciones
    ADD CONSTRAINT "Fk_area_tipoposicion" FOREIGN KEY (id_area) REFERENCES siv.tbl_areas(id) NOT VALID;
 L   ALTER TABLE ONLY siv.tbl_posiciones DROP CONSTRAINT "Fk_area_tipoposicion";
       siv          postgres    false    242    218    3503                       2606    67042    tbl_areas Fk_areas_sedes    FK CONSTRAINT     ?   ALTER TABLE ONLY siv.tbl_areas
    ADD CONSTRAINT "Fk_areas_sedes" FOREIGN KEY (id_sede) REFERENCES siv.tbl_sedes(id) NOT VALID;
 A   ALTER TABLE ONLY siv.tbl_areas DROP CONSTRAINT "Fk_areas_sedes";
       siv          postgres    false    246    218    3533            %           2606    67047    tbl_sedes Fk_sede_division    FK CONSTRAINT     ?   ALTER TABLE ONLY siv.tbl_sedes
    ADD CONSTRAINT "Fk_sede_division" FOREIGN KEY (id_division) REFERENCES siv.tbl_division(id) NOT VALID;
 C   ALTER TABLE ONLY siv.tbl_sedes DROP CONSTRAINT "Fk_sede_division";
       siv          postgres    false    246    3519    233                        2606    67052    tbl_division Fk_tipo_division    FK CONSTRAINT     ?   ALTER TABLE ONLY siv.tbl_division
    ADD CONSTRAINT "Fk_tipo_division" FOREIGN KEY (id_tipo_division) REFERENCES siv.tbl_tipo_division(id) NOT VALID;
 F   ALTER TABLE ONLY siv.tbl_division DROP CONSTRAINT "Fk_tipo_division";
       siv          postgres    false    247    233    3535            &           2606    67057    tbl_sedes Fk_tipo_sede    FK CONSTRAINT     ?   ALTER TABLE ONLY siv.tbl_sedes
    ADD CONSTRAINT "Fk_tipo_sede" FOREIGN KEY (id_tipo_sede) REFERENCES siv.tbl_tipos_sedes(id) NOT VALID;
 ?   ALTER TABLE ONLY siv.tbl_sedes DROP CONSTRAINT "Fk_tipo_sede";
       siv          postgres    false    3541    246    254            +           2606    67062 %   tbl_tipos_sedes Fk_tipo_sede_division    FK CONSTRAINT     ?   ALTER TABLE ONLY siv.tbl_tipos_sedes
    ADD CONSTRAINT "Fk_tipo_sede_division" FOREIGN KEY (id_tipo_division) REFERENCES siv.tbl_tipo_division(id) NOT VALID;
 N   ALTER TABLE ONLY siv.tbl_tipos_sedes DROP CONSTRAINT "Fk_tipo_sede_division";
       siv          postgres    false    254    247    3535                       2606    67067 #   tbl_actividades fk_actividades_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY siv.tbl_actividades
    ADD CONSTRAINT fk_actividades_pais FOREIGN KEY (id_pais) REFERENCES siv.tbl_pais(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 J   ALTER TABLE ONLY siv.tbl_actividades DROP CONSTRAINT fk_actividades_pais;
       siv          postgres    false    215    239    3525                       2606    67072 &   tbl_areas_de_accion fk_areaaccion_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY siv.tbl_areas_de_accion
    ADD CONSTRAINT fk_areaaccion_pais FOREIGN KEY (id_pais) REFERENCES siv.tbl_pais(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 M   ALTER TABLE ONLY siv.tbl_areas_de_accion DROP CONSTRAINT fk_areaaccion_pais;
       siv          postgres    false    239    219    3525                       2606    67077 (   tbl_areas_de_accion fk_areas_accion_area    FK CONSTRAINT     ?   ALTER TABLE ONLY siv.tbl_areas_de_accion
    ADD CONSTRAINT fk_areas_accion_area FOREIGN KEY (id_area) REFERENCES siv.tbl_areas(id) NOT VALID;
 O   ALTER TABLE ONLY siv.tbl_areas_de_accion DROP CONSTRAINT fk_areas_accion_area;
       siv          postgres    false    3503    218    219                       2606    67082    tbl_areas fk_areas_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY siv.tbl_areas
    ADD CONSTRAINT fk_areas_pais FOREIGN KEY (id_pais) REFERENCES siv.tbl_pais(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 >   ALTER TABLE ONLY siv.tbl_areas DROP CONSTRAINT fk_areas_pais;
       siv          postgres    false    239    3525    218                       2606    67087 4   tbl_detalle_tipo_actividad fk_datalle_actividad_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY siv.tbl_detalle_tipo_actividad
    ADD CONSTRAINT fk_datalle_actividad_pais FOREIGN KEY (id_pais) REFERENCES siv.tbl_pais(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 [   ALTER TABLE ONLY siv.tbl_detalle_tipo_actividad DROP CONSTRAINT fk_datalle_actividad_pais;
       siv          postgres    false    3525    239    231                       2606    67092 9   tbl_detalle_tipo_actividad fk_detalle_actividad_actividad    FK CONSTRAINT     ?   ALTER TABLE ONLY siv.tbl_detalle_tipo_actividad
    ADD CONSTRAINT fk_detalle_actividad_actividad FOREIGN KEY (id_actividad) REFERENCES siv.tbl_actividades(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 `   ALTER TABLE ONLY siv.tbl_detalle_tipo_actividad DROP CONSTRAINT fk_detalle_actividad_actividad;
       siv          postgres    false    3501    215    231                       2606    67097 4   tbl_detalle_tipo_actividad fk_detalle_tipo_actividad    FK CONSTRAINT     ?   ALTER TABLE ONLY siv.tbl_detalle_tipo_actividad
    ADD CONSTRAINT fk_detalle_tipo_actividad FOREIGN KEY (id_tipo_actividad) REFERENCES siv.tb_tipos_actividades(id) NOT VALID;
 [   ALTER TABLE ONLY siv.tbl_detalle_tipo_actividad DROP CONSTRAINT fk_detalle_tipo_actividad;
       siv          postgres    false    214    3499    231                       2606    67102 -   tbl_hist_posiciones fk_hist_posici_voluntario    FK CONSTRAINT     ?   ALTER TABLE ONLY siv.tbl_hist_posiciones
    ADD CONSTRAINT fk_hist_posici_voluntario FOREIGN KEY (id_voluntario) REFERENCES siv.tbl_voluntarios(id) NOT VALID;
 T   ALTER TABLE ONLY siv.tbl_hist_posiciones DROP CONSTRAINT fk_hist_posici_voluntario;
       siv          postgres    false    212    3543    255                       2606    67107    tbl_hist_posiciones fk_posicion    FK CONSTRAINT     ?   ALTER TABLE ONLY siv.tbl_hist_posiciones
    ADD CONSTRAINT fk_posicion FOREIGN KEY (id_posicion) REFERENCES siv.tbl_posiciones(id) NOT VALID;
 F   ALTER TABLE ONLY siv.tbl_hist_posiciones DROP CONSTRAINT fk_posicion;
       siv          postgres    false    242    3529    212            '           2606    67112 "   tbl_tipo_division fk_tipo_div_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY siv.tbl_tipo_division
    ADD CONSTRAINT fk_tipo_div_pais FOREIGN KEY (id_pais) REFERENCES siv.tbl_pais(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 I   ALTER TABLE ONLY siv.tbl_tipo_division DROP CONSTRAINT fk_tipo_div_pais;
       siv          postgres    false    239    3525    247            *           2606    67117 !   tbl_tipos_documentos fk_tipo_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY siv.tbl_tipos_documentos
    ADD CONSTRAINT fk_tipo_pais FOREIGN KEY (id_pais) REFERENCES siv.tbl_pais(id) NOT VALID;
 H   ALTER TABLE ONLY siv.tbl_tipos_documentos DROP CONSTRAINT fk_tipo_pais;
       siv          postgres    false    251    239    3525            1           2606    67122 9   tbl_voluntarios_actividades fk_volunactividades_actividad    FK CONSTRAINT     ?   ALTER TABLE ONLY siv.tbl_voluntarios_actividades
    ADD CONSTRAINT fk_volunactividades_actividad FOREIGN KEY (id_actividad) REFERENCES siv.tbl_actividades(id) NOT VALID;
 `   ALTER TABLE ONLY siv.tbl_voluntarios_actividades DROP CONSTRAINT fk_volunactividades_actividad;
       siv          postgres    false    215    256    3501            2           2606    67127 4   tbl_voluntarios_actividades fk_volunactividades_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY siv.tbl_voluntarios_actividades
    ADD CONSTRAINT fk_volunactividades_pais FOREIGN KEY (id_pais) REFERENCES siv.tbl_pais(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 [   ALTER TABLE ONLY siv.tbl_voluntarios_actividades DROP CONSTRAINT fk_volunactividades_pais;
       siv          postgres    false    3525    256    239            3           2606    67132 :   tbl_voluntarios_actividades fk_volunactividades_voluntario    FK CONSTRAINT     ?   ALTER TABLE ONLY siv.tbl_voluntarios_actividades
    ADD CONSTRAINT fk_volunactividades_voluntario FOREIGN KEY (id_voluntario) REFERENCES siv.tbl_voluntarios(id) NOT VALID;
 a   ALTER TABLE ONLY siv.tbl_voluntarios_actividades DROP CONSTRAINT fk_volunactividades_voluntario;
       siv          postgres    false    255    256    3543            ,           2606    67137 "   tbl_voluntarios fk_voluntario_area    FK CONSTRAINT     ?   ALTER TABLE ONLY siv.tbl_voluntarios
    ADD CONSTRAINT fk_voluntario_area FOREIGN KEY (id_area) REFERENCES siv.tbl_areas(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 I   ALTER TABLE ONLY siv.tbl_voluntarios DROP CONSTRAINT fk_voluntario_area;
       siv          postgres    false    255    3503    218            -           2606    67142 (   tbl_voluntarios fk_voluntario_documentos    FK CONSTRAINT     ?   ALTER TABLE ONLY siv.tbl_voluntarios
    ADD CONSTRAINT fk_voluntario_documentos FOREIGN KEY (id_tipo_documento) REFERENCES siv.tbl_tipos_documentos(id) NOT VALID;
 O   ALTER TABLE ONLY siv.tbl_voluntarios DROP CONSTRAINT fk_voluntario_documentos;
       siv          postgres    false    255    251    3539            .           2606    67147 "   tbl_voluntarios fk_voluntario_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY siv.tbl_voluntarios
    ADD CONSTRAINT fk_voluntario_pais FOREIGN KEY (id_pais) REFERENCES siv.tbl_pais(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 I   ALTER TABLE ONLY siv.tbl_voluntarios DROP CONSTRAINT fk_voluntario_pais;
       siv          postgres    false    3525    239    255            /           2606    67152 &   tbl_voluntarios fk_voluntario_posicion    FK CONSTRAINT     ?   ALTER TABLE ONLY siv.tbl_voluntarios
    ADD CONSTRAINT fk_voluntario_posicion FOREIGN KEY (id_posicion) REFERENCES siv.tbl_posiciones(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 M   ALTER TABLE ONLY siv.tbl_voluntarios DROP CONSTRAINT fk_voluntario_posicion;
       siv          postgres    false    242    255    3529            0           2606    67157 "   tbl_voluntarios fk_voluntario_sede    FK CONSTRAINT     ?   ALTER TABLE ONLY siv.tbl_voluntarios
    ADD CONSTRAINT fk_voluntario_sede FOREIGN KEY (id_sede) REFERENCES siv.tbl_sedes(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 I   ALTER TABLE ONLY siv.tbl_voluntarios DROP CONSTRAINT fk_voluntario_sede;
       siv          postgres    false    246    255    3533                  x?????? ? ?            x?????? ? ?         c   x?3?4B?ҲԼ?ҔN???̲|μԴ?ĜL????Ģ?|????????\N###]c]#KCc+c+??yɉE??)?
)??1~p????? "?      	     x??P?n?0<?W?k?~@???K?????????6U???Vm??QWsX͌4????%??*??1?7?????Rqz.s???C?F?~?f?j4%?????¶W?ך?ns~?Ko+T=W?lV]?/9?S_?yIfZ???4??Yp4????E??!fC&?	?	?%?,YRC?r?d}pap4? ??????%?7F??`lׂr???<H5H?]?w?I.Q<??r?^??Gݻ<????EU??W(?Z??e?A?Yo? w?5???۵'??EH\??-O?,?w~P?5         {   x?3?4C???̲|μԴ?ĜL????Ģ?|????????\N##c]C]cC+c+C=KS??*?4 4?t?KN,JOL?WHIU??r??0"?C+c=cCK?% JpZ???? ?o6?            x????n? Dk??????t}?*?5`?$l,?V???%??'m1Ү??,GMvu??e????J??}?a?|???bH}	}ֺ???0g? Y??!??7Y?RXxj???*iͩv\+??Ra3X????w?0?^???Z?b???}=??8<??:eO???????vr2`??r?{?<??i.L?p!hL?D???V??????l	???qܩ??#3D?#??<L?????1???߾b?.SGB/>????i~ ?t5      6   ?   x?α? @???? %??7??bLL??@yė??@k??e;???`?N0??I+??4??5?v??X????%???2E?՗?K??}??YJ
?Fl"z??`?5+??C/M?T'????	?Z???ֈ68?]??x??T??0???`0s         V   x?3?4??ļ?|???̼?| ?3/1?$?,??/5?$1'3(?8?(3?????H??X??R???????? ?:?
9c???+F??? )?            x?????? ? ?         ?   x?u???0Dg?+???$?S&
????P?6?J??CY?MO?Ng{`pp9?>=u6C?4?u?%G-
g-K5_???t ?? 9??'b??:?????_J?/:?y??c?<??N`?~,?̆e?y?C+]X??߂Ebt?Vn?=:?JWAUF??O*??9J??K?4???>d            x?????? ? ?      4   N   x?3?4B##c]#]C??rL.?,???suq??
2wp?u???s??ER?`hlebaeh?gdjՉ??b???? 7Fs         1   x?3?4???O)??WHIU??)?+I,??W?2?tL.?,#?X?=... ?.?         v   x?]?;
?0@g??@?d;?xj)]s/?v? ??	=?c???c`??*????/-R?G??<eU?퐮??l?+涁#????u.?=?D??O??????c??)͖j?i?MBc??g"?         d   x?3?424????J-8?+)'39Q?%?73??K?t?"_N??|NCcSNsS 陗?\?Y?ϙQRRPl??_TZ????????Z????????? j??         v   x?3?4?°??Ҽ?Ģ?|NK(????tL.?,???KM+I???+?/)qH?M???K???4202?50?56T04?26?21?3?0?蚗?X???????
2
M??????9H"Ə+F??? ??$0      !   ?   x?3?4°??Ҽ?Ģ?|N???̲|μԴ?ĜL???b??Cznbf?^r~.????????????????????׼?Ģ?Ĕ|??T??8?2[???_????/B???Ȝ|Í???V????;?"?M å?J?R?JJS?i?)??4:F??? UׇA      #   R   x?3?4??ԔT???????N??N???̲|N?Դ?ĜL????Ģ?|N###]c]#KCc+c+?jT????? ??o      %      x?????? ? ?      '   ?   x??ӱ? ??????`4vk?? 1?]nP??4` ???????7?r????d?>8?)?h?,udP??'{?????R?[??փCyU???h?lĎ??????8??Q??>>j???st0??UĖ?????Fc????{???/T???????_{?*r+J?M0?i      )   C   x?3?4???)?+I,??W??tL.?,[?Y?e?ձ81hgb
?lM?2A?k??????=... ?=?      ,   p   x?3?4?H,N,?/*I?tL.?,???KM+I???/N,??O?4202?50?56T04?22?25г00???CC\?@??SSJs??6??T???a?c+cs=#c?m\1z\\\ ?.6      .   Y   x?3?4B?ԔT?Լ???N???̲|μԴ?Ĝ̢"s????????\N###]c]##+j/-.M,??????#?=... w?      0      x?????? ? ?      2   ?   x??M?0 ???_?aWǾ??? ?"*?,	/?L?[?A???G(`??ꞩ?.?|ه?yb? ??1??|o???U5?????]????X?û?G????G?{?T?X˸??M?3?\d?g??X^HVHE??МPCB?M$v            x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?     