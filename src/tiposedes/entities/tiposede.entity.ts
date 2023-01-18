import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity('tbl_tipos_sedes')
export class TiposedeEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  id_tipo_division: number;
  @Column()
  id_pais: number;
  @Column()
  nombre: string;
  @Column({ type: 'character', default: 'Activo' })
  estado: string;
  @Column()
  agregado_por: string;
  @Column({ type: 'time without time zone' })
  agregado_en: Date;
  @Column({ type: 'bigint' })
  rol_agregado_id: number;
  @Column()
  rol_agregado_nom: string;

  @Column()
  modificado_por: string;
  @Column({ type: 'time without time zone' })
  modificado_en: Date;
  @Column({ type: 'bigint' })
  rol_modificado_id: number;
  @Column()
  rol_modificado_nom: string;
}
