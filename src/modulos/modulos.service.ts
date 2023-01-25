import { Injectable } from '@nestjs/common';

import { InjectRepository } from '@nestjs/typeorm';
import { Moduloentity } from './entities/modulo.entity';
import { Repository } from 'typeorm';
import { NotFoundException } from '@nestjs/common/exceptions/not-found.exception';

@Injectable()
export class ModulosService {
  constructor(
    @InjectRepository(Moduloentity)
    private readonly modulorep: Repository<Moduloentity>,
  ) {}

  async findAll() {
    const modulos = await this.modulorep.find();

    if (!modulos) throw new NotFoundException('No existe Modulos');
    return modulos;
  }

  async findOne(id: number) {
    const qry = await this.modulorep.createQueryBuilder();
    const modulos = qry.where('id=:id', { id: id }).getOne();

    if (!modulos) throw new NotFoundException('Registros no Encontrado');
    return modulos;
  }
}
