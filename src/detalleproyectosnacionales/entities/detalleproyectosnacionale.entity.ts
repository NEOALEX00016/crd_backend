import {
  BeforeInsert,
  BeforeUpdate,
  Column,
  Entity,
  PrimaryGeneratedColumn,
} from 'typeorm';
@Entity('tbl_detalle_proyectos_nacionales')
export class DetalleproyectosnacionaleEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  id_proyecto_nacional: number;
  @Column()
  id_sede: number;

  @Column()
  estado: string;
  @Column()
  agregado_por: string;
  @Column({ type: 'timestamp' })
  agregado_en: Date;
  
  @Column()
  modificado_por: string;
  @Column()
  modificado_en: Date;

  @BeforeInsert()
  agregadopor() {
    this.agregado_en = new Date();
  }
  @BeforeUpdate()
  modificadopor() {
    this.modificado_en = new Date();
  }
}
