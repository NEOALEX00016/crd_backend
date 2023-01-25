import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity('tbl_modulos')
export class Moduloentity {
  @PrimaryGeneratedColumn()
  id: number;
  @Column()
  id_pais: number;
  @Column()
  descripcion: string;
  @Column()
  estado: string;
}
