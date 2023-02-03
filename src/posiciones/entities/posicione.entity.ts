import {
  BeforeInsert,
  BeforeUpdate,
  Column,
  Entity,
  PrimaryGeneratedColumn,
} from 'typeorm';

@Entity('tbl_posiciones')
export class PosicioneEntity {
  @PrimaryGeneratedColumn()
  id: number;
  @Column()
  id_pais: number;
  @Column()
  id_sede: number;
  @Column()
  id_area: number;
  @Column()
  id_rol: number;
  @Column()
  nombre: string;
  @Column()
  posiciones_disponible: number;
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

  @BeforeInsert()
  agregadopor() {
    this.agregado_en = new Date();
  }

  @BeforeUpdate()
  modificadopor() {
    this.modificado_en = new Date();
  }
}
