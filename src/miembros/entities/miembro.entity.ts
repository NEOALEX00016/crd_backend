import {
  BeforeInsert,
  BeforeUpdate,
  Column,
  Entity,
  PrimaryGeneratedColumn,
} from 'typeorm';
@Entity('tbl_miembros')
export class MiembroEntity {
  @PrimaryGeneratedColumn()
  id: number;
  @Column()
  id_pais: number;
  @Column()
  id_sede: number;
  @Column()
  id_area: number;
  @Column()
  nombre: string;
  @Column()
  apellido: string;
  @Column()
  nacionalidad: string;
  @Column()
  lugar_de_nacimiento: string;
  @Column()
  fecha_de_nacimiento: Date;
  @Column()
  id_tipo_documento: number;
  @Column()
  documento: string;
  @Column()
  email: string;
  @Column()
  fecha_de_registro: Date;
  @Column()
  fecha_de_finalizacion: Date;
  @Column()
  tipo_miembro: number;

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
