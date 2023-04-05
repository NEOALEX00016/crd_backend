import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  BeforeInsert,
  BeforeUpdate,
} from 'typeorm';
@Entity('tbl_actividades')
export class ActividadesEntity {
  @PrimaryGeneratedColumn()
  id: number;
  @Column()
  id_proyecto_nacional: number;
  @Column()
  id_sub_proyecto: number;
  @Column()
  id_sede: number;
  @Column()
  id_areas_de_accion: number;

  @Column()
  id_miembro: number;

  @Column()
  entregabienes: boolean;
  @Column()
  asistencias: boolean;
  @Column()
  orientacion: boolean;
  @Column()
  capacitacion: boolean;
  @Column()
  gestion: boolean;
  @Column()
  fecha_actividad: Date;
  @Column()
  local: boolean;
  @Column()
  institucion: boolean;
  @Column()
  viviendas: boolean;
  @Column()
  comunidad: boolean;
  @Column()
  puestos: boolean;
  @Column()
  carceles: boolean;
  @Column()
  latitud: string;
  @Column()
  longitud: string;
  @Column()
  horainicio: number;
  @Column()
  horafin: number;
  @Column()
  voluntariosjuventud: number;
  @Column()
  mujeresjuventud: number;
  @Column()
  hombresjuventud: number;
  @Column()
  mujeresotros: number;
  @Column()
  hombresotros: number;
  @Column()
  totalvoluntario: number;
  @Column()
  '05_mujeres': number;
  @Column()
  '05_hombres': number;
  @Column()
  '05_discapacidad': number;
  @Column()
  '05_migrantes': number;
  @Column()
  '05_embarazadas': number;
  @Column()
  '612_mujeres': number;
  @Column()
  '612_hombres': number;
  @Column()
  '612_discapacidad': number;
  @Column()
  '612_migrantes': number;
  @Column()
  '612_embarazadas': number;
  @Column()
  '1317_mujeres': number;
  @Column()
  '1317_hombres': number;
  @Column()
  '1317_discapacidad': number;
  @Column()
  '1317_migrantes': number;
  @Column()
  '1317_embarazadas': number;
  @Column()
  '1829_mujeres': number;
  @Column()
  '1829_hombres': number;
  @Column()
  '1829_discapacidad': number;
  @Column()
  '1829_migrantes': number;
  @Column()
  '1829_embarazadas': number;
  @Column()
  '3039_mujeres': number;
  @Column()
  '3039_hombres': number;
  @Column()
  '3039_discapacidad': number;
  @Column()
  '3039_migrantes': number;
  @Column()
  '3039_embarazadas': number;
  @Column()
  '4049_mujeres': number;
  @Column()
  '4049_hombres': number;
  @Column()
  '4049_discapacidad': number;
  @Column()
  '4049_migrantes': number;
  @Column()
  '4049_embarazadas': number;
  @Column()
  '5059_mujeres': number;
  @Column()
  '5059_hombres': number;
  @Column()
  '5059_discapacidad': number;
  @Column()
  '5059_migrantes': number;
  @Column()
  '5059_embarazadas': number;
  @Column()
  '6069_mujeres': number;
  @Column()
  '6069_hombres': number;
  @Column()
  '6069_discapacidad': number;
  @Column()
  '6069_migrantes': number;
  @Column()
  '6069_embarazadas': number;
  @Column()
  '7079_mujeres': number;
  @Column()
  '7079_hombres': number;
  @Column()
  '7079_discapacidad': number;
  @Column()
  '7079_migrantes': number;
  @Column()
  '7079_embarazadas': number;
  @Column()
  '80_mujeres': number;
  @Column()
  '80_hombres': number;
  @Column()
  '80_discapacidad': number;
  @Column()
  '80_migrantes': number;
  @Column()
  '80_embarazadas': number;
  @Column()
  otros_mujeres: number;
  @Column()
  otros_hombres: number;
  @Column()
  otros_discapacidad: number;
  @Column()
  otros_migrantes: number;
  @Column()
  otros_embarazadas: number;

  @Column()
  descripcion: string;
  @Column()
  comentario: string;
  @Column()
  menores: boolean;

  @Column()
  dificultades: string;
  @Column()
  area_de_accion: string;
  @Column()
  codigo: string;

  @Column()
  maximo: number;
  @Column()
  aceptados: number;
  @Column()
  participantes: number;

  @Column()
  estado: string;
  @Column()
  agregado_por: string;
  @Column({ type: 'timestamp' })
  agregado_en: Date;
  @Column()
  rol_agregado_id: number;
  @Column()
  rol_agregado_nom: string;
  @Column()
  modificado_por: string;
  @Column()
  modificado_en: Date;
  @Column()
  rol_modificado_id: number;
  @Column()
  rol_modificado_nom: string;
  @BeforeInsert()
  agregadopor() {
    this.agregado_en = new Date();
  }
  @BeforeUpdate()
  modificadopor() {
    this.modificado_en = new Date();
  }
}
