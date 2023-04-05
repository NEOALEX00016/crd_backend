import { Injectable, BadRequestException } from '@nestjs/common';
import { CreateCursoDto } from './dto/create-curso.dto';
import { UpdateCursoDto } from './dto/update-curso.dto';
import { CursoEntity } from './entities/curso.entity';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';
import { NotFoundException } from '@nestjs/common/exceptions/not-found.exception';
import { UpdateCursoColectionDto } from './dto/update-curso_colection.dto';
import { UpdateCursoPortadaDto } from './dto/update-cursoportada.dto';
import { UpdateCursoInsigniaDto } from './dto/update-cursoinsignia.dto';

@Injectable()
export class CursosService {
  constructor(
    @InjectRepository(CursoEntity)
    private readonly cursorepo: Repository<CursoEntity>,
  ) {}
  async create(createCursoDto: CreateCursoDto) {
    const cursos = await this.cursorepo.create(createCursoDto);

    try {
      await this.cursorepo.save(cursos);
      return cursos;
    } catch (error) {
      throw new BadRequestException(`Error Creando Cursos ${error}`);
    }
  }

  async findAll() {
    const cursos = await this.cursorepo.find();
    if (cursos.length <= 0)
      throw new NotFoundException('Esta Tabla no Contiene Cursos');
    return cursos;
  }

  async findOne(id: number) {
    const cursos = await this.cursorepo.findOneBy({ id: id });
    if (!cursos)
      throw new NotFoundException(`Registro con el id ${id} no encontrado`);
    return cursos;
  }

  async update(id: number, updateCursoDto: UpdateCursoDto) {
    const curso = await this.cursorepo.preload({ id, ...updateCursoDto });
    if (!curso) throw new NotFoundException('Error Encontrando Registro');
    try {
      await this.cursorepo.update(id, curso);
      return curso;
    } catch (error) {
      throw new NotFoundException('Error Actualizando Cursos');
    }
  }

  async updateColection(
    id: number,
    updateCursoColectionDto: UpdateCursoColectionDto,
  ) {
    const curso = await this.cursorepo.preload({
      id,
      ...updateCursoColectionDto,
    });
    console.log(curso);
    if (!curso) throw new NotFoundException('Error Encontrando Registro');
    try {
      await this.cursorepo.update(id, curso);
      return curso;
    } catch (error) {
      throw new NotFoundException('Error Actualizando la Coleccion del Cursos');
    }
  }

  async updateportada(
    id: number,
    updateCursoportadaDto: UpdateCursoPortadaDto,
  ) {
    const curso = await this.cursorepo.preload({
      id,
      ...updateCursoportadaDto,
    });
    console.log(curso);

    if (!curso) throw new NotFoundException('Error Encontrando Registro');
    try {
      await this.cursorepo.update(id, curso);
      return curso;
    } catch (error) {
      throw new NotFoundException('Error Actualizando la Coleccion del Cursos');
    }
  }

  async findarray(id: any) {
    const cursos = await this.cursorepo.find({ where: { id: id } });

    console.log(cursos);
  }

  async updateinsignia(
    id: number,
    updateCursoInsigniaDto: UpdateCursoInsigniaDto,
  ) {
    const curso = await this.cursorepo.preload({
      id,
      ...updateCursoInsigniaDto,
    });
    console.log(curso);

    if (!curso) throw new NotFoundException('Error Encontrando Registro');
    try {
      await this.cursorepo.update(id, curso);
      return curso;
    } catch (error) {
      throw new NotFoundException('Error Actualizando la Coleccion del Cursos');
    }
  }
}
