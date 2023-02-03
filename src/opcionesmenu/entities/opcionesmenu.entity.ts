import {
  Column,
  PrimaryGeneratedColumn,
  Entity,
  BeforeInsert,
  BeforeUpdate,
} from 'typeorm';

@Entity('tbl_opciones')
export class OpcionesmenuEntity {
  @PrimaryGeneratedColumn()
  id: number;
  @Column()
  id_pais: number;
  @Column()
  descripcion: string;
  @Column()
  estado: string;
  @Column()
  agregado_por: string;
  @Column()
  agregado_en: Date;
  @Column()
  modificado_por: string;
  @Column()
  modificado_en: Date;
  @Column()
  rol_agregado_id: number;
  @Column()
  rol_agregado_nom: string;
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
