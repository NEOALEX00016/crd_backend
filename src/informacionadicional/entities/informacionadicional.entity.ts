import { PrimaryGeneratedColumn } from 'typeorm';
import { BeforeInsert, BeforeUpdate, Column, Entity } from 'typeorm';
@Entity('tbl_informacion_adicional')
export class InformacionadicionalEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  id_pais: number;
  @Column()
  id_miembro: number;
  @Column()
  id_tipo_informacion: number;
  @Column()
  valor: string;

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
