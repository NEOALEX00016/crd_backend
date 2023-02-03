import { Injectable, BadRequestException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { CreateAreaDto } from './dto/create-area.dto';
import { UpdateAreaDto } from './dto/update-area.dto';
import { AreaEntity } from './entities/area.entity';
import { Repository } from 'typeorm';
import { NotFoundException } from '@nestjs/common/exceptions/not-found.exception';

@Injectable()
export class AreasService {
  constructor(
    @InjectRepository(AreaEntity)
    private readonly arearepo: Repository<AreaEntity>,
  ) {}
  async create(createAreaDto: CreateAreaDto) {
    const area = this.arearepo.create(createAreaDto);

    try {
      await this.arearepo.save(area);
      return area;
    } catch (error) {
      throw new BadRequestException(`Error Creando Area ${error}`);
    }
  }

  async findAll() {
    const area = await this.arearepo.find();
    if (!area.length)
      throw new NotFoundException('No existe Registro en la Tabla');
    return area;
  }

  async findOne(term: string) {
    const qry = this.arearepo.createQueryBuilder();
    const area = await qry.where('nombre=:nombre', { nombre: term }).getOne();
    if (!area) throw new NotFoundException(`Area ${term} no Encontrada`);

    return area;
  }

  async update(id: number, updateAreaDto: UpdateAreaDto) {
    const area = await this.arearepo.preload({ id, ...updateAreaDto });

    if (!area) throw new NotFoundException('Area no existe');

    try {
      await this.arearepo.update(id, area);
      return area;
    } catch (error) {
      throw new BadRequestException('Error Actualizando los Registros');
    }
  }

  async findId(term: number) {
    const qry = this.arearepo.createQueryBuilder();
    const area = await qry.where('id=:id', { id: term }).getOne();
    if (!area) throw new NotFoundException(`Area ${term} no Encontrada`);

    return area;
  }
}
