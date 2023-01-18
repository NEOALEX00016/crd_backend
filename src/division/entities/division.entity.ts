import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity('tbl_division')
export class DivisionEntity {
  @PrimaryGeneratedColumn({ type: 'bigint' })
  id: number;

  @Column({ type: 'bigint' })
  id_pais: number;
  @Column()
  id_tipo_division: number;
  @Column()
  nombre: string;
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
