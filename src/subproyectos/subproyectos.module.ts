import { Module } from '@nestjs/common';
import { SubproyectosService } from './subproyectos.service';
import { SubproyectosController } from './subproyectos.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { SubproyectoEntity } from './entities/subproyecto.entity';

@Module({
  controllers: [SubproyectosController],
  providers: [SubproyectosService],
  imports: [TypeOrmModule.forFeature([SubproyectoEntity])],
})
export class SubproyectosModule {}
