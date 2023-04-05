import { Injectable, BadRequestException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { CreateDetalleproyectosnacionaleDto } from './dto/create-detalleproyectosnacionale.dto';
import { UpdateDetalleproyectosnacionaleDto } from './dto/update-detalleproyectosnacionale.dto';
import { DetalleproyectosnacionaleEntity } from './entities/detalleproyectosnacionale.entity';
import { Repository } from 'typeorm';
import { NotFoundException } from '@nestjs/common/exceptions/not-found.exception';

@Injectable()
export class DetalleproyectosnacionalesService {
  constructor(
    @InjectRepository(DetalleproyectosnacionaleEntity)
    private readonly detallerepo: Repository<DetalleproyectosnacionaleEntity>,
  ) {}
  async create(
    createDetalleproyectosnacionaleDto: CreateDetalleproyectosnacionaleDto,
  ) {
    const detalle = await this.detallerepo.create(
      createDetalleproyectosnacionaleDto,
    );

    try {
      await this.detallerepo.save(detalle);
      return detalle;
    } catch (error) {
      throw new BadRequestException('Error Registrando Detalle');
    }
  }

  async findAll() {
    const detalle = await this.detallerepo.find();
    if (detalle.length <= 0)
      throw new NotFoundException('Esta Tabla no Contiene Registro');
    return detalle;
  }

  async findOne(id: number) {
    const detalle = await this.detallerepo.findOne({ where: { id: id } });

    if (!detalle) throw new NotFoundException(`Registro no Encontrado ${id}`);

    return detalle;
  }

  async update(
    id: number,
    updateDetalleproyectosnacionaleDto: UpdateDetalleproyectosnacionaleDto,
  ) {
    const detalle = await this.detallerepo.preload({
      id,
      ...updateDetalleproyectosnacionaleDto,
    });
    if (!detalle) throw new NotFoundException(`Registro no encontrado `);

    try {
      await this.detallerepo.update(id, detalle);
      return detalle;
    } catch (error) {
      throw new BadRequestException('Error Actualizando el Registro');
    }
  }

  async findproyecto(id: number) {
    const proyecto = await this.detallerepo.find({
      where: { id_proyecto_nacional: id },
    });
    if (proyecto.length <= 0)
      throw new NotFoundException(
        `No existe Detalle en este Proyecto Nacional`,
      );
    return proyecto;
  }
}
