import { Injectable, BadRequestException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { CreateMiscursoDto } from './dto/create-miscurso.dto';
import { MiscursoEntity } from './entities/miscurso.entity';

import { NotFoundException } from '@nestjs/common/exceptions/not-found.exception';
import { CursoEntity } from '../cursos/entities/curso.entity';
import { Repository } from 'typeorm';

@Injectable()
export class MiscursosService {
  constructor(
    @InjectRepository(MiscursoEntity)
    private readonly misrepo: Repository<MiscursoEntity>,
    @InjectRepository(CursoEntity)
    private readonly cursosrepo: Repository<CursoEntity>,
  ) {}
  async create(createMiscursoDto: CreateMiscursoDto) {
    const mis = await this.misrepo.create(createMiscursoDto);
    try {
      await this.misrepo.save(mis);
      return mis;
    } catch (error) {
      throw new BadRequestException(`Error Creando mis Cursos ${error}`);
    }
  }

  async findAll() {
    const mis = await this.misrepo.find();
    if (mis.length <= 0)
      throw new NotFoundException(`Esta Tabla no Contiene Informacion`);

    return mis;
  }

  async findOne(id: number) {
    const qry = this.misrepo.createQueryBuilder('mis');
    const mis = await qry

      .innerJoinAndMapOne(
        'mis.id_curso',
        CursoEntity,
        'curso',
        'mis.id_curso = curso.id',
      )
      .select(['mis.id_curso', 'curso'])
      .where('mis.id_miembro = :miembro', { miembro: id }) // or you can change condition to 'key.userId = :userId' because of you have `userId` in Key
      .getMany();

    if (!mis)
      throw new NotFoundException(
        `Cursos no encontrado para este miembro ${id}`,
      );

    console.log(mis);

    //const miscursos = await this.cursosrepo.findarray(detalle);

    //    console.log(miscursos);

    return mis;
  }

  async findmiembrocurso(id_miembro: number, id_curso: number) {
    const miscursos = await this.misrepo.findBy({
      id_curso: id_curso,
      id_miembro: id_miembro,
    });
    if (miscursos.length <= 0)
      throw new NotFoundException('Registro no Encontrado');

    return miscursos;
  }
}
