import { Injectable, BadRequestException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { CreatePosicioneDto } from './dto/create-posicione.dto';
import { UpdatePosicioneDto } from './dto/update-posicione.dto';
import { PosicioneEntity } from './entities/posicione.entity';
import { Repository } from 'typeorm';
import { NotFoundException } from '@nestjs/common/exceptions/not-found.exception';

@Injectable()
export class PosicionesService {
  constructor(
    @InjectRepository(PosicioneEntity)
    private readonly porepo: Repository<PosicioneEntity>,
  ) {}

  async create(createPosicioneDto: CreatePosicioneDto) {
    const posicion = this.porepo.create(createPosicioneDto);

    try {
      await this.porepo.save(posicion);
      return posicion;
    } catch (error) {
      throw new BadRequestException(`Error Registrando Posición ${error}`);
    }
  }

  async findAll() {
    const posicion = await this.porepo.find();
    if (posicion.length <= 0)
      throw new NotFoundException('Esta Tabla no Contiene datos');

    return posicion;
  }

  async findOne(term: string) {
    if (!isNaN(+term)) {
      const posicion = await this.porepo.findOneBy({ id: +term });
      if (!posicion) throw new NotFoundException('Registro no Encontrados');
      return posicion;
    } else {
      const posicion = await this.porepo.findOneBy({ nombre: term });
      if (!posicion) throw new NotFoundException('Registro no Encontrados');

      return posicion;
    }
  }

  async update(id: number, updatePosicioneDto: UpdatePosicioneDto) {
    const posiciones = await this.porepo.preload({ id, ...updatePosicioneDto });
    if (!posiciones) throw new NotFoundException('Registro no Encontrados');

    try {
      await this.porepo.update(id, posiciones);
      return posiciones;
    } catch (error) {
      throw new BadRequestException(`Error Actulizando los registros ${error}`);
    }

    return `This action updates a #${id} posicione`;
  }
}
