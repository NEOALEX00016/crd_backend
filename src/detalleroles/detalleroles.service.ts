import { Injectable, BadRequestException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { CreateDetalleroleDto } from './dto/create-detallerole.dto';
import { UpdateDetalleroleDto } from './dto/update-detallerole.dto';
import { DetalleroleEntity } from './entities/detallerole.entity';
import { Repository } from 'typeorm';
import { NotFoundException } from '@nestjs/common/exceptions/not-found.exception';

@Injectable()
export class DetallerolesService {
  constructor(
    @InjectRepository(DetalleroleEntity)
    private readonly repodeta: Repository<DetalleroleEntity>,
  ) {}

  async create(createDetalleroleDto: CreateDetalleroleDto) {
    const det = this.repodeta.create(createDetalleroleDto);

    try {
      await this.repodeta.save(det);
      return det;
    } catch (error) {
      throw new BadRequestException(`Error Insertando el Registro ${error}`);
    }
  }

  async findAll() {
    const det = await this.repodeta.find();

    if (det.length <= 0)
      throw new NotFoundException('Esta Tabla no Contiente datos ');

    return det;
  }

  async findOne(id: number) {
    const det = await this.repodeta.findBy({ id_roles: id });

    if (det.length <= 0) throw new NotFoundException('Registro No Encontrado');

    return det;
  }

  async update(id: number, updateDetalleroleDto: UpdateDetalleroleDto) {
    const det = await this.repodeta.preload({ id, ...updateDetalleroleDto });
    if (!det) throw new NotFoundException('Registro No Encontrado');

    try {
      await this.repodeta.update(id, det);
      return det;
    } catch (error) {
      throw new BadRequestException('Error Actualizado el Registro');
    }

    return `This action updates a #${id} detallerole`;
  }
}
