import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';
@Entity('tbl_sedes')
export class SedeEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ type: 'bigint' })
  id_pais: number;

  @Column({ type: 'bigint' })
  id_division: number;
  @Column({ type: 'bigint' })
  id_tipo_sede: number;

  @Column()
  nombre: string;
  @Column({ default: 0 })
  voluntarios: number;
  @Column()
  depende: number;

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
}
