import {
  BeforeInsert,
  BeforeUpdate,
  Column,
  Entity,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { v4 as uuid } from 'uuid';

@Entity('tbl_documentos_actividad')
export class DocumentosactividadEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  id_actividad: number;

  @Column()
  nombre: string;

  @Column()
  tipo: string;
  @Column()
  url: string;
  @Column()
  descripcion: string;

  @Column()
  uuid: string;

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
    this.uuid = uuid();
  }
  @BeforeUpdate()
  modificadopor() {
    this.modificado_en = new Date();
  }
}
