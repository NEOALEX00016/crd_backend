PGDMP     .                    {            cr    14.6    14.6 ?    /           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            0           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            1           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            2           1262    66778    cr    DATABASE     k   CREATE DATABASE cr WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Dominican Republic.1252';
    DROP DATABASE cr;
                postgres    false                        2615    66779    iniciar    SCHEMA        CREATE SCHEMA iniciar;
    DROP SCHEMA iniciar;
                crduser    false            3           0    0    SCHEMA iniciar    COMMENT     U   COMMENT ON SCHEMA iniciar IS 'ESTO ALMACENA TODOS LOS USUARIOS Y OPCIONES DEL MENU';
                   crduser    false    6            4           0    0    SCHEMA iniciar    ACL     e   REVOKE ALL ON SCHEMA iniciar FROM crduser;
GRANT ALL ON SCHEMA iniciar TO crduser WITH GRANT OPTION;
                   crduser    false    6            :           1255    68377    spt_movimiento_miembros()    FUNCTION     ?  CREATE FUNCTION iniciar.spt_movimiento_miembros() RETURNS trigger
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
       iniciar          postgres    false    6                       1259    67408     tbl_informacion_adicional    TABLE     )  CREATE TABLE iniciar." tbl_informacion_adicional" (
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
       iniciar         heap    crduser    false    6            5           0    0 "   TABLE " tbl_informacion_adicional"    COMMENT     ?   COMMENT ON TABLE iniciar." tbl_informacion_adicional" IS 'Aqui se almacena los diferentes tipos de informacion relacionada a un miembro';
          iniciar          crduser    false    277                       1259    67407 !    tbl_informacion_adicional_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar." tbl_informacion_adicional_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE iniciar." tbl_informacion_adicional_id_seq";
       iniciar          crduser    false    277    6            6           0    0 !    tbl_informacion_adicional_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE iniciar." tbl_informacion_adicional_id_seq" OWNED BY iniciar." tbl_informacion_adicional".id;
          iniciar          crduser    false    276                       1259    67333    tbl_area_de_accion    TABLE       CREATE TABLE iniciar.tbl_area_de_accion (
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
       iniciar         heap    crduser    false    6            7           0    0    TABLE tbl_area_de_accion    COMMENT     B   COMMENT ON TABLE iniciar.tbl_area_de_accion IS 'Area de Accion ';
          iniciar          crduser    false    273                       1259    67332    tbl_area_de_accion_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar.tbl_area_de_accion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE iniciar.tbl_area_de_accion_id_seq;
       iniciar          crduser    false    6    273            8           0    0    tbl_area_de_accion_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE iniciar.tbl_area_de_accion_id_seq OWNED BY iniciar.tbl_area_de_accion.id;
          iniciar          crduser    false    272            "           1259    67947    tbl_areas_id_seq    SEQUENCE     z   CREATE SEQUENCE iniciar.tbl_areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE iniciar.tbl_areas_id_seq;
       iniciar          crduser    false    6            #           1259    67962 	   tbl_areas    TABLE     Z  CREATE TABLE iniciar.tbl_areas (
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
       iniciar         heap    crduser    false    290    6            9           0    0    TABLE tbl_areas    COMMENT     S   COMMENT ON TABLE iniciar.tbl_areas IS 'Esto almacendra todas las areas por sedes';
          iniciar          crduser    false    291            ?            1259    66781    tbl_det_roles_id_seq    SEQUENCE     ~   CREATE SEQUENCE iniciar.tbl_det_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE iniciar.tbl_det_roles_id_seq;
       iniciar          neoalex    false    6            :           0    0    SEQUENCE tbl_det_roles_id_seq    ACL     ?   GRANT ALL ON SEQUENCE iniciar.tbl_det_roles_id_seq TO crduser;
          iniciar          neoalex    false    211            ?            1259    66782    tbl_det_roles    TABLE     ?  CREATE TABLE iniciar.tbl_det_roles (
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
       iniciar         heap    crduser    false    211    6                       1259    67762    tbl_division_id_seq    SEQUENCE     }   CREATE SEQUENCE iniciar.tbl_division_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE iniciar.tbl_division_id_seq;
       iniciar          crduser    false    6                       1259    67763    tbl_division    TABLE     \  CREATE TABLE iniciar.tbl_division (
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
       iniciar         heap    crduser    false    284    6            ;           0    0    TABLE tbl_division    COMMENT     N   COMMENT ON TABLE iniciar.tbl_division IS 'Tabla de Divisiones de los paises';
          iniciar          crduser    false    285            )           1259    68177    tbl_miembros_id_seq    SEQUENCE     }   CREATE SEQUENCE iniciar.tbl_miembros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE iniciar.tbl_miembros_id_seq;
       iniciar          postgres    false    6            <           0    0    SEQUENCE tbl_miembros_id_seq    ACL     >   GRANT ALL ON SEQUENCE iniciar.tbl_miembros_id_seq TO crduser;
          iniciar          postgres    false    297            *           1259    68178    tbl_miembros    TABLE     0  CREATE TABLE iniciar.tbl_miembros (
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
       iniciar         heap    crduser    false    297    6            =           0    0    TABLE tbl_miembros    COMMENT     j   COMMENT ON TABLE iniciar.tbl_miembros IS 'Esto almacena todo los miembro tanto voluntario asalariado y ';
          iniciar          crduser    false    298            ,           1259    68335    tbl_miembros_posiciones    TABLE     	  CREATE TABLE iniciar.tbl_miembros_posiciones (
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
       iniciar         heap    postgres    false    6            >           0    0    TABLE tbl_miembros_posiciones    COMMENT     ?   COMMENT ON TABLE iniciar.tbl_miembros_posiciones IS 'Esta Tabla Contiene los Miembros y las Posiciones  asociadas a este miembro';
          iniciar          postgres    false    300            +           1259    68334    tbl_miembros_posiciones_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar.tbl_miembros_posiciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE iniciar.tbl_miembros_posiciones_id_seq;
       iniciar          postgres    false    300    6            ?           0    0    tbl_miembros_posiciones_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE iniciar.tbl_miembros_posiciones_id_seq OWNED BY iniciar.tbl_miembros_posiciones.id;
          iniciar          postgres    false    299            ?            1259    66786    tbl_modulos_id_seq    SEQUENCE     |   CREATE SEQUENCE iniciar.tbl_modulos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE iniciar.tbl_modulos_id_seq;
       iniciar          neoalex    false    6            ?            1259    66787    tbl_modulos    TABLE     ?   CREATE TABLE iniciar.tbl_modulos (
    id bigint DEFAULT nextval('iniciar.tbl_modulos_id_seq'::regclass) NOT NULL,
    id_pais bigint NOT NULL,
    descripcion character(100) NOT NULL,
    estado character(50) NOT NULL
);
     DROP TABLE iniciar.tbl_modulos;
       iniciar         heap    crduser    false    213    6            @           0    0    TABLE tbl_modulos    COMMENT     |   COMMENT ON TABLE iniciar.tbl_modulos IS 'almacena todos los modulos de la aplicacion en principio solo es los voluntarios';
          iniciar          crduser    false    214            ?            1259    66791    tbl_opciones_id_seq    SEQUENCE     }   CREATE SEQUENCE iniciar.tbl_opciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE iniciar.tbl_opciones_id_seq;
       iniciar          neoalex    false    6            A           0    0    SEQUENCE tbl_opciones_id_seq    ACL     >   GRANT ALL ON SEQUENCE iniciar.tbl_opciones_id_seq TO crduser;
          iniciar          neoalex    false    215            ?            1259    66792    tbl_opciones    TABLE     @  CREATE TABLE iniciar.tbl_opciones (
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
       iniciar         heap    crduser    false    215    6            B           0    0    TABLE tbl_opciones    COMMENT     g   COMMENT ON TABLE iniciar.tbl_opciones IS 'esto almacena todas las opciones del menu de la aplicacion';
          iniciar          crduser    false    216                       1259    67204 
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
       iniciar         heap    crduser    false    6            C           0    0    TABLE tbl_paises    COMMENT     U   COMMENT ON TABLE iniciar.tbl_paises IS 'Tabla Donde se almacenara todos los paises';
          iniciar          crduser    false    269                       1259    67203    tbl_pais_id_seq    SEQUENCE     y   CREATE SEQUENCE iniciar.tbl_pais_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE iniciar.tbl_pais_id_seq;
       iniciar          crduser    false    269    6            D           0    0    tbl_pais_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE iniciar.tbl_pais_id_seq OWNED BY iniciar.tbl_paises.id;
          iniciar          crduser    false    268                       1259    67477    tbl_paises_id_seq    SEQUENCE     {   CREATE SEQUENCE iniciar.tbl_paises_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE iniciar.tbl_paises_id_seq;
       iniciar          crduser    false    269    6            E           0    0    tbl_paises_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE iniciar.tbl_paises_id_seq OWNED BY iniciar.tbl_paises.id;
          iniciar          crduser    false    280            %           1259    68101    tbl_posiciones_id_seq    SEQUENCE        CREATE SEQUENCE iniciar.tbl_posiciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE iniciar.tbl_posiciones_id_seq;
       iniciar          postgres    false    6            F           0    0    SEQUENCE tbl_posiciones_id_seq    ACL     @   GRANT ALL ON SEQUENCE iniciar.tbl_posiciones_id_seq TO crduser;
          iniciar          postgres    false    293            &           1259    68102    tbl_posiciones    TABLE     ?  CREATE TABLE iniciar.tbl_posiciones (
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
       iniciar         heap    crduser    false    293    6            G           0    0    TABLE tbl_posiciones    COMMENT     h   COMMENT ON TABLE iniciar.tbl_posiciones IS 'Esto almacena las posiciones disponibles por area y sede ';
          iniciar          crduser    false    294            H           0    0    COLUMN tbl_posiciones.id_rol    COMMENT     K   COMMENT ON COLUMN iniciar.tbl_posiciones.id_rol IS 'esto es para los rol';
          iniciar          crduser    false    294            ?            1259    66796    tbl_roles_id_seq    SEQUENCE     z   CREATE SEQUENCE iniciar.tbl_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE iniciar.tbl_roles_id_seq;
       iniciar          neoalex    false    6            I           0    0    SEQUENCE tbl_roles_id_seq    ACL     ;   GRANT ALL ON SEQUENCE iniciar.tbl_roles_id_seq TO crduser;
          iniciar          neoalex    false    217            $           1259    68032 	   tbl_roles    TABLE     a  CREATE TABLE iniciar.tbl_roles (
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
       iniciar         heap    crduser    false    217    6            J           0    0    TABLE tbl_roles    COMMENT     A   COMMENT ON TABLE iniciar.tbl_roles IS 'Definicion de los roles';
          iniciar          crduser    false    292                        1259    67904    tbl_sedes_id_seq    SEQUENCE     z   CREATE SEQUENCE iniciar.tbl_sedes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE iniciar.tbl_sedes_id_seq;
       iniciar          crduser    false    6            !           1259    67905 	   tbl_sedes    TABLE     ?  CREATE TABLE iniciar.tbl_sedes (
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
       iniciar         heap    crduser    false    288    6            K           0    0    TABLE tbl_sedes    COMMENT     P   COMMENT ON TABLE iniciar.tbl_sedes IS 'Son las diferentes sedes de los paises';
          iniciar          crduser    false    289                       1259    67697    tbl_tipo_division_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar.tbl_tipo_division_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE iniciar.tbl_tipo_division_id_seq;
       iniciar          crduser    false    6                       1259    67357    tbl_tipo_informacion    TABLE     ?  CREATE TABLE iniciar.tbl_tipo_informacion (
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
       iniciar         heap    crduser    false    6            L           0    0    TABLE tbl_tipo_informacion    COMMENT     }   COMMENT ON TABLE iniciar.tbl_tipo_informacion IS 'Esto almacendra los diferentes tipos de informacion para los voluntarios';
          iniciar          crduser    false    275                       1259    67356    tbl_tipo_informacion_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar.tbl_tipo_informacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE iniciar.tbl_tipo_informacion_id_seq;
       iniciar          crduser    false    6    275            M           0    0    tbl_tipo_informacion_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE iniciar.tbl_tipo_informacion_id_seq OWNED BY iniciar.tbl_tipo_informacion.id;
          iniciar          crduser    false    274                       1259    67739    tbl_tipodivision    TABLE     ?  CREATE TABLE iniciar.tbl_tipodivision (
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
       iniciar         heap    crduser    false    6                       1259    67738    tbl_tipodivision_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar.tbl_tipodivision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE iniciar.tbl_tipodivision_id_seq;
       iniciar          crduser    false    6    283            N           0    0    tbl_tipodivision_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE iniciar.tbl_tipodivision_id_seq OWNED BY iniciar.tbl_tipodivision.id;
          iniciar          crduser    false    282                       1259    67301    tbl_tipos_de_miembros    TABLE     ?   CREATE TABLE iniciar.tbl_tipos_de_miembros (
    id bigint NOT NULL,
    id_pais bigint NOT NULL,
    descripcion character(100) NOT NULL,
    estado character(10) NOT NULL,
    calcular_tiempo boolean
);
 *   DROP TABLE iniciar.tbl_tipos_de_miembros;
       iniciar         heap    crduser    false    6            O           0    0    TABLE tbl_tipos_de_miembros    COMMENT     \   COMMENT ON TABLE iniciar.tbl_tipos_de_miembros IS 'Esto almacena todos Tipos de miembros ';
          iniciar          crduser    false    271                       1259    67300    tbl_tipos_de_miembros_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar.tbl_tipos_de_miembros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE iniciar.tbl_tipos_de_miembros_id_seq;
       iniciar          crduser    false    6    271            P           0    0    tbl_tipos_de_miembros_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE iniciar.tbl_tipos_de_miembros_id_seq OWNED BY iniciar.tbl_tipos_de_miembros.id;
          iniciar          crduser    false    270            '           1259    68134    tbl_tipos_documentos_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar.tbl_tipos_documentos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE iniciar.tbl_tipos_documentos_id_seq;
       iniciar          postgres    false    6            Q           0    0 $   SEQUENCE tbl_tipos_documentos_id_seq    ACL     F   GRANT ALL ON SEQUENCE iniciar.tbl_tipos_documentos_id_seq TO crduser;
          iniciar          postgres    false    295            (           1259    68135    tbl_tipos_documentos    TABLE     X  CREATE TABLE iniciar.tbl_tipos_documentos (
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
       iniciar         heap    crduser    false    295    6            R           0    0    TABLE tbl_tipos_documentos    COMMENT     S   COMMENT ON TABLE iniciar.tbl_tipos_documentos IS 'tipos de Documentos por paises';
          iniciar          crduser    false    296                       1259    67848    tbl_tipos_sedes_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar.tbl_tipos_sedes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE iniciar.tbl_tipos_sedes_id_seq;
       iniciar          crduser    false    6                       1259    67849    tbl_tipos_sedes    TABLE     o  CREATE TABLE iniciar.tbl_tipos_sedes (
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
       iniciar         heap    crduser    false    286    6            S           0    0    TABLE tbl_tipos_sedes    COMMENT     k   COMMENT ON TABLE iniciar.tbl_tipos_sedes IS 'Alamacena los tipos de sedes dependendiendo de la division ';
          iniciar          crduser    false    287            -           1259    68345 $   tbl_transacciones_de_miembros_id_seq    SEQUENCE     ?   CREATE SEQUENCE iniciar.tbl_transacciones_de_miembros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE iniciar.tbl_transacciones_de_miembros_id_seq;
       iniciar          crduser    false    6            .           1259    68346    tbl_transacciones_de_miembros    TABLE     y  CREATE TABLE iniciar.tbl_transacciones_de_miembros (
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
       iniciar         heap    crduser    false    301    6            T           0    0 #   TABLE tbl_transacciones_de_miembros    COMMENT     v   COMMENT ON TABLE iniciar.tbl_transacciones_de_miembros IS 'Esto Almacenara todas las transacciones de los miembros ';
          iniciar          crduser    false    302            ?            1259    66802    tbl_users_id_seq    SEQUENCE     z   CREATE SEQUENCE iniciar.tbl_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE iniciar.tbl_users_id_seq;
       iniciar          neoalex    false    6            U           0    0    SEQUENCE tbl_users_id_seq    ACL     ;   GRANT ALL ON SEQUENCE iniciar.tbl_users_id_seq TO crduser;
          iniciar          neoalex    false    218            ?            1259    66803 	   tbl_users    TABLE     ?  CREATE TABLE iniciar.tbl_users (
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
       iniciar         heap    crduser    false    218    6            ,           2604    67411     tbl_informacion_adicional id    DEFAULT     ?   ALTER TABLE ONLY iniciar." tbl_informacion_adicional" ALTER COLUMN id SET DEFAULT nextval('iniciar." tbl_informacion_adicional_id_seq"'::regclass);
 O   ALTER TABLE iniciar." tbl_informacion_adicional" ALTER COLUMN id DROP DEFAULT;
       iniciar          crduser    false    277    276    277            *           2604    67336    tbl_area_de_accion id    DEFAULT     ?   ALTER TABLE ONLY iniciar.tbl_area_de_accion ALTER COLUMN id SET DEFAULT nextval('iniciar.tbl_area_de_accion_id_seq'::regclass);
 E   ALTER TABLE iniciar.tbl_area_de_accion ALTER COLUMN id DROP DEFAULT;
       iniciar          crduser    false    272    273    273            8           2604    68338    tbl_miembros_posiciones id    DEFAULT     ?   ALTER TABLE ONLY iniciar.tbl_miembros_posiciones ALTER COLUMN id SET DEFAULT nextval('iniciar.tbl_miembros_posiciones_id_seq'::regclass);
 J   ALTER TABLE iniciar.tbl_miembros_posiciones ALTER COLUMN id DROP DEFAULT;
       iniciar          postgres    false    299    300    300            (           2604    67479    tbl_paises id    DEFAULT     p   ALTER TABLE ONLY iniciar.tbl_paises ALTER COLUMN id SET DEFAULT nextval('iniciar.tbl_paises_id_seq'::regclass);
 =   ALTER TABLE iniciar.tbl_paises ALTER COLUMN id DROP DEFAULT;
       iniciar          crduser    false    280    269            +           2604    67360    tbl_tipo_informacion id    DEFAULT     ?   ALTER TABLE ONLY iniciar.tbl_tipo_informacion ALTER COLUMN id SET DEFAULT nextval('iniciar.tbl_tipo_informacion_id_seq'::regclass);
 G   ALTER TABLE iniciar.tbl_tipo_informacion ALTER COLUMN id DROP DEFAULT;
       iniciar          crduser    false    274    275    275            -           2604    67742    tbl_tipodivision id    DEFAULT     |   ALTER TABLE ONLY iniciar.tbl_tipodivision ALTER COLUMN id SET DEFAULT nextval('iniciar.tbl_tipodivision_id_seq'::regclass);
 C   ALTER TABLE iniciar.tbl_tipodivision ALTER COLUMN id DROP DEFAULT;
       iniciar          crduser    false    283    282    283            )           2604    67304    tbl_tipos_de_miembros id    DEFAULT     ?   ALTER TABLE ONLY iniciar.tbl_tipos_de_miembros ALTER COLUMN id SET DEFAULT nextval('iniciar.tbl_tipos_de_miembros_id_seq'::regclass);
 H   ALTER TABLE iniciar.tbl_tipos_de_miembros ALTER COLUMN id DROP DEFAULT;
       iniciar          crduser    false    271    270    271                      0    67408     tbl_informacion_adicional 
   TABLE DATA           ?   COPY iniciar." tbl_informacion_adicional" (id, id_pais, id_miembro, id_tipo_informacion, valor, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    277   ?                 0    67333    tbl_area_de_accion 
   TABLE DATA           ?   COPY iniciar.tbl_area_de_accion (id, id_pais, id_area, id_sede, descripcion, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    273   *?       !          0    67962 	   tbl_areas 
   TABLE DATA           ?   COPY iniciar.tbl_areas (id, id_pais, id_sede, nombre, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    291   G?                 0    66782    tbl_det_roles 
   TABLE DATA           ?   COPY iniciar.tbl_det_roles (id, id_pais, id_roles, id_opcion, estado, agregado_por, agregado_en, modificado_por, modificado_en, leer, escribir, imprimir, eliminar, rol_agregado_id, rol_agregado_nom, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    212   ??                 0    67763    tbl_division 
   TABLE DATA           ?   COPY iniciar.tbl_division (id, id_pais, id_tipo_division, nombre, depende, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    285   E?       (          0    68178    tbl_miembros 
   TABLE DATA           ?  COPY iniciar.tbl_miembros (id, id_pais, id_sede, id_area, nombre, apellido, nacionalidad, lugar_de_nacimiento, fecha_de_nacimiento, id_tipo_documento, documento, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom, tiempo_voluntariado, email, fecha_de_registro, fecha_de_finalizacion, tipo_miembro) FROM stdin;
    iniciar          crduser    false    298   ??       *          0    68335    tbl_miembros_posiciones 
   TABLE DATA           ?   COPY iniciar.tbl_miembros_posiciones (id, id_pais, id_miembro, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          postgres    false    300   c?                 0    66787    tbl_modulos 
   TABLE DATA           H   COPY iniciar.tbl_modulos (id, id_pais, descripcion, estado) FROM stdin;
    iniciar          crduser    false    214   ??                 0    66792    tbl_opciones 
   TABLE DATA           ?   COPY iniciar.tbl_opciones (id, id_pais, descripcion, estado, agregado_por, agregado_en, modificado_por, modificado_en, rol_agregado_id, rol_agregado_nom, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    216   ??                 0    67204 
   tbl_paises 
   TABLE DATA           ?   COPY iniciar.tbl_paises (id, codigo, bandera, nombre, alpha2, alpha3, domains, habitantes, superficie, estado, ruta_bandera) FROM stdin;
    iniciar          crduser    false    269   G?       $          0    68102    tbl_posiciones 
   TABLE DATA             COPY iniciar.tbl_posiciones (id, id_pais, id_sede, id_area, id_rol, nombre, posiciones_disponible, depende, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    294   ??       "          0    68032 	   tbl_roles 
   TABLE DATA           ?   COPY iniciar.tbl_roles (id, id_pais, id_modulo, descripcion, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    292   ??                 0    67905 	   tbl_sedes 
   TABLE DATA           ?   COPY iniciar.tbl_sedes (id, id_pais, id_division, id_tipo_sede, nombre, voluntarios, depende, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    289   ??                 0    67357    tbl_tipo_informacion 
   TABLE DATA           ?   COPY iniciar.tbl_tipo_informacion (id, id_pais, id_sede, descripcion, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    275   ?                 0    67739    tbl_tipodivision 
   TABLE DATA           ?   COPY iniciar.tbl_tipodivision (id, id_pais, nombre, depende, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    283   4?                 0    67301    tbl_tipos_de_miembros 
   TABLE DATA           c   COPY iniciar.tbl_tipos_de_miembros (id, id_pais, descripcion, estado, calcular_tiempo) FROM stdin;
    iniciar          crduser    false    271   ??       &          0    68135    tbl_tipos_documentos 
   TABLE DATA           ?   COPY iniciar.tbl_tipos_documentos (id, id_pais, descripcion, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    296   ;?                 0    67849    tbl_tipos_sedes 
   TABLE DATA           ?   COPY iniciar.tbl_tipos_sedes (id, id_tipo_division, id_pais, nombre, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    287   ??       ,          0    68346    tbl_transacciones_de_miembros 
   TABLE DATA           ?   COPY iniciar.tbl_transacciones_de_miembros (id, id_miembro, descripcion, valor_anterior, valor_actual, estado, agregado_por, agregado_en, rol_agregado_id, rol_agregado_nom, modificado_por, modificado_en, rol_modificado_id, rol_modificado_nom) FROM stdin;
    iniciar          crduser    false    302   $?                 0    66803 	   tbl_users 
   TABLE DATA           t   COPY iniciar.tbl_users (id, id_pais, id_miembro, usuario, password, estado, agregado_en, modificado_en) FROM stdin;
    iniciar          crduser    false    219   ??       V           0    0 !    tbl_informacion_adicional_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('iniciar." tbl_informacion_adicional_id_seq"', 1, false);
          iniciar          crduser    false    276            W           0    0    tbl_area_de_accion_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('iniciar.tbl_area_de_accion_id_seq', 1, false);
          iniciar          crduser    false    272            X           0    0    tbl_areas_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('iniciar.tbl_areas_id_seq', 1, true);
          iniciar          crduser    false    290            Y           0    0    tbl_det_roles_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('iniciar.tbl_det_roles_id_seq', 2, true);
          iniciar          neoalex    false    211            Z           0    0    tbl_division_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('iniciar.tbl_division_id_seq', 1, true);
          iniciar          crduser    false    284            [           0    0    tbl_miembros_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('iniciar.tbl_miembros_id_seq', 21, true);
          iniciar          postgres    false    297            \           0    0    tbl_miembros_posiciones_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('iniciar.tbl_miembros_posiciones_id_seq', 1, false);
          iniciar          postgres    false    299            ]           0    0    tbl_modulos_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('iniciar.tbl_modulos_id_seq', 1, false);
          iniciar          neoalex    false    213            ^           0    0    tbl_opciones_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('iniciar.tbl_opciones_id_seq', 1, true);
          iniciar          neoalex    false    215            _           0    0    tbl_pais_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('iniciar.tbl_pais_id_seq', 1, false);
          iniciar          crduser    false    268            `           0    0    tbl_paises_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('iniciar.tbl_paises_id_seq', 1, true);
          iniciar          crduser    false    280            a           0    0    tbl_posiciones_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('iniciar.tbl_posiciones_id_seq', 1, true);
          iniciar          postgres    false    293            b           0    0    tbl_roles_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('iniciar.tbl_roles_id_seq', 1, true);
          iniciar          neoalex    false    217            c           0    0    tbl_sedes_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('iniciar.tbl_sedes_id_seq', 1, true);
          iniciar          crduser    false    288            d           0    0    tbl_tipo_division_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('iniciar.tbl_tipo_division_id_seq', 1, false);
          iniciar          crduser    false    281            e           0    0    tbl_tipo_informacion_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('iniciar.tbl_tipo_informacion_id_seq', 1, false);
          iniciar          crduser    false    274            f           0    0    tbl_tipodivision_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('iniciar.tbl_tipodivision_id_seq', 7, true);
          iniciar          crduser    false    282            g           0    0    tbl_tipos_de_miembros_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('iniciar.tbl_tipos_de_miembros_id_seq', 4, true);
          iniciar          crduser    false    270            h           0    0    tbl_tipos_documentos_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('iniciar.tbl_tipos_documentos_id_seq', 2, true);
          iniciar          postgres    false    295            i           0    0    tbl_tipos_sedes_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('iniciar.tbl_tipos_sedes_id_seq', 3, true);
          iniciar          crduser    false    286            j           0    0 $   tbl_transacciones_de_miembros_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('iniciar.tbl_transacciones_de_miembros_id_seq', 1, true);
          iniciar          crduser    false    301            k           0    0    tbl_users_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('iniciar.tbl_users_id_seq', 33, true);
          iniciar          neoalex    false    218            M           2606    67413 :    tbl_informacion_adicional  tbl_informacion_adicional_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY iniciar." tbl_informacion_adicional"
    ADD CONSTRAINT " tbl_informacion_adicional_pkey" PRIMARY KEY (id);
 i   ALTER TABLE ONLY iniciar." tbl_informacion_adicional" DROP CONSTRAINT " tbl_informacion_adicional_pkey";
       iniciar            crduser    false    277            O           2606    67746 /   tbl_tipodivision PK_27eed919f4ed4d1fa2bd15e4405 
   CONSTRAINT     p   ALTER TABLE ONLY iniciar.tbl_tipodivision
    ADD CONSTRAINT "PK_27eed919f4ed4d1fa2bd15e4405" PRIMARY KEY (id);
 \   ALTER TABLE ONLY iniciar.tbl_tipodivision DROP CONSTRAINT "PK_27eed919f4ed4d1fa2bd15e4405";
       iniciar            crduser    false    283            _           2606    68204    tbl_miembros pk_miembrocorreo 
   CONSTRAINT     Z   ALTER TABLE ONLY iniciar.tbl_miembros
    ADD CONSTRAINT pk_miembrocorreo UNIQUE (email);
 H   ALTER TABLE ONLY iniciar.tbl_miembros DROP CONSTRAINT pk_miembrocorreo;
       iniciar            crduser    false    298            a           2606    68273 $   tbl_miembros pk_miembrodocumentotipo 
   CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_miembros
    ADD CONSTRAINT pk_miembrodocumentotipo UNIQUE (documento) INCLUDE (id_tipo_documento);
 O   ALTER TABLE ONLY iniciar.tbl_miembros DROP CONSTRAINT pk_miembrodocumentotipo;
       iniciar            crduser    false    298    298            I           2606    67338 *   tbl_area_de_accion tbl_area_de_accion_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY iniciar.tbl_area_de_accion
    ADD CONSTRAINT tbl_area_de_accion_pkey PRIMARY KEY (id);
 U   ALTER TABLE ONLY iniciar.tbl_area_de_accion DROP CONSTRAINT tbl_area_de_accion_pkey;
       iniciar            crduser    false    273            W           2606    67969    tbl_areas tbl_areas_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY iniciar.tbl_areas
    ADD CONSTRAINT tbl_areas_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY iniciar.tbl_areas DROP CONSTRAINT tbl_areas_pkey;
       iniciar            crduser    false    291            ;           2606    66953     tbl_det_roles tbl_det_roles_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY iniciar.tbl_det_roles
    ADD CONSTRAINT tbl_det_roles_pkey PRIMARY KEY (id);
 K   ALTER TABLE ONLY iniciar.tbl_det_roles DROP CONSTRAINT tbl_det_roles_pkey;
       iniciar            crduser    false    212            Q           2606    67770    tbl_division tbl_division_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY iniciar.tbl_division
    ADD CONSTRAINT tbl_division_pkey PRIMARY KEY (id);
 I   ALTER TABLE ONLY iniciar.tbl_division DROP CONSTRAINT tbl_division_pkey;
       iniciar            crduser    false    285            c           2606    68185    tbl_miembros tbl_miembros_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY iniciar.tbl_miembros
    ADD CONSTRAINT tbl_miembros_pkey PRIMARY KEY (id);
 I   ALTER TABLE ONLY iniciar.tbl_miembros DROP CONSTRAINT tbl_miembros_pkey;
       iniciar            crduser    false    298            e           2606    68340 4   tbl_miembros_posiciones tbl_miembros_posiciones_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY iniciar.tbl_miembros_posiciones
    ADD CONSTRAINT tbl_miembros_posiciones_pkey PRIMARY KEY (id);
 _   ALTER TABLE ONLY iniciar.tbl_miembros_posiciones DROP CONSTRAINT tbl_miembros_posiciones_pkey;
       iniciar            postgres    false    300            =           2606    66955    tbl_modulos tbl_modulos_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY iniciar.tbl_modulos
    ADD CONSTRAINT tbl_modulos_pkey PRIMARY KEY (id);
 G   ALTER TABLE ONLY iniciar.tbl_modulos DROP CONSTRAINT tbl_modulos_pkey;
       iniciar            crduser    false    214            ?           2606    66957    tbl_opciones tbl_opciones_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY iniciar.tbl_opciones
    ADD CONSTRAINT tbl_opciones_pkey PRIMARY KEY (id);
 I   ALTER TABLE ONLY iniciar.tbl_opciones DROP CONSTRAINT tbl_opciones_pkey;
       iniciar            crduser    false    216            E           2606    67209    tbl_paises tbl_pais_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY iniciar.tbl_paises
    ADD CONSTRAINT tbl_pais_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY iniciar.tbl_paises DROP CONSTRAINT tbl_pais_pkey;
       iniciar            crduser    false    269            [           2606    68108 "   tbl_posiciones tbl_posiciones_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY iniciar.tbl_posiciones
    ADD CONSTRAINT tbl_posiciones_pkey PRIMARY KEY (id);
 M   ALTER TABLE ONLY iniciar.tbl_posiciones DROP CONSTRAINT tbl_posiciones_pkey;
       iniciar            crduser    false    294            Y           2606    68039    tbl_roles tbl_roles_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY iniciar.tbl_roles
    ADD CONSTRAINT tbl_roles_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY iniciar.tbl_roles DROP CONSTRAINT tbl_roles_pkey;
       iniciar            crduser    false    292            U           2606    67911    tbl_sedes tbl_sedes_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY iniciar.tbl_sedes
    ADD CONSTRAINT tbl_sedes_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY iniciar.tbl_sedes DROP CONSTRAINT tbl_sedes_pkey;
       iniciar            crduser    false    289            K           2606    67362 .   tbl_tipo_informacion tbl_tipo_informacion_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY iniciar.tbl_tipo_informacion
    ADD CONSTRAINT tbl_tipo_informacion_pkey PRIMARY KEY (id);
 Y   ALTER TABLE ONLY iniciar.tbl_tipo_informacion DROP CONSTRAINT tbl_tipo_informacion_pkey;
       iniciar            crduser    false    275            G           2606    67306 0   tbl_tipos_de_miembros tbl_tipos_de_miembros_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY iniciar.tbl_tipos_de_miembros
    ADD CONSTRAINT tbl_tipos_de_miembros_pkey PRIMARY KEY (id);
 [   ALTER TABLE ONLY iniciar.tbl_tipos_de_miembros DROP CONSTRAINT tbl_tipos_de_miembros_pkey;
       iniciar            crduser    false    271            ]           2606    68140 .   tbl_tipos_documentos tbl_tipos_documentos_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY iniciar.tbl_tipos_documentos
    ADD CONSTRAINT tbl_tipos_documentos_pkey PRIMARY KEY (id);
 Y   ALTER TABLE ONLY iniciar.tbl_tipos_documentos DROP CONSTRAINT tbl_tipos_documentos_pkey;
       iniciar            crduser    false    296            S           2606    67856 $   tbl_tipos_sedes tbl_tipos_sedes_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY iniciar.tbl_tipos_sedes
    ADD CONSTRAINT tbl_tipos_sedes_pkey PRIMARY KEY (id);
 O   ALTER TABLE ONLY iniciar.tbl_tipos_sedes DROP CONSTRAINT tbl_tipos_sedes_pkey;
       iniciar            crduser    false    287            g           2606    68353 @   tbl_transacciones_de_miembros tbl_transacciones_de_miembros_pkey 
   CONSTRAINT        ALTER TABLE ONLY iniciar.tbl_transacciones_de_miembros
    ADD CONSTRAINT tbl_transacciones_de_miembros_pkey PRIMARY KEY (id);
 k   ALTER TABLE ONLY iniciar.tbl_transacciones_de_miembros DROP CONSTRAINT tbl_transacciones_de_miembros_pkey;
       iniciar            crduser    false    302            A           2606    66961    tbl_users tbl_users_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY iniciar.tbl_users
    ADD CONSTRAINT tbl_users_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY iniciar.tbl_users DROP CONSTRAINT tbl_users_pkey;
       iniciar            crduser    false    219            C           2606    67837    tbl_users tbl_users_usuario_key 
   CONSTRAINT     ^   ALTER TABLE ONLY iniciar.tbl_users
    ADD CONSTRAINT tbl_users_usuario_key UNIQUE (usuario);
 J   ALTER TABLE ONLY iniciar.tbl_users DROP CONSTRAINT tbl_users_usuario_key;
       iniciar            crduser    false    219            w           2620    68378    tbl_miembros tr_miembro    TRIGGER     ?   CREATE TRIGGER tr_miembro BEFORE UPDATE ON iniciar.tbl_miembros FOR EACH ROW EXECUTE FUNCTION iniciar.spt_movimiento_miembros();
 1   DROP TRIGGER tr_miembro ON iniciar.tbl_miembros;
       iniciar          crduser    false    298    314            i           2606    67341 !   tbl_area_de_accion FK_accion_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_area_de_accion
    ADD CONSTRAINT "FK_accion_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 N   ALTER TABLE ONLY iniciar.tbl_area_de_accion DROP CONSTRAINT "FK_accion_pais";
       iniciar          crduser    false    269    273    3397            k           2606    67436 '    tbl_informacion_adicional FK_adic_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar." tbl_informacion_adicional"
    ADD CONSTRAINT "FK_adic_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 V   ALTER TABLE ONLY iniciar." tbl_informacion_adicional" DROP CONSTRAINT "FK_adic_pais";
       iniciar          crduser    false    3397    269    277            r           2606    67970    tbl_areas FK_area_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_areas
    ADD CONSTRAINT "FK_area_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 C   ALTER TABLE ONLY iniciar.tbl_areas DROP CONSTRAINT "FK_area_pais";
       iniciar          crduser    false    291    269    3397            m           2606    67752    tbl_tipodivision FK_div_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_tipodivision
    ADD CONSTRAINT "FK_div_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 I   ALTER TABLE ONLY iniciar.tbl_tipodivision DROP CONSTRAINT "FK_div_pais";
       iniciar          crduser    false    3397    283    269            u           2606    68186    tbl_miembros FK_miembro_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_miembros
    ADD CONSTRAINT "FK_miembro_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 I   ALTER TABLE ONLY iniciar.tbl_miembros DROP CONSTRAINT "FK_miembro_pais";
       iniciar          crduser    false    3397    298    269            s           2606    68109    tbl_posiciones FK_posicion_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_posiciones
    ADD CONSTRAINT "FK_posicion_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 L   ALTER TABLE ONLY iniciar.tbl_posiciones DROP CONSTRAINT "FK_posicion_pais";
       iniciar          crduser    false    269    294    3397            q           2606    67912    tbl_sedes FK_sede_paises    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_sedes
    ADD CONSTRAINT "FK_sede_paises" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 E   ALTER TABLE ONLY iniciar.tbl_sedes DROP CONSTRAINT "FK_sede_paises";
       iniciar          crduser    false    289    269    3397            j           2606    67365 )   tbl_tipo_informacion FK_tinformacion_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_tipo_informacion
    ADD CONSTRAINT "FK_tinformacion_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 V   ALTER TABLE ONLY iniciar.tbl_tipo_informacion DROP CONSTRAINT "FK_tinformacion_pais";
       iniciar          crduser    false    269    3397    275            p           2606    67899 !   tbl_tipos_sedes FK_tipo_sede_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_tipos_sedes
    ADD CONSTRAINT "FK_tipo_sede_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 N   ALTER TABLE ONLY iniciar.tbl_tipos_sedes DROP CONSTRAINT "FK_tipo_sede_pais";
       iniciar          crduser    false    3397    287    269            h           2606    67307 +   tbl_tipos_de_miembros FK_tiposmiembros_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_tipos_de_miembros
    ADD CONSTRAINT "FK_tiposmiembros_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 X   ALTER TABLE ONLY iniciar.tbl_tipos_de_miembros DROP CONSTRAINT "FK_tiposmiembros_pais";
       iniciar          crduser    false    269    271    3397            l           2606    67446 '    tbl_informacion_adicional Fk_adic_tipo    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar." tbl_informacion_adicional"
    ADD CONSTRAINT "Fk_adic_tipo" FOREIGN KEY (id_tipo_informacion) REFERENCES iniciar.tbl_tipo_informacion(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 V   ALTER TABLE ONLY iniciar." tbl_informacion_adicional" DROP CONSTRAINT "Fk_adic_tipo";
       iniciar          crduser    false    277    275    3403            n           2606    67771    tbl_division Fk_division_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_division
    ADD CONSTRAINT "Fk_division_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 J   ALTER TABLE ONLY iniciar.tbl_division DROP CONSTRAINT "Fk_division_pais";
       iniciar          crduser    false    3397    269    285            v           2606    68367 )   tbl_transacciones_de_miembros Fk_miembros    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_transacciones_de_miembros
    ADD CONSTRAINT "Fk_miembros" FOREIGN KEY (id_miembro) REFERENCES iniciar.tbl_miembros(id) NOT VALID;
 V   ALTER TABLE ONLY iniciar.tbl_transacciones_de_miembros DROP CONSTRAINT "Fk_miembros";
       iniciar          crduser    false    3427    302    298            t           2606    68141 +   tbl_tipos_documentos Fk_tipo_documento_pais    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_tipos_documentos
    ADD CONSTRAINT "Fk_tipo_documento_pais" FOREIGN KEY (id_pais) REFERENCES iniciar.tbl_paises(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 X   ALTER TABLE ONLY iniciar.tbl_tipos_documentos DROP CONSTRAINT "Fk_tipo_documento_pais";
       iniciar          crduser    false    3397    296    269            o           2606    67776 /   tbl_division tbl_division_id_tipo_division_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY iniciar.tbl_division
    ADD CONSTRAINT tbl_division_id_tipo_division_fkey FOREIGN KEY (id_tipo_division) REFERENCES iniciar.tbl_tipodivision(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 Z   ALTER TABLE ONLY iniciar.tbl_division DROP CONSTRAINT tbl_division_id_tipo_division_fkey;
       iniciar          crduser    false    283    285    3407                  x?????? ? ?            x?????? ? ?      !   c   x?3?4B?ҲԼ?ҔN???̲|μԴ?ĜL????Ģ?|????????\N###]c]#KCc+c+??yɉE??)?
)??1~p????? "?         {   x?3?4C???̲|μԴ?ĜL????Ģ?|????????\N##c]C]cC+c+C=KS??*?4 4?t?KN,JOL?WHIU??r??0"?C+c=cCK?% JpZ???? ?o6?         V   x?3?4??ļ?|???̼?| ?3/1?$?,??/5?$1'3(?8?(3?????H??X??R???????? ?:?
9c???+F??? )?      (   ?   x?U??
?0?ϛ????&??ɖ?=赗5?H?E||SE???}3??@?x??OOw?~Z{?????p??E?.?Q????2?6?F$?Ri4???n?!L??ޭku?.?|n?
URT?$l??Ք+m??O???Dm?-??T?`????m??d??'?2M;Ib̅/e?:?      *      x?????? ? ?         1   x?3?4???O)??WHIU??)?+I,??W?2?tL.?,#?X?=... ?.?         v   x?]?;
?0@g??@?d;?xj)]s/?v? ??	=?c???c`??*????/-R?G??<eU?퐮??l?+涁#????u.?=?D??O??????c??)͖j?i?MBc??g"?         d   x?3?424????J-8?+)'39Q?%?73??K?t?"_N??|NCcSNsS 陗?\?Y?ϙQRRPl??_TZ????????Z????????? j??      $   t   x?3?4?°??Ҽ?Ģ??b /Ə?1?$?,?3/5?$1'S?(?$鐞????????id`d?k`?kl?`hheldeb?gja?횗?X???????
2
M??????9H"Ə+F??? 
#      "   f   x?3?4??҂Ԣ??????bN???̲|μԴ?ĜL????Ģ?|????????\N###]c]#KCc+c+??yɉE??)?
)??1~p????? ???         R   x?3?4??ԔT???????N??N???̲|N?Դ?ĜL????Ģ?|N###]c]#KCc+c+?jT????? ??o            x?????? ? ?         ?   x??ӱ? ??????`4vk?? 1?]nP??4` ???????7?r????d?>8?)?h?,udP??'{?????R?[??փCyU???h?lĎ??????8??Q??>>j???st0??UĖ?????Fc????{???/T???????_{?*r+J?M0?i         C   x?3?4???)?+I,??W??tL.?,[?Y?e?ձ81hgb
?lM?2A?k??????=... ?=?      &   p   x?3?4?H,N,?/*I?tL.?,???KM+I???/N,??O?4202?50?56T04?22?25г00???CC\?@??SSJs??6??T???a?c+cs=#c?m\1z\\\ ?.6         Y   x?3?4B?ԔT?Լ???N???̲|μԴ?Ĝ̢"s????????\N###]c]##+j/-.M,??????#?=... w?      ,   ?   x???K
?0?ur?\?!?4+?k=??4?2??-?????T?0??????/???p??v????+C-???xV???ҕ??60?п!g???
??!?퐢??>!??%????????iN?1f????q???SB??Ps1)Lz2Zr?RW??h&?I??	O???KkN)}M˨?         ?   x??A?0 ??ۯ??kcoKJO??bF!^?KE??,?}}|Z?B K????q??????V??W5Gɓ?xI??7:?M?2????e??]^,??7O?z????Fa(λ??м?? J*????2??@?ЈPe???<?'      