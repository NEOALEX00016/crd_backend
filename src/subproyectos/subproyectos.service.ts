import { Injectable, BadRequestException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { CreateSubproyectoDto } from './dto/create-subproyecto.dto';
import { UpdateSubproyectoDto } from './dto/update-subproyecto.dto';
import { SubproyectoEntity } from './entities/subproyecto.entity';
import { Repository } from 'typeorm';
import { NotFoundException } from '@nestjs/common/exceptions/not-found.exception';

@Injectable()
export class SubproyectosService {
  constructor(
    @InjectRepository(SubproyectoEntity)
    private readonly reposub: Repository<SubproyectoEntity>,
  ) {}

  async create(createSubproyectoDto: CreateSubproyectoDto) {
    const sub = await this.reposub.create(createSubproyectoDto);
    try {
      await this.reposub.save(sub);
      return sub;
    } catch (error) {
      throw new BadRequestException('Error Registrando este Sub Proyecto');
    }
  }

  async findAll() {
    const sub = await this.reposub.find();

    if (sub.length <= 0)
      throw new NotFoundException('Esta Tabla no Contiene Registro');

    return sub;
  }

  async findOne(id: number) {
    const sub = await this.reposub.find({ where: { id: id } });

    if (sub.length <= 0)
      throw new NotFoundException(`Registro no Encontrado con el id ${id}`);

    return sub;
  }

  async update(id: number, updateSubproyectoDto: UpdateSubproyectoDto) {
    const sub = await this.reposub.preload({ id, ...updateSubproyectoDto });

    if (!sub)
      throw new NotFoundException('Registro no Encontrado para actualizar');
    try {
      await this.reposub.update(id, sub);
      return sub;
    } catch (error) {
      throw new BadRequestException('Error Actualizando este Sub Proyecto');
    }
  }

  async finsede(id: number) {
    const sub = await this.reposub.find({ where: { id_sede: id } });

    if (sub.length <= 0)
      throw new NotFoundException(`Registro no Encontrado con el id ${id}`);

    return sub;
  }

  async findproyectonacional(id: number) {
    const sub = await this.reposub.find({
      where: { id_proyecto_nacional: id },
    });

    if (sub.length <= 0)
      throw new NotFoundException(`Registro no Encontrado con el id ${id}`);

    return sub;
  }
}
