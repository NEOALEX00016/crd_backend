import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { CreateDivisionDto } from './dto/create-division.dto';
import { UpdateDivisionDto } from './dto/update-division.dto';
import { Repository } from 'typeorm';
import { DivisionEntity } from './entities/division.entity';

@Injectable()
export class DivisionService {
  constructor(
    @InjectRepository(DivisionEntity)
    private readonly divisionrepository: Repository<DivisionEntity>,
  ) {}

  async create(createDivisionDto: CreateDivisionDto) {
    const division = this.divisionrepository.create(createDivisionDto);

    try {
      await this.divisionrepository.save(division);
      return division;
    } catch (error) {
      throw new BadRequestException(error.message);
    }
  }

  async findAll() {
    const division = await this.divisionrepository.find();

    if (division.length < 0)
      throw new NotFoundException('No Existe Registros en Divisiones');
    return division;
  }

  async findOne(term: string) {
    const qry = this.divisionrepository.createQueryBuilder();
    const division = await qry
      .where('nombre=:nombre', { nombre: term })
      .getOne();
    if (!division)
      throw new NotFoundException(`Division ${term} no Registrada`);

    return division;
  }

  async update(id: number, updateDivisionDto: UpdateDivisionDto) {
    const division = await this.divisionrepository.preload({
      id,
      ...updateDivisionDto,
    });

    if (!division) throw new NotFoundException('Division id no encotrada');

    try {
      await this.divisionrepository.update(id, division);
      return division;
    } catch (error) {
      throw new NotFoundException('Error Actualizado los Datos ');
    }
  }

  async findid(term: string) {
    const qry = this.divisionrepository.createQueryBuilder();
    const division = await qry.where('id=:id', { id: term }).getOne();
    if (!division)
      throw new NotFoundException(`Division ${term} no Registrada`);

    return division;
  }
}
