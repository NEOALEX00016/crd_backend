import { Column, Entity, PrimaryColumn } from 'typeorm';
@Entity('tbl_detalle_mis_cursos')
export class DetallemiscursoEntity {
  @PrimaryColumn()
  id: number;

  @Column()
  id_mis_cursos: number;

  @Column()
  id_detalle: number;

  @Column()
  id_miembro: number;

  @Column()
  tiempo: number;
  @Column()
  duracion: number;

  @Column()
  estado: string;
  @Column()
  id_curso: number;

  @Column()
  titulo: string;
  @Column()
  descripcion: string;
  @Column()
  url: string;
  @Column()
  tipo: string;

  @Column()
  pregunta: string;
  @Column()
  respuesta1: string;
  @Column()
  respuesta2: string;
  @Column()
  respuesta3: string;
  @Column()
  correcta: number;
}
