import { v4 as uuid } from 'uuid';
import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  BeforeInsert,
  BeforeUpdate,
} from 'typeorm';
@Entity('tbl_detalle_de_cursos')
export class DetallecursoEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  id_curso: number;

  @Column()
  titulo: string;
  @Column()
  descripcion: string;
  @Column()
  tipo: string;
  @Column()
  url: string;
  @Column()
  id_formulario: string;
  @Column()
  portada: string;
  @Column()
  uuid: string;
  @Column()
  guid: string;

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
