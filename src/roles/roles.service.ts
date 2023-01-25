import { Injectable, BadRequestException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { CreateRoleDto } from './dto/create-role.dto';
import { UpdateRoleDto } from './dto/update-role.dto';
import { RoleEntity } from './entities/role.entity';
import { Repository } from 'typeorm';
import { NotFoundException } from '@nestjs/common/exceptions/not-found.exception';

@Injectable()
export class RolesService {
  constructor(
    @InjectRepository(RoleEntity)
    private readonly reporol: Repository<RoleEntity>,
  ) {}
  async create(createRoleDto: CreateRoleDto) {
    const rol = this.reporol.create(createRoleDto);

    try {
      await this.reporol.save(rol);
      return rol;
    } catch (error) {
      throw new BadRequestException(`Error Insertando rol ${error}`);
    }
  }

  async findAll() {
    const rol = await this.reporol.find();
    if (!rol.length) throw new NotFoundException('Tabla de Registro Vacia');

    return rol;
  }

  async findOne(term: string) {
    const qry = this.reporol.createQueryBuilder();
    const rol = await qry
      .where('descripcion=:descripcion', { descripcion: term })
      .getOne();

    if (!rol) throw new NotFoundException('Rol No Encontrado');
    return rol;
  }

  async update(id: number, updateRoleDto: UpdateRoleDto) {
    const rol = await this.reporol.preload({ id, ...updateRoleDto });

    if (!rol)
      throw new NotFoundException('Registro no encontrado para Actualizar');
    try {
      await this.reporol.update(id, rol);
      return rol;
    } catch (error) {
      throw new BadRequestException('Error actualizadon el Rol');
    }
  }
}
