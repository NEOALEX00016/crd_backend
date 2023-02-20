import { Module } from '@nestjs/common';
import { DetallemiscursosService } from './detallemiscursos.service';
import { DetallemiscursosController } from './detallemiscursos.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { DetallemiscursoEntity } from './entities/detallemiscurso.entity';

@Module({
  controllers: [DetallemiscursosController],
  providers: [DetallemiscursosService],
  imports: [TypeOrmModule.forFeature([DetallemiscursoEntity])],
})
export class DetallemiscursosModule {}
