import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { CreateSedeDto } from './dto/create-sede.dto';
import { UpdateSedeDto } from './dto/update-sede.dto';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';
import { SedeEntity } from './entities/sede.entity';

@Injectable()
export class SedesService {
  constructor(
    @InjectRepository(SedeEntity)
    private readonly sederepo: Repository<SedeEntity>,
  ) {}

  async create(createSedeDto: CreateSedeDto) {
    const sede = this.sederepo.create(createSedeDto);
    try {
      await this.sederepo.save(sede);
      return sede;
    } catch (error) {
      throw new BadRequestException(error);
    }
  }

  async findAll() {
    const sede = await this.sederepo.find();

    if (!sede.length)
      throw new NotFoundException('No Existen Registros para Monstrar');
    return sede;
  }

  async findOne(term: string) {
    const qry = this.sederepo.createQueryBuilder();
    const sede = await qry.where('nombre=:nombre', { nombre: term }).getOne();
    if (!sede) throw new NotFoundException('No existe esta Sede');
    return sede;
  }

  async update(id: number, updateSedeDto: UpdateSedeDto) {
    const sede = await this.sederepo.preload({ id, ...updateSedeDto });

    if (!sede) throw new NotFoundException('Sede No Existe');

    try {
      await this.sederepo.update(id, sede);
      return sede;
    } catch (error) {
      throw new BadRequestException('Error Actualizando Sede');
    }
  }
}
