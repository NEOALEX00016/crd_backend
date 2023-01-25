import { Module } from '@nestjs/common';
import { ModulosService } from './modulos.service';
import { ModulosController } from './modulos.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Moduloentity } from './entities/modulo.entity';

@Module({
  controllers: [ModulosController],
  providers: [ModulosService],
  imports: [TypeOrmModule.forFeature([Moduloentity])],
})
export class ModulosModule {}
