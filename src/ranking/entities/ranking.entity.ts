import { Column, Entity, PrimaryColumn } from 'typeorm';

@Entity('tbl_ranking')
export class RankingEntity {
  @PrimaryColumn()
  id: number;

  @Column()
  id_miembro: number;
  @Column()
  id_sede: number;
  @Column()
  id_actividad: number;
  @Column()
  fecha: number;
  @Column()
  puntaje: number;
  @Column()
  area: number;
  @Column()
  id_posicion: number;
}
