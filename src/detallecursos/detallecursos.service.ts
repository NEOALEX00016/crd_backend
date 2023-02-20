import { Injectable, BadRequestException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { CreateDetallecursoDto } from './dto/create-detallecurso.dto';
import { UpdateDetallecursoDto } from './dto/update-detallecurso.dto';
import { DetallecursoEntity } from './entities/detallecurso.entity';
import { Repository } from 'typeorm';
import { NotFoundException } from '@nestjs/common/exceptions/not-found.exception';
import { UpdateDetallecursoportadaDto } from './dto/update-detallecursoportada.dto';
import { UpdateDetallecursourlDto } from './dto/update-detallecururl.dto';

@Injectable()
export class DetallecursosService {
  constructor(
    @InjectRepository(DetallecursoEntity)
    private readonly detallerepo: Repository<DetallecursoEntity>,
  ) {}
  async create(createDetallecursoDto: CreateDetallecursoDto) {
    const detalle = await this.detallerepo.create(createDetallecursoDto);

    try {
      await this.detallerepo.save(detalle);
      return detalle;
    } catch (error) {
      throw new BadRequestException(`Error registrado ${error}`);
    }
  }

  async findAll() {
    const detalle = await this.detallerepo.find();
    if (detalle.length <= 0)
      throw new NotFoundException('Esta Tabla no Contiende Datos');
    return detalle;
  }

  async findOne(id: number) {
    const detalle = await this.detallerepo.findOneBy({ id: id });

    if (!detalle) throw new NotFoundException('Registro no encontrado');

    return detalle;
  }

  async update(id: number, updateDetallecursoDto: UpdateDetallecursoDto) {
    const detalle = await this.detallerepo.preload({
      id,
      ...updateDetallecursoDto,
    });
    if (!detalle) throw new NotFoundException('Registro no encontrado');
    try {
      await this.detallerepo.update(id, detalle);
      return detalle;
    } catch (error) {
      throw new BadRequestException(`Error registrado ${error}`);
    }
  }

  async findCurso(id: number) {
    const detalle = await this.detallerepo.find({
      where: { id_curso: id },
      order: { id: 'ASC' },
    });

    if (!detalle) throw new NotFoundException('Registro no encontrado');

    return detalle;
  }

  async updateportada(
    id: number,
    updateDetallecursoportadaDto: UpdateDetallecursoportadaDto,
  ) {
    const curso = await this.detallerepo.preload({
      id,
      ...updateDetallecursoportadaDto,
    });

    if (!curso) throw new NotFoundException('Error Encontrando Registro');
    try {
      await this.detallerepo.update(id, curso);
      return curso;
    } catch (error) {
      throw new NotFoundException('Error Actualizando la Coleccion del Cursos');
    }
  }

  async updateurl(
    id: number,
    updateDetallecursourlDto: UpdateDetallecursourlDto,
  ) {
    const curso = await this.detallerepo.preload({
      id,
      ...updateDetallecursourlDto,
    });

    if (!curso) throw new NotFoundException('Error Encontrando Registro');
    console.log(curso);
    try {
      await this.detallerepo.update(id, curso);
      return curso;
    } catch (error) {
      throw new NotFoundException('Error Actualizando la Coleccion del Cursos');
    }
  }
}
