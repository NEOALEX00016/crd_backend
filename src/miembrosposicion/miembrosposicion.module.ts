import { Module } from '@nestjs/common';
import { MiembrosposicionService } from './miembrosposicion.service';
import { MiembrosposicionController } from './miembrosposicion.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { MiembrosposicionEntity } from './entities/miembrosposicion.entity';

@Module({
  controllers: [MiembrosposicionController],
  providers: [MiembrosposicionService],
  imports: [TypeOrmModule.forFeature([MiembrosposicionEntity])],
})
export class MiembrosposicionModule {}
