import { Injectable, BadRequestException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { CreateMiembrosposicionDto } from './dto/create-miembrosposicion.dto';
import { UpdateMiembrosposicionDto } from './dto/update-miembrosposicion.dto';
import { MiembrosposicionEntity } from './entities/miembrosposicion.entity';
import { Repository } from 'typeorm';
import { NotFoundException } from '@nestjs/common/exceptions/not-found.exception';
import { PosicioneEntity } from '../posiciones/entities/posicione.entity';

@Injectable()
export class MiembrosposicionService {
  constructor(
    @InjectRepository(MiembrosposicionEntity)
    private readonly repomiem: Repository<MiembrosposicionEntity>,
  ) {}

  async create(createMiembrosposicionDto: CreateMiembrosposicionDto) {
    const miembro = await this.repomiem.create(createMiembrosposicionDto);
    try {
      await this.repomiem.save(miembro);
      return miembro;
    } catch (error) {
      throw new BadRequestException('Error Registrando Información');
    }
  }

  async findAll() {
    const miembro = await this.repomiem.find();
    if (miembro.length <= 0)
      throw new NotFoundException('Esta Tabla no contiene Registro');

    return miembro;
  }

  async findOne(id: number) {
    const miembro = await this.repomiem.findOneBy({ id: id });
    if (!miembro) throw new NotFoundException('Registro no encontrado');
    return miembro;
  }

  async update(
    id: number,
    updateMiembrosposicionDto: UpdateMiembrosposicionDto,
  ) {
    const miembro = await this.repomiem.preload({
      id,
      ...updateMiembrosposicionDto,
    });
    if (!miembro) throw new NotFoundException('Registro no encontrado');

    try {
      await this.repomiem.update(id, miembro);
      return miembro;
    } catch (error) {
      throw new BadRequestException(`Error Actualizando los Registrosa`);
    }
  }

  async findmiembro(id: number) {
    const qry = this.repomiem.createQueryBuilder('mis');
    const mis = await qry

      .innerJoinAndMapOne(
        'mis.id_posicion',
        PosicioneEntity,
        'posicion',
        'mis.id_posicion = posicion.id',
      )
      .select([
        'mis.id',
        'mis.id_miembro',
        'mis.agregado_por',
        'mis.agregado_en',
        'mis.estado',
        'posicion',
      ])
      .where('mis.id_miembro = :miembro', { miembro: id }) // or you can change condition to 'key.userId = :userId' because of you have `userId` in Key
      .getMany();
    return mis;
    // const miembro = await this.repomiem.findBy({ id_miembro: id });
    // if (miembro.length <= 0)
    //   throw new NotFoundException('Este ID de Miembro No Existe');
    // return miembro;
  }
}
