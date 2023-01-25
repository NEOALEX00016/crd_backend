import { BadRequestException, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { CreateTiposedeDto } from './dto/create-tiposede.dto';
import { UpdateTiposedeDto } from './dto/update-tiposede.dto';
import { TiposedeEntity } from './entities/tiposede.entity';

import { NotFoundException } from '@nestjs/common/exceptions/not-found.exception';
import { Repository } from 'typeorm';

@Injectable()
export class TiposedesService {
  constructor(
    @InjectRepository(TiposedeEntity)
    private readonly tiposede: Repository<TiposedeEntity>,
  ) {}

  async create(createTiposedeDto: CreateTiposedeDto) {
    const tipo = await this.tiposede.create(createTiposedeDto);

    try {
      await this.tiposede.save(tipo);

      return tipo;
    } catch (error) {
      throw new BadRequestException(error);
    }
  }

  async findAll() {
    const tiposede = await this.tiposede.find();

    if (tiposede.length <= 0) throw new NotFoundException('No Existe Registro');

    return tiposede;
  }

  async findOne(term: string) {
    const qry = this.tiposede.createQueryBuilder();

    const tipos = await qry.where('nombre=:nombre', { nombre: term }).getOne();

    if (!tipos) throw new NotFoundException(`Tipo de Sede no Existe `);
    return tipos;
  }

  async update(id: number, updateTiposedeDto: UpdateTiposedeDto) {
    const tipos = await this.tiposede.preload({ id, ...updateTiposedeDto });

    if (!tipos)
      throw new BadRequestException('Error a Actualizar no Encontrado');

    try {
      await this.tiposede.update(id, tipos);
      return tipos;
    } catch (error) {
      throw new BadRequestException('Error al Actualizar los Datos');
    }
  }
}
