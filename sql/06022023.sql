PGDMP     -    8                {            cr    14.6    14.6 ?    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    17229    cr    DATABASE     _   CREATE DATABASE cr WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Mexico.1252';
    DROP DATABASE cr;
                postgres    false                        2615    17230    iniciar    SCHEMA        CREATE SCHEMA iniciar;
    DROP SCHEMA iniciar;
                postgres    false                       1255    17231    spt_movimiento_miembros()    FUNCTION     ?  CREATE FUNCTION iniciar.spt_movimiento_miembros() RETURNS trigger
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
       iniciar          postgres    false    4            ?            1259    17232     tbl_informacion_adicional    TABLE     )  CREATE TABLE iniciar." tbl_informacion_adicional" (
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
       iniciar         heap    crduser    false    4            ?           0    0 "   TABLE " tbl_informacion_adicional"    COMMENT     ?   COMMENT ON TABLE iniciar." tbl_informacion_adicional" IS 'Aqui se almacena los diferentes tipos de informacion relacionada a un miembro';
          iniciar          crduser    false    210            ?            1259    17237 !    tbl_informacion_adicional_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar." tbl_informacion_adicional_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE iniciar." tbl_informacion_adicional_id_seq";
       iniciar          crduser    false    4    210            ?           0    0 !    tbl_informacion_adicional_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE iniciar." tbl_informacion_adicional_id_seq" OWNED BY iniciar." tbl_informacion_adicional".id;
          iniciar          crduser    false    211            ?            1259    17238    tbl_area_de_accion    TABLE       CREATE TABLE iniciar.tbl_area_de_accion (
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
       iniciar         heap    crduser    false    4            ?           0    0    TABLE tbl_area_de_accion    COMMENT     B   COMMENT ON TABLE iniciar.tbl_area_de_accion IS 'Area de Accion ';
          iniciar          crduser    false    212            ?            1259    17243    tbl_area_de_accion_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar.tbl_area_de_accion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE iniciar.tbl_area_de_accion_id_seq;
       iniciar          crduser    false    4    212            ?           0    0    tbl_area_de_accion_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE iniciar.tbl_area_de_accion_id_seq OWNED BY iniciar.tbl_area_de_accion.id;
          iniciar          crduser    false    213            ?            1259    17244    tbl_areas_id_seq    SEQUENCE     z   CREATE SEQUENCE iniciar.tbl_areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE iniciar.tbl_areas_id_seq;
       iniciar          crduser    false    4            ?            1259    17245 	   tbl_areas    TABLE     Z  CREATE TABLE iniciar.tbl_areas (
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
       iniciar         heap    crduser    false    214    4            ?           0    0    TABLE tbl_areas    COMMENT     S   COMMENT ON TABLE iniciar.tbl_areas IS 'Esto almacendra todas las areas por sedes';
          iniciar          crduser    false    215            ?            1259    17251 
   tbl_cursos    TABLE     R  CREATE TABLE iniciar.tbl_cursos (
    id bigint NOT NULL,
    id_pais bigint NOT NULL,
    descripcion character varying(10000) NOT NULL,
    duracion numeric(2,2),
    tipo character varying(100),
    posicion bigint,
    estado character varying(50),
    agregado_por character varying(100) NOT NULL,
    agregado_en timestamp without time zone NOT NULL,
    rol_agregado_id bigint,
    rol_agregado_nom character varying(100),
    modificado_por character varying(100),
    modificado_en timestamp without time zone,
    rol_modificado_id bigint,
    rol_modificado_nom character varying
);
    DROP TABLE iniciar.tbl_cursos;
       iniciar         heap    postgres    false    4            ?           0    0    TABLE tbl_cursos    COMMENT     I   COMMENT ON TABLE iniciar.tbl_cursos IS 'aqui se crean todos los cursos';
          iniciar          postgres    false    216            ?            1259    17256    tbl_cursos_id_seq    SEQUENCE     {   CREATE SEQUENCE iniciar.tbl_cursos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE iniciar.tbl_cursos_id_seq;
       iniciar          postgres    false    216    4            ?           0    0    tbl_cursos_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE iniciar.tbl_cursos_id_seq OWNED BY iniciar.tbl_cursos.id;
          iniciar          postgres    false    217            ?            1259    17257    tbl_det_roles_id_seq    SEQUENCE     ~   CREATE SEQUENCE iniciar.tbl_det_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE iniciar.tbl_det_roles_id_seq;
       iniciar          neoalex    false    4            ?           0    0    SEQUENCE tbl_det_roles_id_seq    ACL     ?   GRANT ALL ON SEQUENCE iniciar.tbl_det_roles_id_seq TO crduser;
          iniciar          neoalex    false    218            ?            1259    17258    tbl_det_roles    TABLE     ?  CREATE TABLE iniciar.tbl_det_roles (
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
       iniciar         heap    crduser    false    218    4            ?            1259    17264    tbl_detalle_de_cursos    TABLE     w  CREATE TABLE iniciar.tbl_detalle_de_cursos (
    id bigint NOT NULL,
    id_curso bigint NOT NULL,
    titulo character varying(100),
    descripcion character varying(1000),
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
    rol_modificado_nom character varying(100)
);
 *   DROP TABLE iniciar.tbl_detalle_de_cursos;
       iniciar         heap    postgres    false    4            ?            1259    17269    tbl_detalle_de_cursos_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar.tbl_detalle_de_cursos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE iniciar.tbl_detalle_de_cursos_id_seq;
       iniciar          postgres    false    4    220            ?           0    0    tbl_detalle_de_cursos_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE iniciar.tbl_detalle_de_cursos_id_seq OWNED BY iniciar.tbl_detalle_de_cursos.id;
          iniciar          postgres    false    221            ?            1259    17270    tbl_division_id_seq    SEQUENCE     }   CREATE SEQUENCE iniciar.tbl_division_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE iniciar.tbl_division_id_seq;
       iniciar          crduser    false    4            ?            1259    17271    tbl_division    TABLE     \  CREATE TABLE iniciar.tbl_division (
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
       iniciar         heap    crduser    false    222    4            ?           0    0    TABLE tbl_division    COMMENT     N   COMMENT ON TABLE iniciar.tbl_division IS 'Tabla de Divisiones de los paises';
          iniciar          crduser    false    223            ?            1259    17277    tbl_imagenes_miembros    TABLE     ]  CREATE TABLE iniciar.tbl_imagenes_miembros (
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
       iniciar         heap    postgres    false    4            ?           0    0    TABLE tbl_imagenes_miembros    COMMENT     g   COMMENT ON TABLE iniciar.tbl_imagenes_miembros IS 'Aqui se almacena todas las images de los miembros';
          iniciar          postgres    false    224            ?            1259    17282    tbl_imagenes_miembros_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar.tbl_imagenes_miembros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE iniciar.tbl_imagenes_miembros_id_seq;
       iniciar          postgres    false    4    224            ?           0    0    tbl_imagenes_miembros_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE iniciar.tbl_imagenes_miembros_id_seq OWNED BY iniciar.tbl_imagenes_miembros.id;
          iniciar          postgres    false    225            ?            1259    17283    tbl_miembros_id_seq    SEQUENCE     }   CREATE SEQUENCE iniciar.tbl_miembros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE iniciar.tbl_miembros_id_seq;
       iniciar          postgres    false    4            ?           0    0    SEQUENCE tbl_miembros_id_seq    ACL     >   GRANT ALL ON SEQUENCE iniciar.tbl_miembros_id_seq TO crduser;
          iniciar          postgres    false    226            ?            1259    17284    tbl_miembros    TABLE     0  CREATE TABLE iniciar.tbl_miembros (
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
    tipo_miembro bigint NOT NULL
);
 !   DROP TABLE iniciar.tbl_miembros;
       iniciar         heap    crduser    false    226    4            ?           0    0    TABLE tbl_miembros    COMMENT     j   COMMENT ON TABLE iniciar.tbl_miembros IS 'Esto almacena todo los miembro tanto voluntario asalariado y ';
          iniciar          crduser    false    227            ?            1259    17290    tbl_miembros_posiciones    TABLE     	  CREATE TABLE iniciar.tbl_miembros_posiciones (
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
    rol_modificado_nom character varying(100)
);
 ,   DROP TABLE iniciar.tbl_miembros_posiciones;
       iniciar         heap    postgres    false    4            ?           0    0    TABLE tbl_miembros_posiciones    COMMENT     ?   COMMENT ON TABLE iniciar.tbl_miembros_posiciones IS 'Esta Tabla Contiene los Miembros y las Posiciones  asociadas a este miembro';
          iniciar          postgres    false    228            ?            1259    17293    tbl_miembros_posiciones_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar.tbl_miembros_posiciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE iniciar.tbl_miembros_posiciones_id_seq;
       iniciar          postgres    false    228    4            ?           0    0    tbl_miembros_posiciones_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE iniciar.tbl_miembros_posiciones_id_seq OWNED BY iniciar.tbl_miembros_posiciones.id;
          iniciar          postgres    false    229            ?            1259    17294    tbl_modulos_id_seq    SEQUENCE     |   CREATE SEQUENCE iniciar.tbl_modulos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE iniciar.tbl_modulos_id_seq;
       iniciar          neoalex    false    4            ?            1259    17295    tbl_modulos    TABLE     ?   CREATE TABLE iniciar.tbl_modulos (
    id bigint DEFAULT nextval('iniciar.tbl_modulos_id_seq'::regclass) NOT NULL,
    id_pais bigint NOT NULL,
    descripcion character(100) NOT NULL,
    estado character(50) NOT NULL
);
     DROP TABLE iniciar.tbl_modulos;
       iniciar         heap    crduser    false    230    4            ?           0    0    TABLE tbl_modulos    COMMENT     |   COMMENT ON TABLE iniciar.tbl_modulos IS 'almacena todos los modulos de la aplicacion en principio solo es los voluntarios';
          iniciar          crduser    false    231            ?            1259    17299    tbl_opciones_id_seq    SEQUENCE     }   CREATE SEQUENCE iniciar.tbl_opciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE iniciar.tbl_opciones_id_seq;
       iniciar          neoalex    false    4            ?           0    0    SEQUENCE tbl_opciones_id_seq    ACL     >   GRANT ALL ON SEQUENCE iniciar.tbl_opciones_id_seq TO crduser;
          iniciar          neoalex    false    232            ?            1259    17300    tbl_opciones    TABLE     @  CREATE TABLE iniciar.tbl_opciones (
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
       iniciar         heap    crduser    false    232    4            ?           0    0    TABLE tbl_opciones    COMMENT     g   COMMENT ON TABLE iniciar.tbl_opciones IS 'esto almacena todas las opciones del menu de la aplicacion';
          iniciar          crduser    false    233            ?            1259    17306 
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
       iniciar         heap    crduser    false    4                        0    0    TABLE tbl_paises    COMMENT     U   COMMENT ON TABLE iniciar.tbl_paises IS 'Tabla Donde se almacenara todos los paises';
          iniciar          crduser    false    234            ?            1259    17311    tbl_pais_id_seq    SEQUENCE     y   CREATE SEQUENCE iniciar.tbl_pais_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE iniciar.tbl_pais_id_seq;
       iniciar          crduser    false    234    4                       0    0    tbl_pais_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE iniciar.tbl_pais_id_seq OWNED BY iniciar.tbl_paises.id;
          iniciar          crduser    false    235            ?            1259    17312    tbl_paises_id_seq    SEQUENCE     {   CREATE SEQUENCE iniciar.tbl_paises_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE iniciar.tbl_paises_id_seq;
       iniciar          crduser    false    4    234                       0    0    tbl_paises_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE iniciar.tbl_paises_id_seq OWNED BY iniciar.tbl_paises.id;
          iniciar          crduser    false    236            ?            1259    17313    tbl_posiciones_id_seq    SEQUENCE        CREATE SEQUENCE iniciar.tbl_posiciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE iniciar.tbl_posiciones_id_seq;
       iniciar          postgres    false    4                       0    0    SEQUENCE tbl_posiciones_id_seq    ACL     @   GRANT ALL ON SEQUENCE iniciar.tbl_posiciones_id_seq TO crduser;
          iniciar          postgres    false    237            ?            1259    17314    tbl_posiciones    TABLE     ?  CREATE TABLE iniciar.tbl_posiciones (
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
       iniciar         heap    crduser    false    237    4                       0    0    TABLE tbl_posiciones    COMMENT     h   COMMENT ON TABLE iniciar.tbl_posiciones IS 'Esto almacena las posiciones disponibles por area y sede ';
          iniciar          crduser    false    238                       0    0    COLUMN tbl_posiciones.id_rol    COMMENT     K   COMMENT ON COLUMN iniciar.tbl_posiciones.id_rol IS 'esto es para los rol';
          iniciar          crduser    false    238            ?            1259    17319    tbl_roles_id_seq    SEQUENCE     z   CREATE SEQUENCE iniciar.tbl_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE iniciar.tbl_roles_id_seq;
       iniciar          neoalex    false    4                       0    0    SEQUENCE tbl_roles_id_seq    ACL     ;   GRANT ALL ON SEQUENCE iniciar.tbl_roles_id_seq TO crduser;
          iniciar          neoalex    false    239            ?            1259    17320 	   tbl_roles    TABLE     a  CREATE TABLE iniciar.tbl_roles (
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
       iniciar         heap    crduser    false    239    4                       0    0    TABLE tbl_roles    COMMENT     A   COMMENT ON TABLE iniciar.tbl_roles IS 'Definicion de los roles';
          iniciar          crduser    false    240            ?            1259    17326    tbl_sedes_id_seq    SEQUENCE     z   CREATE SEQUENCE iniciar.tbl_sedes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE iniciar.tbl_sedes_id_seq;
       iniciar          crduser    false    4            ?            1259    17327 	   tbl_sedes    TABLE     ?  CREATE TABLE iniciar.tbl_sedes (
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
       iniciar         heap    crduser    false    241    4                       0    0    TABLE tbl_sedes    COMMENT     P   COMMENT ON TABLE iniciar.tbl_sedes IS 'Son las diferentes sedes de los paises';
          iniciar          crduser    false    242            ?            1259    17334    tbl_tipo_division_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar.tbl_tipo_division_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE iniciar.tbl_tipo_division_id_seq;
       iniciar          crduser    false    4            ?            1259    17335    tbl_tipo_informacion    TABLE     ?  CREATE TABLE iniciar.tbl_tipo_informacion (
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
       iniciar         heap    crduser    false    4            	           0    0    TABLE tbl_tipo_informacion    COMMENT     }   COMMENT ON TABLE iniciar.tbl_tipo_informacion IS 'Esto almacendra los diferentes tipos de informacion para los voluntarios';
          iniciar          crduser    false    244            ?            1259    17340    tbl_tipo_informacion_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar.tbl_tipo_informacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE iniciar.tbl_tipo_informacion_id_seq;
       iniciar          crduser    false    4    244            
           0    0    tbl_tipo_informacion_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE iniciar.tbl_tipo_informacion_id_seq OWNED BY iniciar.tbl_tipo_informacion.id;
          iniciar          crduser    false    245            ?            1259    17341    tbl_tipodivision    TABLE     ?  CREATE TABLE iniciar.tbl_tipodivision (
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
       iniciar         heap    crduser    false    4            ?            1259    17346    tbl_tipodivision_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar.tbl_tipodivision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE iniciar.tbl_tipodivision_id_seq;
       iniciar          crduser    false    4    246                       0    0    tbl_tipodivision_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE iniciar.tbl_tipodivision_id_seq OWNED BY iniciar.tbl_tipodivision.id;
          iniciar          crduser    false    247            ?            1259    17347    tbl_tipos_de_miembros    TABLE     ?   CREATE TABLE iniciar.tbl_tipos_de_miembros (
    id bigint NOT NULL,
    id_pais bigint NOT NULL,
    descripcion character(100) NOT NULL,
    estado character(10) NOT NULL,
    calcular_tiempo boolean
);
 *   DROP TABLE iniciar.tbl_tipos_de_miembros;
       iniciar         heap    crduser    false    4                       0    0    TABLE tbl_tipos_de_miembros    COMMENT     \   COMMENT ON TABLE iniciar.tbl_tipos_de_miembros IS 'Esto almacena todos Tipos de miembros ';
          iniciar          crduser    false    248            ?            1259    17350    tbl_tipos_de_miembros_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar.tbl_tipos_de_miembros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE iniciar.tbl_tipos_de_miembros_id_seq;
       iniciar          crduser    false    4    248                       0    0    tbl_tipos_de_miembros_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE iniciar.tbl_tipos_de_miembros_id_seq OWNED BY iniciar.tbl_tipos_de_miembros.id;
          iniciar          crduser    false    249            ?            1259    17351    tbl_tipos_documentos_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar.tbl_tipos_documentos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE iniciar.tbl_tipos_documentos_id_seq;
       iniciar          postgres    false    4                       0    0 $   SEQUENCE tbl_tipos_documentos_id_seq    ACL     F   GRANT ALL ON SEQUENCE iniciar.tbl_tipos_documentos_id_seq TO crduser;
          iniciar          postgres    false    250            ?            1259    17352    tbl_tipos_documentos    TABLE     X  CREATE TABLE iniciar.tbl_tipos_documentos (
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
       iniciar         heap    crduser    false    250    4                       0    0    TABLE tbl_tipos_documentos    COMMENT     S   COMMENT ON TABLE iniciar.tbl_tipos_documentos IS 'tipos de Documentos por paises';
          iniciar          crduser    false    251            ?            1259    17358    tbl_tipos_sedes_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar.tbl_tipos_sedes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE iniciar.tbl_tipos_sedes_id_seq;
       iniciar          crduser    false    4            ?            1259    17359    tbl_tipos_sedes    TABLE     o  CREATE TABLE iniciar.tbl_tipos_sedes (
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
       iniciar         heap    crduser    false    252    4                       0    0    TABLE tbl_tipos_sedes    COMMENT     k   COMMENT ON TABLE iniciar.tbl_tipos_sedes IS 'Alamacena los tipos de sedes dependendiendo de la division ';
          iniciar          crduser    false    253            ?            1259    17365 $   tbl_transacciones_de_miembros_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar.tbl_transacciones_de_miembros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE iniciar.tbl_transacciones_de_miembros_id_seq;
       iniciar          crduser    false    4            ?            1259    17366    tbl_transacciones_de_miembros    TABLE     y  CREATE TABLE iniciar.tbl_transacciones_de_miembros (
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
       iniciar         heap    crduser    false    254    4                       0    0 #   TABLE tbl_transacciones_de_miembros    COMMENT     v   COMMENT ON TABLE iniciar.tbl_transacciones_de_miembros IS 'Esto Almacenara todas las transacciones de los miembros ';
          iniciar          crduser    false    255                        1259    17372    tbl_users_id_seq    SEQUENCE     z   CREATE SEQUENCE iniciar.tbl_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE iniciar.tbl_users_id_seq;
       iniciar          neoalex    false    4                       0    0    SEQUENCE tbl_users_id_seq    ACL     ;   GRANT ALL ON SEQUENCE iniciar.tbl_users_id_seq TO crduser;
          iniciar          neoalex    false    256                       1259    17373 	   tbl_users    TABLE     ?  CREATE TABLE iniciar.tbl_users (
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
       iniciar         heap    crduser    false    256    4            ?           2604    17379     tbl_informacion_adicional id    DEFAULT     ?   ALTER TABLE ONLY iniciar." tbl_informacion_adicional" ALTER COLUMN id SET DEFAULT nextval('iniciar." tbl_informacion_adicional_id_seq"'::regclass);
 O   ALTER TABLE iniciar." tbl_informacion_adicional" ALTER COLUMN id DROP DEFAULT;
       iniciar          crduser    false    211    210            ?           2604    17380    tbl_area_de_accion id    DEFAULT     ?   ALTER TABLE ONLY iniciar.tbl_area_de_accion ALTER COLUMN id SET DEFAULT nextval('iniciar.tbl_area_de_accion_id_seq'::regclass);
 E   ALTER TABLE iniciar.tbl_area_de_accion ALTER COLUMN id DROP DEFAULT;
       iniciar          crduser    false    213    212            ?           2604    17381    tbl_cursos id    DEFAULT     p   ALTER TABLE ONLY iniciar.tbl_cursos ALTER COLUMN id SET DEFAULT nextval('iniciar.tbl_cursos_id_seq'::regclass);
 =   ALTER TABLE iniciar.tbl_cursos ALTER COLUMN id DROP DEFAULT;
       iniciar          postgres    false    217    216            ?           2604    17382    tbl_detalle_de_cursos id    DEFAULT     ?   ALTER TABLE ONLY iniciar.tbl_detalle_de_cursos ALTER COLUMN id SET DEFAULT nextval('iniciar.tbl_detalle_de_cursos_id_seq'::regclass);
 H   ALTER TABLE iniciar.tbl_detalle_de_cursos ALTER COLUMN id DROP DEFAULT;
       iniciar          postgres    false    221    220            ?           2604    17383    tbl_imagenes_miembros id    DEFAULT     ?   ALTER TABLE ONLY iniciar.tbl_imagenes_miembros ALTER COLUMN id SET DEFAULT nextval('iniciar.tbl_imagenes_miembros_id_seq'::regclass);
 H   ALTER TABLE iniciar.tbl_imagenes_miembros ALTER COLUMN id DROP DEFAULT;
       iniciar          postgres    false    225    224            ?           2604    17384    tbl_miembros_posiciones id    DEFAULT     ?   ALTER TABLE ONLY iniciar.tbl_miembros_posiciones ALTER COLUMN id SET DEFAULT nextval('iniciar.tbl_miembros_posiciones_id_seq'::regclass);
 J   ALTER TABLE iniciar.tbl_miembros_posiciones ALTER COLUMN id DROP DEFAULT;
       iniciar          postgres    false    229    228            ?           2604    17385    tbl_paises id    DEFAULT     p   ALTER TABLE ONLY iniciar.tbl_paises ALTER COLUMN id SET DEFAULT nextval('iniciar.tbl_paises_id_seq'::regclass);
 =   ALTER TABLE iniciar.tbl_paises ALTER COLUMN id DROP DEFAULT;
       iniciar          crduser    false    236    234            ?           2604    17386    tbl_tipo_informacion id    DEFAULT     ?   ALTER TABLE ONLY iniciar.tbl_tipo_informacion ALTER COLUMN id SET DEFAULT nextval('iniciar.tbl_tipo_informacion_id_seq'::regclass);
 G   ALTER TABLE iniciar.tbl_tipo_informacion ALTER COLUMN id DROP DEFAULT;
       iniciar          crduser    false    245    244            ?           2604    17387    tbl_tipodivision id    DEFAULT     |   ALTER TABLE ONLY iniciar.tbl_tipodivision ALTER COLUMN id SET DEFAULT nextval('iniciar.tbl_tipodivision_id_seq'::regclass);
 C   ALTER TABLE iniciar.tbl_tipodivision ALTER COLUMN id DROP DEFAULT;
       iniciar          crduser    false    247    246            ?           2604    17388    tbl_tipos_de_miembros id    DEFAULT     ?   ALTER TABLE ONLY iniciar.tbl_tipos_de_miembros ALTER COLUMN id SET DEFAULT nextval('iniciar.tbl_tipos_de_miembros_id_seq'::regclass);
 H   ALTER TABLE iniciar.tbl_tipos_de_miembros ALTER COLUMN id DROP DEFAULT;
       iniciar          crduser    false    249    248            ?          0    17232     tbl_informacion_adicional 
   TABLE DATA           ?   COPY iniciar." tbl_informacion_adicional" (id, id_pais, id_miembro, id_tipo_informacion, valor, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    210   ?      ?          0    17238    tbl_area_de_accion 
   TABLE DATA           ?   COPY iniciar.tbl_area_de_accion (id, id_pais, id_area, id_sede, descripcion, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    212   ?      ?          0    17245 	   tbl_areas 
   TABLE DATA           ?   COPY iniciar.tbl_areas (id, id_pais, id_sede, nombre, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    215   ?      ?          0    17251 
   tbl_cursos 
   TABLE DATA           ?   COPY iniciar.tbl_cursos (id, id_pais, descripcion, duracion, tipo, posicion, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          postgres    false    216   H      ?          0    17258    tbl_det_roles 
   TABLE DATA           ?   COPY iniciar.tbl_det_roles (id, id_pais, id_roles, id_opcion, estado, agregado_por, agregado_en, modificado_por, modificado_en, leer, escribir, imprimir, eliminar, rol_agregado_id, rol_agregado_nom, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    219   e      ?          0    17264    tbl_detalle_de_cursos 
   TABLE DATA           ?   COPY iniciar.tbl_detalle_de_cursos (id, id_curso, titulo, descripcion, tipo, url, id_formulario, portada, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          postgres    false    220   ?      ?          0    17271    tbl_division 
   TABLE DATA           ?   COPY iniciar.tbl_division (id, id_pais, id_tipo_division, nombre, depende, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    223         ?          0    17277    tbl_imagenes_miembros 
   TABLE DATA           ?   COPY iniciar.tbl_imagenes_miembros (id, id_miembro, id_pais, url, descripcion, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom, estado) FROM stdin;
    iniciar          postgres    false    224   s      ?          0    17284    tbl_miembros 
   TABLE DATA           ?  COPY iniciar.tbl_miembros (id, id_pais, id_sede, id_area, nombre, apellido, nacionalidad, lugar_de_nacimiento, fecha_de_nacimiento, id_tipo_documento, documento, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom, tiempo_voluntariado, email, fecha_de_registro, fecha_de_finalizacion, tipo_miembro) FROM stdin;
    iniciar          crduser    false    227   ?      ?          0    17290    tbl_miembros_posiciones 
   TABLE DATA           ?   COPY iniciar.tbl_miembros_posiciones (id, id_pais, id_miembro, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          postgres    false    228   H      ?          0    17295    tbl_modulos 
   TABLE DATA           H   COPY iniciar.tbl_modulos (id, id_pais, descripcion, estado) FROM stdin;
    iniciar          crduser    false    231   e      ?          0    17300    tbl_opciones 
   TABLE DATA           ?   COPY iniciar.tbl_opciones (id, id_pais, descripcion, estado, agregado_por, agregado_en, modificado_por, modificado_en, rol_agregado_id, rol_agregado_nom, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    233   ?      ?          0    17306 
   tbl_paises 
   TABLE DATA           ?   COPY iniciar.tbl_paises (id, codigo, bandera, nombre, alpha2, alpha3, domains, habitantes, superficie, estado, ruta_bandera) FROM stdin;
    iniciar          crduser    false    234   ,      ?          0    17314    tbl_posiciones 
   TABLE DATA             COPY iniciar.tbl_posiciones (id, id_pais, id_sede, id_area, id_rol, nombre, posiciones_disponible, depende, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    238   ?      ?          0    17320 	   tbl_roles 
   TABLE DATA           ?   COPY iniciar.tbl_roles (id, id_pais, id_modulo, descripcion, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    240   $      ?          0    17327 	   tbl_sedes 
   TABLE DATA           ?   COPY iniciar.tbl_sedes (id, id_pais, id_division, id_tipo_sede, nombre, voluntarios, depende, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    242   ?      ?          0    17335    tbl_tipo_informacion 
   TABLE DATA           ?   COPY iniciar.tbl_tipo_informacion (id, id_pais, id_sede, descripcion, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    244   ?      ?          0    17341    tbl_tipodivision 
   TABLE DATA           ?   COPY iniciar.tbl_tipodivision (id, id_pais, nombre, depende, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    246         ?          0    17347    tbl_tipos_de_miembros 
   TABLE DATA           c   COPY iniciar.tbl_tipos_de_miembros (id, id_pais, descripcion, estado, calcular_tiempo) FROM stdin;
    iniciar          crduser    false    248   ?      ?          0    17352    tbl_tipos_documentos 
   TABLE DATA           ?   COPY iniciar.tbl_tipos_documentos (id, id_pais, descripcion, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    251          ?          0    17359    tbl_tipos_sedes 
   TABLE DATA           ?   COPY iniciar.tbl_tipos_sedes (id, id_tipo_division, id_pais, nombre, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    253   ?      ?          0    17366    tbl_transacciones_de_miembros 
   TABLE DATA           ?   COPY iniciar.tbl_transacciones_de_miembros (id, id_miembro, descripcion, valor_anterior, valor_actual, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    255   	      ?          0    17373 	   tbl_users 
   TABLE DATA           t   COPY iniciar.tbl_users (id, id_pais, id_miembro, usuario, password, estado, agregado_en, modificado_en) FROM stdin;
    iniciar          crduser    false    257   ?                 0    0 !    tbl_informacion_adicional_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('iniciar." tbl_informacion_adicional_id_seq"', 1, false);
          iniciar          crduser    false    211                       0    0    tbl_area_de_accion_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('iniciar.tbl_area_de_accion_id_seq', 1, false);
          iniciar          crduser    false    213                       0    0    tbl_areas_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('iniciar.tbl_areas_id_seq', 1, true);
          iniciar          crduser    false    214                       0    0    tbl_cursos_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('iniciar.tbl_cursos_id_seq', 1, false);
          iniciar          postgres    false    217                       0    0    tbl_det_roles_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('iniciar.tbl_det_roles_id_seq', 2, true);
          iniciar          neoalex    false    218                       0    0    tbl_detalle_de_cursos_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('iniciar.tbl_detalle_de_cursos_id_seq', 1, false);
          iniciar          postgres    false    221                       0    0    tbl_division_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('iniciar.tbl_division_id_seq', 1, true);
          iniciar          crduser    false    222                       0    0    tbl_imagenes_miembros_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('iniciar.tbl_imagenes_miembros_id_seq', 1, false);
          iniciar          postgres    false    225                       0    0    tbl_miembros_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('iniciar.tbl_miembros_id_seq', 21, true);
          iniciar          postgres    false    226                       0    0    tbl_miembros_posiciones_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('iniciar.tbl_miembros_posiciones_id_seq', 1, false);
          iniciar          postgres    false    229                       0    0    tbl_modulos_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('iniciar.tbl_modulos_id_seq', 1, false);
          iniciar          neoalex    false    230                       0    0    tbl_opciones_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('iniciar.tbl_opciones_id_seq', 1, true);
          iniciar          neoalex    false    232                       0    0    tbl_pais_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('iniciar.tbl_pais_id_seq', 1, false);
          iniciar          crduser    false    235                        0    0    tbl_paises_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('iniciar.tbl_paises_id_seq', 1, true);
          iniciar          crduser    false    236            !           0    0    tbl_posiciones_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('iniciar.tbl_posiciones_id_seq', 1, true);
          iniciar          postgres    false    237            "           0    0    tbl_roles_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('iniciar.tbl_roles_id_seq', 1, true);
          iniciar          neoalex    false    239            #           0    0    tbl_sedes_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('iniciar.tbl_sedes_id_seq', 1, true);
          iniciar          crduser    false    241            $           0    0    tbl_tipo_division_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('iniciar.tbl_tipo_division_id_seq', 1, false);
          iniciar          crduser    false    243            %           0    0    tbl_tipo_informacion_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('iniciar.tbl_tipo_informacion_id_seq', 1, false);
          iniciar          crduser    false    245            &           0    0    tbl_tipodivision_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('iniciar.tbl_tipodivision_id_seq', 7, true);
          iniciar          crduser    false    247            '           0    0    tbl_tipos_de_miembros_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('iniciar.tbl_tipos_de_miembros_id_seq', 4, true);
          iniciar          crduser    false    249            (           0    0    tbl_tipos_documentos_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('iniciar.tbl_tipos_documentos_id_seq', 2, true);
          iniciar          postgres    false    250            )           0    0    tbl_tipos_sedes_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('iniciar.tbl_tipos_sedes_id_seq', 3, true);
          iniciar          crduser    false    252            *           0    0 $   tbl_transacciones_de_miembros_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('iniciar.tbl_transacciones_de_miembros_id_seq', 1, true);
          iniciar          crduser    false    254            +           0    0    tbl_users_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('iniciar.tbl_users_id_seq', 33, true);
          iniciar          neoalex    false    256            ?           2606    17390 :    tbl_informacion_adicional  tbl_informacion_adicional_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY iniciar." tbl_informacion_adicional"
    ADD CONSTRAINT " tbl_informacion_adicional_pkey" PRIMARY KEY (id);
 i   ALTER TABLE ONLY iniciar." tbl_informacion_adicional" DROP CONSTRAINT " tbl_informacion_adicional_pkey";
       iniciar            crduser    false    210                       2606    17392 /   tbl_tipodivision PK_27eed919f4ed4d1fa2bd15e4405 
   CONSTRAINT     p   ALTER TABLE ONLY iniciar.tbl_tipodivision
    ADD CONSTRAINT "PK_27eed919f4ed4d1fa2bd15e4405" PRIMARY KEY (id);
 \   ALTER TABLE ONLY iniciar.tbl_tipodivision DROP CONSTRAINT "PK_27eed919f4ed4d1fa2bd15e4405";
       iniciar            crduser    false    246            ?           2606    17394    tbl_miembros pk_miembrocorreo 
   CONSTRAINT     Z   ALTER TABLE ONLY iniciar.tbl_miembros
    ADD CONSTRAINT pk_miembrocorreo UNIQUE (email);
 H   ALTER TABLE ONLY iniciar.tbl_miembros DROP CONSTRAINT pk_miembrocorreo;
       iniciar            crduser    false    227            ?           2606    17396 $   tbl_miembros pk_miembrodocumentotipo 
   CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_miembros
    ADD CONSTRAINT pk_miembrodocumentotipo UNIQUE (documento) INCLUDE (id_tipo_documento);
 O   ALTER TABLE ONLY iniciar.tbl_miembros DROP CONSTRAINT pk_miembrodocumentotipo;
       iniciar            crduser    false    227    227            ?           2606    17398 *   tbl_area_de_accion tbl_area_de_accion_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY iniciar.tbl_area_de_accion
    ADD CONSTRAINT tbl_area_de_accion_pkey PRIMARY KEY (id);
 U   ALTER TABLE ONLY iniciar.tbl_area_de_accion DROP CONSTRAINT tbl_area_de_accion_pkey;
       iniciar            crduser    false    212            ?           2606    17400    tbl_areas tbl_areas_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY iniciar.tbl_areas
    ADD CONSTRAINT tbl_areas_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY iniciar.tbl_areas DROP CONSTRAINT tbl_areas_pkey;
       iniciar            crduser    false    215            ?           2606    17402    tbl_cursos tbl_cursos_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY iniciar.tbl_cursos
    ADD CONSTRAINT tbl_cursos_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY iniciar.tbl_cursos DROP CONSTRAINT tbl_cursos_pkey;
       iniciar            postgres    false    216            ?           2606    17404     tbl_det_roles tbl_det_roles_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY iniciar.tbl_det_roles
    ADD CONSTRAINT tbl_det_roles_pkey PRIMARY KEY (id);
 K   ALTER TABLE ONLY iniciar.tbl_det_roles DROP CONSTRAINT tbl_det_roles_pkey;
       iniciar            crduser    false    219            ?           2606    17406 0   tbl_detalle_de_cursos tbl_detalle_de_cursos_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY iniciar.tbl_detalle_de_cursos
    ADD CONSTRAINT tbl_detalle_de_cursos_pkey PRIMARY KEY (id);
 [   ALTER TABLE ONLY iniciar.tbl_detalle_de_cursos DROP CONSTRAINT tbl_detalle_de_cursos_pkey;
       iniciar            postgres    false    220            ?           2606    17408    tbl_division tbl_division_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY iniciar.tbl_division
    ADD CONSTRAINT tbl_division_pkey PRIMARY KEY (id);
 I   ALTER TABLE ONLY iniciar.tbl_division DROP CONSTRAINT tbl_division_pkey;
       iniciar            crduser    false    223            ?           2606    17410 0   tbl_imagenes_miembros tbl_imagenes_miembros_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY iniciar.tbl_imagenes_miembros
    ADD CONSTRAINT tbl_imagenes_miembros_pkey PRIMARY KEY (id);
 [   ALTER TABLE ONLY iniciar.tbl_imagenes_miembros DROP CONSTRAINT tbl_imagenes_miembros_pkey;
       iniciar            postgres    false    224            ?           2606    17412    tbl_miembros tbl_miembros_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY iniciar.tbl_miembros
    ADD CONSTRAINT tbl_miembros_pkey PRIMARY KEY (id);
 I   ALTER TABLE ONLY iniciar.tbl_miembros DROP CONSTRAINT tbl_miembros_pkey;
       iniciar            crduser    false    227            ?           2606    17414 4   tbl_miembros_posiciones tbl_miembros_posiciones_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY iniciar.tbl_miembros_posiciones
    ADD CONSTRAINT tbl_miembros_posiciones_pkey PRIMARY KEY (id);
 _   ALTER TABLE ONLY iniciar.tbl_miembros_posiciones DROP CONSTRAINT tbl_miembros_posiciones_pkey;
       iniciar            postgres    false    228                        2606    17416    tbl_modulos tbl_modulos_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY iniciar.tbl_modulos
    ADD CONSTRAINT tbl_modulos_pkey PRIMARY KEY (id);
 G   ALTER TABLE ONLY iniciar.tbl_modulos DROP CONSTRAINT tbl_modulos_pkey;
       iniciar            crduser    false    231                       2606    17418    tbl_opciones tbl_opciones_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY iniciar.tbl_opciones
    ADD CONSTRAINT tbl_opciones_pkey PRIMARY KEY (id);
 I   ALTER TABLE ONLY iniciar.tbl_opciones DROP CONSTRAINT tbl_opciones_pkey;
       iniciar            crduser    false    233                       2606    17420    tbl_paises tbl_pais_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY iniciar.tbl_paises
    ADD CONSTRAINT tbl_pais_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY iniciar.tbl_paises DROP CONSTRAINT tbl_pais_pkey;
       iniciar            crduser    false    234                       2606    17422 "   tbl_posiciones tbl_posiciones_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY iniciar.tbl_posiciones
    ADD CONSTRAINT tbl_posiciones_pkey PRIMARY KEY (id);
 M   ALTER TABLE ONLY iniciar.tbl_posiciones DROP CONSTRAINT tbl_posiciones_pkey;
       iniciar            crduser    false    238                       2606    17424    tbl_roles tbl_roles_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY iniciar.tbl_roles
    ADD CONSTRAINT tbl_roles_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY iniciar.tbl_roles DROP CONSTRAINT tbl_roles_pkey;
       iniciar            crduser    false    240            
           2606    17426    tbl_sedes tbl_sedes_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY iniciar.tbl_sedes
    ADD CONSTRAINT tbl_sedes_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY iniciar.tbl_sedes DROP CONSTRAINT tbl_sedes_pkey;
       iniciar            crduser    false    242                       2606    17428 .   tbl_tipo_informacion tbl_tipo_informacion_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY iniciar.tbl_tipo_informacion
    ADD CONSTRAINT tbl_tipo_informacion_pkey PRIMARY KEY (id);
 Y   ALTER TABLE ONLY iniciar.tbl_tipo_informacion DROP CONSTRAINT tbl_tipo_informacion_pkey;
       iniciar            crduser    false    244                       2606    17430 0   tbl_tipos_de_miembros tbl_tipos_de_miembros_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY iniciar.tbl_tipos_de_miembros
    ADD CONSTRAINT tbl_tipos_de_miembros_pkey PRIMARY KEY (id);
 [   ALTER TABLE ONLY iniciar.tbl_tipos_de_miembros DROP CONSTRAINT tbl_tipos_de_miembros_pkey;
       iniciar            crduser    false    248                       2606    17432 .   tbl_tipos_documentos tbl_tipos_documentos_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY iniciar.tbl_tipos_documentos
    ADD CONSTRAINT tbl_tipos_documentos_pkey PRIMARY KEY (id);
 Y   ALTER TABLE ONLY iniciar.tbl_tipos_documentos DROP CONSTRAINT tbl_tipos_documentos_pkey;
       iniciar            crduser    false    251                       2606    17434 $   tbl_tipos_sedes tbl_tipos_sedes_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY iniciar.tbl_tipos_sedes
    ADD CONSTRAINT tbl_tipos_sedes_pkey PRIMARY KEY (id);
 O   ALTER TABLE ONLY iniciar.tbl_tipos_sedes DROP CONSTRAINT tbl_tipos_sedes_pkey;
       iniciar            crduser    false    253                       2606    17436 @   tbl_transacciones_de_miembros tbl_transacciones_de_miembros_pkey 
   CONSTRAINT        ALTER TABLE ONLY iniciar.tbl_transacciones_de_miembros
    ADD CONSTRAINT tbl_transacciones_de_miembros_pkey PRIMARY KEY (id);
 k   ALTER TABLE ONLY iniciar.tbl_transacciones_de_miembros DROP CONSTRAINT tbl_transacciones_de_miembros_pkey;
       iniciar            crduser    false    255                       2606    17438    tbl_users tbl_users_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY iniciar.tbl_users
    ADD CONSTRAINT tbl_users_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY iniciar.tbl_users DROP CONSTRAINT tbl_users_pkey;
       iniciar            crduser    false    257                       2606    17440    tbl_users tbl_users_usuario_key 
   CONSTRAINT     ^   ALTER TABLE ONLY iniciar.tbl_users
    ADD CONSTRAINT tbl_users_usuario_key UNIQUE (usuario);
 J   ALTER TABLE ONLY iniciar.tbl_users DROP CONSTRAINT tbl_users_usuario_key;
       iniciar            crduser    false    257            +           2620    17441    tbl_miembros tr_miembro    TRIGGER     ?   CREATE TRIGGER tr_miembro BEFORE UPDATE ON iniciar.tbl_miembros FOR EACH ROW EXECUTE FUNCTION iniciar.spt_movimiento_miembros();
 1   DROP TRIGGER tr_miembro ON iniciar.tbl_miembros;
       iniciar          crduser    false    258    227                       2606    17442 !   tbl_area_de_accion FK_accion_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_area_de_accion
    ADD CONSTRAINT "FK_accion_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 N   ALTER TABLE ONLY iniciar.tbl_area_de_accion DROP CONSTRAINT "FK_accion_pais";
       iniciar          crduser    false    212    3332    234                       2606    17447 '    tbl_informacion_adicional FK_adic_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar." tbl_informacion_adicional"
    ADD CONSTRAINT "FK_adic_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 V   ALTER TABLE ONLY iniciar." tbl_informacion_adicional" DROP CONSTRAINT "FK_adic_pais";
       iniciar          crduser    false    234    210    3332                       2606    17452    tbl_areas FK_area_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_areas
    ADD CONSTRAINT "FK_area_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 C   ALTER TABLE ONLY iniciar.tbl_areas DROP CONSTRAINT "FK_area_pais";
       iniciar          crduser    false    215    3332    234            &           2606    17457    tbl_tipodivision FK_div_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_tipodivision
    ADD CONSTRAINT "FK_div_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 I   ALTER TABLE ONLY iniciar.tbl_tipodivision DROP CONSTRAINT "FK_div_pais";
       iniciar          crduser    false    246    3332    234            "           2606    17462    tbl_miembros FK_miembro_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_miembros
    ADD CONSTRAINT "FK_miembro_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 I   ALTER TABLE ONLY iniciar.tbl_miembros DROP CONSTRAINT "FK_miembro_pais";
       iniciar          crduser    false    227    3332    234            #           2606    17467    tbl_posiciones FK_posicion_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_posiciones
    ADD CONSTRAINT "FK_posicion_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 L   ALTER TABLE ONLY iniciar.tbl_posiciones DROP CONSTRAINT "FK_posicion_pais";
       iniciar          crduser    false    238    3332    234            $           2606    17472    tbl_sedes FK_sede_paises    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_sedes
    ADD CONSTRAINT "FK_sede_paises" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 E   ALTER TABLE ONLY iniciar.tbl_sedes DROP CONSTRAINT "FK_sede_paises";
       iniciar          crduser    false    242    3332    234            %           2606    17477 )   tbl_tipo_informacion FK_tinformacion_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_tipo_informacion
    ADD CONSTRAINT "FK_tinformacion_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 V   ALTER TABLE ONLY iniciar.tbl_tipo_informacion DROP CONSTRAINT "FK_tinformacion_pais";
       iniciar          crduser    false    234    3332    244            )           2606    17482 !   tbl_tipos_sedes FK_tipo_sede_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_tipos_sedes
    ADD CONSTRAINT "FK_tipo_sede_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 N   ALTER TABLE ONLY iniciar.tbl_tipos_sedes DROP CONSTRAINT "FK_tipo_sede_pais";
       iniciar          crduser    false    3332    253    234            '           2606    17487 +   tbl_tipos_de_miembros FK_tiposmiembros_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_tipos_de_miembros
    ADD CONSTRAINT "FK_tiposmiembros_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 X   ALTER TABLE ONLY iniciar.tbl_tipos_de_miembros DROP CONSTRAINT "FK_tiposmiembros_pais";
       iniciar          crduser    false    248    234    3332                       2606    17492    tbl_detalle_de_cursos Fk_Cursos    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_detalle_de_cursos
    ADD CONSTRAINT "Fk_Cursos" FOREIGN KEY (id_curso) REFERENCES iniciar.tbl_cursos(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 L   ALTER TABLE ONLY iniciar.tbl_detalle_de_cursos DROP CONSTRAINT "Fk_Cursos";
       iniciar          postgres    false    220    3310    216                       2606    17497 '    tbl_informacion_adicional Fk_adic_tipo    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar." tbl_informacion_adicional"
    ADD CONSTRAINT "Fk_adic_tipo" FOREIGN KEY (id_tipo_informacion) REFERENCES iniciar.tbl_tipo_informacion(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 V   ALTER TABLE ONLY iniciar." tbl_informacion_adicional" DROP CONSTRAINT "Fk_adic_tipo";
       iniciar          crduser    false    210    3340    244                        2606    17502    tbl_division Fk_division_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_division
    ADD CONSTRAINT "Fk_division_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 J   ALTER TABLE ONLY iniciar.tbl_division DROP CONSTRAINT "Fk_division_pais";
       iniciar          crduser    false    223    3332    234            *           2606    17507 )   tbl_transacciones_de_miembros Fk_miembros    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_transacciones_de_miembros
    ADD CONSTRAINT "Fk_miembros" FOREIGN KEY (id_miembro) REFERENCES iniciar.tbl_miembros(id) NOT VALID;
 V   ALTER TABLE ONLY iniciar.tbl_transacciones_de_miembros DROP CONSTRAINT "Fk_miembros";
       iniciar          crduser    false    255    3324    227            (           2606    17512 +   tbl_tipos_documentos Fk_tipo_documento_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_tipos_documentos
    ADD CONSTRAINT "Fk_tipo_documento_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 X   ALTER TABLE ONLY iniciar.tbl_tipos_documentos DROP CONSTRAINT "Fk_tipo_documento_pais";
       iniciar          crduser    false    234    251    3332            !           2606    17517 /   tbl_division tbl_division_id_tipo_division_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_division
    ADD CONSTRAINT tbl_division_id_tipo_division_fkey FOREIGN KEY (id_tipo_division) REFERENCES iniciar.tbl_tipodivision(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 Z   ALTER TABLE ONLY iniciar.tbl_division DROP CONSTRAINT tbl_division_id_tipo_division_fkey;
       iniciar          crduser    false    223    3342    246            ?      x?????? ? ?      ?      x?????? ? ?      ?   c   x?3?4B?ҲԼ?ҔN???̲|μԴ?ĜL????Ģ?|????????\N###]c]#KCc+c+??yɉE??)?
)??1~p????? "?      ?      x?????? ? ?      ?   {   x?3?4C???̲|μԴ?ĜL????Ģ?|????????\N##c]C]cC+c+C=KS??*?4 4?t?KN,JOL?WHIU??r??0"?C+c=cCK?% JpZ???? ?o6?      ?      x?????? ? ?      ?   V   x?3?4??ļ?|???̼?| ?3/1?$?,??/5?$1'3(?8?(3?????H??X??R???????? ?:?
9c???+F??? )?      ?      x?????? ? ?      ?   ?   x?U??
?0?ϛ????&??ɖ?=赗5?H?E||SE???}3??@?x??OOw?~Z{?????p??E?.?Q????2?6?F$?Ri4???n?!L??ޭku?.?|n?
URT?$l??Ք+m??O???Dm?-??T?`????m??d??'?2M;Ib̅/e?:?      ?      x?????? ? ?      ?   1   x?3?4???O)??WHIU??)?+I,??W?2?tL.?,#?X?=... ?.?      ?   v   x?]?;
?0@g??@?d;?xj)]s/?v? ??	=?c???c`??*????/-R?G??<eU?퐮??l?+涁#????u.?=?D??O??????c??)͖j?i?MBc??g"?      ?   d   x?3?424????J-8?+)'39Q?%?73??K?t?"_N??|NCcSNsS 陗?\?Y?ϙQRRPl??_TZ????????Z????????? j??      ?   t   x?3?4?°??Ҽ?Ģ??b /Ə?1?$?,?3/5?$1'S?(?$鐞????????id`d?k`?kl?`hheldeb?gja?횗?X???????
2
M??????9H"Ə+F??? 
#      ?   f   x?3?4??҂Ԣ??????bN???̲|μԴ?ĜL????Ģ?|????????\N###]c]#KCc+c+??yɉE??)?
)??1~p????? ???      ?   R   x?3?4??ԔT???????N??N???̲|N?Դ?ĜL????Ģ?|N###]c]#KCc+c+?jT????? ??o      ?      x?????? ? ?      ?   ?   x??ӱ? ??????`4vk?? 1?]nP??4` ???????7?r????d?>8?)?h?,udP??'{?????R?[??փCyU???h?lĎ??????8??Q??>>j???st0??UĖ?????Fc????{???/T???????_{?*r+J?M0?i      ?   C   x?3?4???)?+I,??W??tL.?,[?Y?e?ձ81hgb
?lM?2A?k??????=... ?=?      ?   p   x?3?4?H,N,?/*I?tL.?,???KM+I???/N,??O?4202?50?56T04?22?25г00???CC\?@??SSJs??6??T???a?c+cs=#c?m\1z\\\ ?.6      ?   Y   x?3?4B?ԔT?Լ???N???̲|μԴ?Ĝ̢"s????????\N###]c]##+j/-.M,??????#?=... w?      ?   ?   x???K
?0?ur?\?!?4+?k=??4?2??-?????T?0??????/???p??v????+C-???xV???ҕ??60?п!g???
??!?퐢??>!??%????????iN?1f????q???SB??Ps1)Lz2Zr?RW??h&?I??	O???KkN)}M˨?      ?   ?   x??A?0 ??ۯ??kcoKJO??bF!^?KE??,?}}|Z?B K????q??????V??W5Gɓ?xI??7:?M?2????e??]^,??7O?z????Fa(λ??м?? J*????2??@?ЈPe???<?'      