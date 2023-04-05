import { Injectable, BadRequestException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { CreateTipoinformacionDto } from './dto/create-tipoinformacion.dto';
import { UpdateTipoinformacionDto } from './dto/update-tipoinformacion.dto';
import { TipoinformacionEntity } from './entities/tipoinformacion.entity';
import { Repository } from 'typeorm';
import { NotFoundException } from '@nestjs/common/exceptions/not-found.exception';

@Injectable()
export class TipoinformacionService {
  constructor(
    @InjectRepository(TipoinformacionEntity)
    private readonly repotip: Repository<TipoinformacionEntity>,
  ) {}

  async create(createTipoinformacionDto: CreateTipoinformacionDto) {
    const tipo = await this.repotip.create(createTipoinformacionDto);
    try {
      await this.repotip.save(tipo);
      return tipo;
    } catch (error) {
      throw new BadRequestException(`Error Registro el Tipo ${error}`);
    }
  }

  async findAll() {
    const tipo = await this.repotip.find();
    if (tipo.length <= 0)
      throw new NotFoundException('Esta Tabla no Contiene Registro');
    return tipo;
  }

  async findOne(id: number) {
    const tipo = await this.repotip.findOneBy({ id: id });
    if (!tipo) throw new NotFoundException(`Registro Id: ${id} no encontrado`);
    return tipo;
  }

  async update(id: number, updateTipoinformacionDto: UpdateTipoinformacionDto) {
    const tipo = await this.repotip.preload({
      id,
      ...updateTipoinformacionDto,
    });
    if (!tipo) throw new NotFoundException(`Registro Id: ${id} no encontrado`);
    try {
      await this.repotip.update(id, tipo);
      return tipo;
    } catch (error) {
      throw new BadRequestException(`Error Registro el Tipo ${error}`);
    }
  }
}
