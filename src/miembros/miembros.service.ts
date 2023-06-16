/* eslint-disable prettier/prettier */
import { Injectable, BadRequestException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { CreateMiembroDto } from './dto/create-miembro.dto';
import { UpdateMiembroDto } from './dto/update-miembro.dto';
import { MiembroEntity } from './entities/miembro.entity';
import { Not, Repository } from 'typeorm';
import { NotFoundException } from '@nestjs/common/exceptions/not-found.exception';
import { User } from 'src/auth/entities/user.entity';
import { KeyService } from 'src/common/db/dberror/generatesecret';
import { MailService } from 'src/mail/mail.service';
import * as bcrypt from 'bcrypt';
import { UpdateMiembroUrlDto } from './dto/update-miembrourl.dto';

@Injectable()
export class MiembrosService {
  constructor(
    @InjectRepository(MiembroEntity)
    private readonly repomiem: Repository<MiembroEntity>,
    @InjectRepository(User)
    private readonly repouser: Repository<User>,
    private readonly keyService: KeyService,
    private mailService: MailService,
  ) {}

  async create(createMiembroDto: CreateMiembroDto) {
    const miembro = this.repomiem.create(createMiembroDto);
    try {
      //await this.repomiem.save(miembro);

      const password = this.keyService.generateRandomKey(10);

      await this.repomiem.save(miembro);
      const user = this.repouser.create({
        id_pais: miembro.id_pais,
        id_miembro: miembro.id,
        usuario: miembro.email,
        password: bcrypt.hashSync(password, 10),
        estado: 'Activo',
      });
      await this.repouser.save(user);
      await this.mailService.sendUserConfirmation(
        miembro.email,
        password,
        miembro.nombre + ' ' + miembro.apellido,
      );
      return miembro;
    } catch (error) {
      throw new BadRequestException(`Error Registrando Miembros ${error}`);
    }
  }

  async findAll() {
    const miembro = await this.repomiem.find();
    if (miembro.length <= 0)
      throw new NotFoundException('Esta Tabla no Contiene Registro');

    return miembro;
  }

  async findOne(id: number) {
    const miembro = await this.repomiem.findOneBy({ id: id });
    if (!miembro) {
      throw new NotFoundException(`Miembro Con el Id ${id} no encontrado`);
    }

    return miembro;
  }

  async porpais(id: number) {
    const miembro = await this.repomiem.findBy({ id_pais: id });
    if (!miembro) {
      throw new NotFoundException(
        `Miembros Con el Id pais ${id} no encontrado`,
      );
    }

    return miembro;
  }

  async update(id: number, updateMiembroDto: UpdateMiembroDto) {
    const miembro = await this.repomiem.preload({
      id: id,
      ...updateMiembroDto,
    });
    if (!miembro)
      throw new NotFoundException('Registro no encontrado para actualizar');

    try {
      await this.repomiem.update(id, miembro);
      return miembro;
    } catch (error) {
      throw new BadRequestException(`Error Al Actualizar Miembro ${error}`);
    }
  }

  async porsede(id: number) {
    const miembro = await this.repomiem.findBy({ id_sede: id });
    if (!miembro) {
      throw new NotFoundException(`Miembros Con la Sede  ${id} no encontrado`);
    }

    return miembro;
  }

  async porsarea(id: number) {
    const miembro = await this.repomiem.findBy({ id_area: id });
    if (!miembro) {
      throw new NotFoundException(
        `Miembros Con el Id area ${id} no encontrado`,
      );
    }

    return miembro;
  }

  async porsedearea(sede: number, area: number) {
    const miembro = await this.repomiem.findBy({
      id_sede: sede,
      id_area: area,
    });
    if (!miembro) {
      throw new NotFoundException(
        `Miembros Con el sede ${sede} y con el area ${area} no encontrado`,
      );
    }

    return miembro;
  }




  async updateurl(id: number, updateMiembroUrlDto: UpdateMiembroUrlDto) {
    const miembro = await this.repomiem.preload({
      id: id,
      ...updateMiembroUrlDto,
    });
    if (!miembro)
      throw new NotFoundException('Registro no encontrado para actualizar');

    try {
      await this.repomiem.update(id, miembro);
      return miembro;
    } catch (error) {
      throw new BadRequestException(`Error Al Actualizar Miembro ${error}`);
    }
  }

async miequipocoord(idposicion:number){
  const equipo= await this.repomiem.query(`
  SELECT mi.urlfoto,mi.nombre,mi.apellido,mi.id FROM iniciar.tbl_miembros mi 
join iniciar.tbl_miembros_posiciones miempo
on miempo.id_miembro=mi.id
join iniciar.tbl_posiciones pos
on pos.id=miempo.id_posicion
where 1=1
and miempo.estado='Activo'
and pos.depende=${idposicion};
  `);

  if(equipo==0){
    throw new NotFoundException('No Contiene un Equipo');

  }

  return equipo;
}
async misuperior(idposicion:number){
  const equipo= await this.repomiem.query(`
  SELECT mi.urlfoto,mi.nombre,mi.apellido,mi.id FROM iniciar.tbl_miembros mi 
join iniciar.tbl_miembros_posiciones miempo
on miempo.id_miembro=mi.id
join iniciar.tbl_posiciones pos
on pos.id=miempo.id_posicion
where 1=1
and miempo.estado='Activo'
and pos.id=(select depende from iniciar.tbl_posiciones where id=${idposicion})
  `);

  if(equipo==0){
    throw new NotFoundException('No Contiene un Equipo');

  }

  return equipo;
}
async homologos(idposicion:number, idmiembro:number){
  const equipo= await this.repomiem.query(`
  SELECT 1 nivel,mi.urlfoto,mi.nombre,mi.apellido,mi.id,pos.nombre posicion FROM iniciar.tbl_miembros mi 
  join iniciar.tbl_miembros_posiciones miempo
  on miempo.id_miembro=mi.id
  join iniciar.tbl_posiciones pos
  on pos.id=miempo.id_posicion
  where 1=1
  and miempo.estado='Activo'
  and pos.id=(select depende from iniciar.tbl_posiciones where id=${idposicion})
  union
  SELECT 2 nivel, mi.urlfoto,mi.nombre,mi.apellido,mi.id,pos.nombre posicion FROM iniciar.tbl_miembros mi 
  join iniciar.tbl_miembros_posiciones miempo
  on miempo.id_miembro=mi.id
  join iniciar.tbl_posiciones pos
  on pos.id=miempo.id_posicion
  where 1=1
  and miempo.estado='Activo'
  and pos.depende=(select depende from iniciar.tbl_posiciones where id=${idposicion})
  and miempo.id_miembro<>${idmiembro}
  
  order by 1
  `);

  if(equipo==0){
    throw new NotFoundException('No Contiene un Equipo');

  }

  return equipo;
}

}
