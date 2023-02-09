import { Injectable, BadRequestException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { CreateMiembrosposicionDto } from './dto/create-miembrosposicion.dto';
import { UpdateMiembrosposicionDto } from './dto/update-miembrosposicion.dto';
import { MiembrosposicionEntity } from './entities/miembrosposicion.entity';
import { Repository } from 'typeorm';
import { NotFoundException } from '@nestjs/common/exceptions/not-found.exception';

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
    if (!miembro)
      throw new NotFoundException('Esta Tabla no contiene Registro');
    return miembro;
  }

  update(id: number, updateMiembrosposicionDto: UpdateMiembrosposicionDto) {
    return `This action updates a #${id} miembrosposicion`;
  }
}
