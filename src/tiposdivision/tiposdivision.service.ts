import {
  Injectable,
  BadRequestException,
  NotFoundException,
} from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import CreateTiposdivisionDto from './dto/create-tiposdivision.dto';
import { UpdateTiposdivisionDto } from './dto/update-tiposdivision.dto';
import { TiposdivisionEntity } from './entities/tiposdivision.entity';
import { Repository } from 'typeorm';

@Injectable()
export class TiposdivisionService {
  constructor(
    @InjectRepository(TiposdivisionEntity)
    private readonly tipodivision: Repository<TiposdivisionEntity>,
  ) {}

  async create(createTiposdivisionDto: CreateTiposdivisionDto) {
    const tipos = this.tipodivision.create(createTiposdivisionDto);
    try {
      await this.tipodivision.save(tipos);

      return tipos;
    } catch (error) {
      throw new BadRequestException(error);
    }
  }

  async findAll() {
    const tipos = await this.tipodivision.find();
    return tipos;
  }

  async findOne(term: string) {
    const query = await this.tipodivision.createQueryBuilder();
    const tipodivision = query
      .where('nombre=:nombre', { nombre: term })
      .getOne();
    return tipodivision;
  }

  async update(id: number, updateTiposdivisionDto: UpdateTiposdivisionDto) {
    const tipo = await this.tipodivision.preload({
      id,
      ...updateTiposdivisionDto,
    });

    if (!tipo) throw new NotFoundException('Tipo de Division No Existe');

    try {
      await this.tipodivision.update(id, tipo);
      return tipo;
    } catch (error) {
      throw new BadRequestException('Error Actualizando El Tipo de Division');
    }
  }
}
