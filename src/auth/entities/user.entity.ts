import {
  BeforeInsert,
  BeforeUpdate,
  Column,
  Entity,
  PrimaryGeneratedColumn,
} from 'typeorm';
@Entity('tbl_users')
export class User {
  @PrimaryGeneratedColumn({ type: 'bigint' })
  id: number;
  @Column({ type: 'bigint' })
  id_pais: number;

  @Column({ type: 'bigint' })
  id_miembro: number;

  @Column()
  usuario: string;
  @Column({ select: false })
  password: string;

  @Column()
  estado: string;

  @Column({ type: 'timestamp' })
  agregado_en: Date;

  @Column({ type: 'timestamp' })
  modificado_en: Date;

  @BeforeInsert()
  checkFieldBeforeInsert() {
    this.usuario = this.usuario.toLowerCase().trim();
    this.agregado_en = new Date();
  }

  @BeforeUpdate()
  checkFieldBeforepdate() {
    this.checkFieldBeforeInsert();
    this.modificado_en = new Date();
  }
}
