import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity('tbl_paises')
export class PaisEntity {
  @PrimaryGeneratedColumn({
    type: 'bigint',
  })
  id: number;
  @Column()
  nombre: string;

  @Column()
  alpha2: string;

  @Column()
  alpha3: string;
  @Column()
  codigo: number;
  @Column()
  domains: string;
  @Column()
  habitantes: string;
  @Column()
  superficie: number;
  @Column({
    name: 'bandera',
    type: 'bytea',
    nullable: true,
  })
  bandera: Buffer;
  @Column()
  estado: string;

  @Column()
  ruta_bandera: string;
}
