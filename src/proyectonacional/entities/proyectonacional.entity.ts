import {
  BeforeInsert,
  BeforeUpdate,
  Column,
  Entity,
  PrimaryGeneratedColumn,
} from 'typeorm';

@Entity('tbl_proyectos_nacionales')
export class ProyectonacionalEntity {
  @PrimaryGeneratedColumn()
  id: number;
  @Column()
  nombre: string;

  @Column()
  descripcion: string;
  @Column({ type: 'timestamp' })
  fecha_de_inicio: Date;
  @Column({ type: 'timestamp' })
  fecha_de_fin: Date;
  @Column()
  beneficiarios_esperados: number;
  @Column()
  beneficiarios_alcanzados: number;
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
