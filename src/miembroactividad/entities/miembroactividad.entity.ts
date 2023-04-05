import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';
@Entity('tbl_miembros_actividad')
export class Miembroactividadentity {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  id_miembro: number;

  @Column()
  id_actividad: number;

  @Column({ type: 'timestamp' })
  fecha_de_correo: Date;

  @Column({ type: 'timestamp' })
  aceptado_en: Date;

  @Column({ type: 'timestamp' })
  rechazado_en: Date;

  @Column()
  estado: string;
}
