import { Module } from '@nestjs/common';
import { MiscursosService } from './miscursos.service';
import { MiscursosController } from './miscursos.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { MiscursoEntity } from './entities/miscurso.entity';
import { CursoEntity } from '../cursos/entities/curso.entity';
import { CursosService } from '../cursos/cursos.service';
import { CursosModule } from '../cursos/cursos.module';

@Module({
  controllers: [MiscursosController],
  providers: [MiscursosService],
  imports: [TypeOrmModule.forFeature([MiscursoEntity, CursoEntity])],
})
export class MiscursosModule {}
