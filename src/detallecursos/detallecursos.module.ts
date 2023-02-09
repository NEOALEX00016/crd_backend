import { Module } from '@nestjs/common';
import { DetallecursosService } from './detallecursos.service';
import { DetallecursosController } from './detallecursos.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { DetallecursoEntity } from './entities/detallecurso.entity';

@Module({
  controllers: [DetallecursosController],
  providers: [DetallecursosService],
  imports: [TypeOrmModule.forFeature([DetallecursoEntity])],
  exports: [DetallecursosService],
})
export class DetallecursosModule {}
