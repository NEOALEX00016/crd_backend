import { Injectable, BadRequestException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { UpdateDetallemiscursoDto } from './dto/update-detallemiscurso.dto';
import { DetallemiscursoEntity } from './entities/detallemiscurso.entity';
import { Repository } from 'typeorm';
import { NotFoundException } from '@nestjs/common/exceptions/not-found.exception';

@Injectable()
export class DetallemiscursosService {
  constructor(
    @InjectRepository(DetallemiscursoEntity)
    private readonly detarepo: Repository<DetallemiscursoEntity>,
  ) {}

  async findAll() {
    const detalle = await this.detarepo.find();
    if (detalle.length <= 0)
      throw new NotFoundException('Esta Tabla no Contiene Registro');

    return detalle;
  }

  async findOne(id: number) {
    const detalle = await this.detarepo.findOneBy({ id: id });
    if (!detalle) throw new NotFoundException(`Registro no encontrado ${id}`);
    return detalle;
  }

  async update(id: number, updateDetallemiscursoDto: UpdateDetallemiscursoDto) {
    const detalle = await this.detarepo.preload({
      id,
      ...updateDetallemiscursoDto,
    });
    if (!detalle) throw new NotFoundException(`Registro no Encontrado`);

    try {
      await this.detarepo.update(id, detalle);
      return detalle;
    } catch (error) {
      throw new BadRequestException('Error Actualizado registro');
    }
  }

  async finddetallemiscursos(idmiembro: number, idcurso: number) {
    const detalle = await this.detarepo.find({
      where: {
        id_curso: idcurso,
        id_miembro: idmiembro,
      },
      select: {
        id: true,
        id_mis_cursos: true,
        id_detalle: true,
        id_miembro: true,
        id_curso: true,
        tiempo: true,
        descripcion: true,
        estado: true,
        titulo: true,
        url: true,
        pregunta: true,
        respuesta1: true,
        respuesta2: true,
        respuesta3: true,
        correcta: true,
        tipo: true,
        duracion: true,
      },
      order: {
        id_detalle: 'ASC',
    }
    });

    if (!detalle) throw new NotFoundException('Registro no Encontrado');

    return detalle;
  }
}
