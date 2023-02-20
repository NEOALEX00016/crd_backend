import {
  BeforeInsert,
  BeforeUpdate,
  Column,
  Entity,
  PrimaryColumn,
} from 'typeorm';
@Entity('tbl_mis_cursos')
export class MiscursoEntity {
  @PrimaryColumn()
  id: number;

  @Column()
  id_miembro: number;

  @Column()
  id_curso: number;

  @Column()
  fecha_de_inicio: Date;

  @Column()
  fecha_de_finalizacion: Date;
  @Column()
  completado: string;

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
    this.fecha_de_inicio = new Date();
  }
  @BeforeUpdate()
  modificadopor() {
    this.modificado_en = new Date();
  }
}
