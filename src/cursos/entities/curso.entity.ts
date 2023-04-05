import { v4 as uuid } from 'uuid';
import {
  BeforeInsert,
  BeforeUpdate,
  Column,
  Entity,
  PrimaryGeneratedColumn,
} from 'typeorm';

@Entity('tbl_cursos')
export class CursoEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  uuid: string;

  @Column()
  id_pais: number;
  @Column()
  descripcion: string;
  @Column()
  idcolection: string;

  @Column()
  tipo: string;

  @Column()
  nombre: string;

  @Column()
  duracion: number;

  @Column()
  portada: string;

  @Column()
  insignia: string;

  @Column()
  descripcioninsignia: string;

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
