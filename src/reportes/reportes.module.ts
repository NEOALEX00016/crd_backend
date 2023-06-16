import { Module } from '@nestjs/common';
import { ReportesService } from './reportes.service';
import { ReportesController } from './reportes.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ReporteEntity } from './entities/reporte.entity';

@Module({
  controllers: [ReportesController],
  providers: [ReportesService],
  imports: [TypeOrmModule.forFeature([ReporteEntity])],
})
export class ReportesModule {}
