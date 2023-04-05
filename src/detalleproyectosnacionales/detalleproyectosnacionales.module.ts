import { Module } from '@nestjs/common';
import { DetalleproyectosnacionalesService } from './detalleproyectosnacionales.service';
import { DetalleproyectosnacionalesController } from './detalleproyectosnacionales.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { DetalleproyectosnacionaleEntity } from './entities/detalleproyectosnacionale.entity';

@Module({
  controllers: [DetalleproyectosnacionalesController],
  providers: [DetalleproyectosnacionalesService],
  imports: [TypeOrmModule.forFeature([DetalleproyectosnacionaleEntity])],
})
export class DetalleproyectosnacionalesModule {}
