import { Injectable, BadRequestException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { CreateActividadeDto } from './dto/create-actividade.dto';
import { UpdateActividadeDto } from './dto/update-actividade.dto';
import { ActividadesEntity } from './entities/actividade.entity';
import { Repository } from 'typeorm';
import { FileInterceptor } from '@nestjs/platform-express';
import { NotFoundException } from '@nestjs/common/exceptions/not-found.exception';

@Injectable()
export class ActividadesService {
  constructor(
    @InjectRepository(ActividadesEntity)
    private readonly repoactividades: Repository<ActividadesEntity>,
  ) {}
  async create(createActividadeDto: CreateActividadeDto) {
    const actividad = await this.repoactividades.create(createActividadeDto);
    try {
      await this.repoactividades.save(actividad);
      return actividad;
    } catch (error) {
      throw new BadRequestException(`Error Creando actividad ${error}`);
    }
  }

  async findAll() {
    const actividades = await this.repoactividades.find();

    if (actividades.length <= 0)
      throw new NotFoundException('Esta Tabla no Contiene registro');
    return actividades;
  }

  async findOne(id: number) {
    const actividades = await this.repoactividades.find({ where: { id: id } });
    if (actividades.length <= 0)
      throw new NotFoundException(`Registro no encontrado para el id ${id}`);
    return actividades;
  }

  async update(id: number, updateActividadeDto: UpdateActividadeDto) {
    const actividades = await this.repoactividades.preload({
      id,
      ...updateActividadeDto,
    });

    if (!actividades)
      throw new NotFoundException('Registro no encontrado para actualizar');

    try {
      await this.repoactividades.update(id, actividades);
      return actividades;
    } catch (error) {
      throw new BadRequestException(`Error Actualizando Actividad: ${error}`);
    }
  }

  async findactividadesmiembros(id: number) {
    const actividades = await this.repoactividades.find({
      where: { id_miembro: id },
    });
    if (actividades.length <= 0)
      throw new NotFoundException(`Registro no encontrado para el id ${id}`);
    return actividades;
  }
}
