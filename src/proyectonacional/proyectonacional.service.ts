import { Injectable, BadRequestException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { CreateProyectonacionalDto } from './dto/create-proyectonacional.dto';
import { UpdateProyectonacionalDto } from './dto/update-proyectonacional.dto';
import { ProyectonacionalEntity } from './entities/proyectonacional.entity';
import { Repository } from 'typeorm';
import { NotFoundException } from '@nestjs/common/exceptions/not-found.exception';

@Injectable()
export class ProyectonacionalService {
  constructor(
    @InjectRepository(ProyectonacionalEntity)
    private readonly repoproyect: Repository<ProyectonacionalEntity>,
  ) {}
  async create(createProyectonacionalDto: CreateProyectonacionalDto) {
    const proyecto = await this.repoproyect.create(createProyectonacionalDto);

    console.log(proyecto);

    try {
      await this.repoproyect.save(proyecto);
      return proyecto;
    } catch (error) {
      throw new BadRequestException(`Error Creando este Proyecto ${error}`);
    }
  }

  async findAll() {
    const proyectos = await this.repoproyect.find();

    if (proyectos.length <= 0)
      throw new NotFoundException('Esta Tabla no Contiene Registro');
    return proyectos;
  }

  async findOne(id: number) {
    const proyecto = await this.repoproyect.findOneBy({ id: id });

    if (!proyecto) throw new NotFoundException(`Registro no encontrado ${id}`);

    return proyecto;
  }

  async update(
    id: number,
    updateProyectonacionalDto: UpdateProyectonacionalDto,
  ) {
    const proyecto = await this.repoproyect.preload({
      id,
      ...updateProyectonacionalDto,
    });

    if (!proyecto) throw new NotFoundException('Registro no encontrado');

    try {
      await this.repoproyect.update(id, proyecto);
      return proyecto;
    } catch (error) {
      throw new BadRequestException('Error Actualizando Proyecto');
    }
  }
}
