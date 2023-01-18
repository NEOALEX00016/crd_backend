import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { CreateTiposedeDto } from './dto/create-tiposede.dto';
import { UpdateTiposedeDto } from './dto/update-tiposede.dto';
import { TiposedeEntity } from './entities/tiposede.entity';
import { Repository } from 'typeorm';
import { NotFoundException } from '@nestjs/common/exceptions/not-found.exception';

@Injectable()
export class TiposedesService {
  constructor(
    @InjectRepository(TiposedeEntity)
    private readonly tiposede: Repository<TiposedeEntity>,
  ) {}

  async create(createTiposedeDto: CreateTiposedeDto) {
    const tipo = await this.tiposede.create(createTiposedeDto);

    const sede = await this.tiposede.save(tipo);

    return sede;
  }

  async findAll() {
    const tiposede = await this.tiposede.find();
    if (tiposede.length <= 0) throw new NotFoundException('No Existe Registro');

    return tiposede;
  }

  findOne(id: number) {
    return `This action returns a #${id} tiposede`;
  }

  update(id: number, updateTiposedeDto: UpdateTiposedeDto) {
    return `This action updates a #${id} tiposede`;
  }

  remove(id: number) {
    return `This action removes a #${id} tiposede`;
  }
}
