import { Injectable, BadRequestException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { CreateNotificacionDto } from './dto/create-notificacion.dto';
import { UpdateNotificacionDto } from './dto/update-notificacion.dto';
import { NotificacionEntity } from './entities/notificacion.entity';
import { Repository } from 'typeorm';
import { NotFoundException } from '@nestjs/common/exceptions/not-found.exception';

@Injectable()
export class NotificacionService {
  constructor(
    @InjectRepository(NotificacionEntity)
    private readonly reponotifi: Repository<NotificacionEntity>,
  ) {}
  async create(createNotificacionDto: CreateNotificacionDto) {
    const notifi = await this.reponotifi.create(createNotificacionDto);

    try {
      await this.reponotifi.save(notifi);
      return notifi;
    } catch (error) {
      throw new BadRequestException(`Error Creando a notificacion ${error}`);
    }
  }

  async findAll() {
    const notificacion = await this.reponotifi.find();

    if (notificacion.length <= 0) {
      throw new NotFoundException('Esta tabla no contiene Registro');
    }

    return notificacion;
  }

  async findOne(id: number) {
    const notificacion = await this.reponotifi.find({
      where: { id_miembro: id },
    });
    if (notificacion.length <= 0)
      throw new BadRequestException(`Este Miembro no Tiene Notificaciones`);

    return notificacion;
  }

  async update(id: number, updateNotificacionDto: UpdateNotificacionDto) {
    const notificacion = await this.reponotifi.preload({
      id,
      ...updateNotificacionDto,
    });
    if (!notificacion)
      throw new NotFoundException('Registro no Existe para ser Actualizado');

    try {
      await this.reponotifi.update(id, notificacion);
      return notificacion;
    } catch (error) {
      throw new BadRequestException(`Error Actualizando el registro ${error}`);
    }
  }

  async findid(id: number) {
    const notificacion = await this.reponotifi.find({
      where: { id: id },
    });
    if (notificacion.length <= 0)
      throw new BadRequestException(`Notificacion no Encontrada ${id}`);

    return notificacion;
  }
}
