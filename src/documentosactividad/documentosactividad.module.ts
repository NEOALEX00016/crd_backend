import { Module } from '@nestjs/common';
import { DocumentosactividadService } from './documentosactividad.service';
import { DocumentosactividadController } from './documentosactividad.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { DocumentosactividadEntity } from './entities/documentosactividad.entity';

@Module({
  controllers: [DocumentosactividadController],
  providers: [DocumentosactividadService],
  imports: [TypeOrmModule.forFeature([DocumentosactividadEntity])],
  exports: [DocumentosactividadService],
})
export class DocumentosactividadModule {}
