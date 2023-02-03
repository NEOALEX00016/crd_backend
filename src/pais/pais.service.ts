import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';

import { Repository } from 'typeorm';
import { CreatePaisDto } from './dto/create-pai.dto';
import { UpdatePaisDto } from './dto/update-pai.dto';
import { PaisEntity } from './entities/pais.entity';

@Injectable()
export class PaisService {
  constructor(
    @InjectRepository(PaisEntity)
    private readonly paisrepository: Repository<PaisEntity>,
  ) {}
  async create(createPaisDto: CreatePaisDto) {
    try {
      const pais = this.paisrepository.create(createPaisDto);
      await this.paisrepository.save(pais);
      return pais;
    } catch (error) {
      console.log(error);
    }
  }

  async findAll() {
    const pais = await this.paisrepository.find();

    if (pais.length <= 0)
      throw new NotFoundException('No Existe ningun Registro en la Tabla');

    return pais;
  }

  async findOne(term: string) {
    const query = this.paisrepository.createQueryBuilder();

    if (!isNaN(+term)) {
      const pais = await query.where('id=:id', { id: +term }).getOne();

      if (!pais) throw new NotFoundException(`Pais ${term} no Registrado`);

      return pais;
    } else {
      const pais = await query
        .where('nombre=:nombre', { nombre: term })
        .getOne();
      if (!pais) throw new NotFoundException(`Pais ${term} no Registrado`);

      return pais;
    }
  }

  async update(id: number, updatePaisDto: UpdatePaisDto) {
    const pais = await this.paisrepository.preload({
      id: id,
      ...updatePaisDto,
    });

    if (!pais) throw new NotFoundException(`Pais id:#${id} no  Encontrado`);

    try {
      await this.paisrepository.update(id, pais);
      return pais;
    } catch (error) {
      throw new BadRequestException(`${error}`);
    }
  }
}
