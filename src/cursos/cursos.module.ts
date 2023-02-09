import { Module } from '@nestjs/common';
import { CursosService } from './cursos.service';
import { CursosController } from './cursos.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { CursoEntity } from './entities/curso.entity';

@Module({
  controllers: [CursosController],
  providers: [CursosService],
  imports: [TypeOrmModule.forFeature([CursoEntity])],
  exports: [CursosService],
})
export class CursosModule {}
