import { Injectable, BadRequestException } from '@nestjs/common';
import { CreateOpcionesmenuDto } from './dto/create-opcionesmenu.dto';
import { UpdateOpcionesmenuDto } from './dto/update-opcionesmenu.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { OpcionesmenuEntity } from './entities/opcionesmenu.entity';
import { Repository } from 'typeorm';
import { NotFoundException } from '@nestjs/common/exceptions/not-found.exception';

@Injectable()
export class OpcionesmenuService {
  constructor(
    @InjectRepository(OpcionesmenuEntity)
    private readonly opciorepo: Repository<OpcionesmenuEntity>,
  ) {}

  async create(createOpcionesmenuDto: CreateOpcionesmenuDto) {
    const opciones = this.opciorepo.create(createOpcionesmenuDto);
    try {
      await this.opciorepo.save(opciones);
      return opciones;
    } catch (error) {
      throw new BadRequestException(`Error Creando Opciones de Menu ${error}`);
    }
  }

  async findAll() {
    const opciones = await this.opciorepo.find();
    if (opciones.length <= 0)
      throw new NotFoundException('Esta Tabla no Coniente Registros');
    return opciones;
  }

  async findOne(term: string) {
    const qry = this.opciorepo.createQueryBuilder();

    if (!isNaN(+term)) {
      const opcion = await qry
        .where('id=:id', {
          id: term,
        })
        .getOne();
      if (!opcion) throw new NotFoundException('Registro no Encontrado');
      return opcion;
    } else {
      const opcion = await qry
        .where('descripcion=:descripcion', {
          descripcion: term,
        })
        .getOne();
      if (!opcion) throw new NotFoundException('Registro no Encontrado');
      return opcion;
    }
  }

  async update(id: number, updateOpcionesmenuDto: UpdateOpcionesmenuDto) {
    const opciones = await this.opciorepo.preload({
      id: id,
      ...updateOpcionesmenuDto,
    });

    if (!opciones)
      throw new NotFoundException('Registro no Encotrado para Actualizar');

    try {
      await this.opciorepo.update(id, opciones);
      return opciones;
    } catch (error) {
      throw new NotFoundException(`Error Actualizado Registro ${error}`);
    }
  }
}
