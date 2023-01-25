import {
  BeforeInsert,
  BeforeUpdate,
  Column,
  Entity,
  PrimaryGeneratedColumn,
} from 'typeorm';
@Entity('tbl_areas')
export class AreaEntity {
  @PrimaryGeneratedColumn()
  id: number;
  @Column()
  id_pais: number;
  @Column()
  id_sede: number;
  @Column()
  nombre: string;
  @Column()
  estado: string;
  @Column()
  agregado_por: string;
  @Column()
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
  checkFieldBeforeInsert() {
    //this.usuario = this.usuario.toLowerCase().trim();
  }

  @BeforeUpdate()
  checkFieldBeforepdate() {
    this.checkFieldBeforeInsert();
  }
}
