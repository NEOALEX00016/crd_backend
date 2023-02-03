import {
  BeforeInsert,
  BeforeUpdate,
  Column,
  Entity,
  PrimaryGeneratedColumn,
} from 'typeorm';

@Entity('tbl_tipodivision')
export class TiposdivisionEntity {
  @PrimaryGeneratedColumn({
    type: 'bigint',
  })
  id: number;
  @Column({
    type: 'bigint',
  })
  id_pais: number;

  @Column({ type: 'character', length: 50, nullable: false })
  nombre: string;

  @Column({ type: 'bigint', nullable: true })
  depende: number;
  @Column({ type: 'character', length: 50, nullable: false })
  estado: string;
  @Column({ type: 'character', length: 100, nullable: false })
  agregado_por: string;
  @Column({ type: 'timestamp' })
  agregado_en: Date;
  @Column({ type: 'bigint', nullable: true })
  rol_agregado_id: number;
  @Column({ type: 'character', length: 100, nullable: true })
  rol_agregado_nom: string;
  @Column({ type: 'character', length: 100, nullable: true })
  modificado_por: string;
  @Column({ type: 'timestamp', nullable: true })
  modificado_en: Date;
  @Column({ type: 'bigint', nullable: true })
  rol_modificado_id: number;
  @Column({ type: 'character', length: 100, nullable: true })
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
