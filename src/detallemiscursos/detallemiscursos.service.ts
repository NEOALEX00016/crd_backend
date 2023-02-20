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
    const detalle = await this.detarepo.findBy({
      id_curso: idcurso,
      id_miembro: idmiembro,
    });

    if (!detalle) throw new NotFoundException('Registro no Encontrado');

    return detalle;
  }
}
