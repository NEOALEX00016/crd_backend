import { Module } from '@nestjs/common';
import { ActividadesService } from './actividades.service';
import { ActividadesController } from './actividades.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ActividadesEntity } from './entities/actividade.entity';

@Module({
  controllers: [ActividadesController],
  providers: [ActividadesService],
  imports: [TypeOrmModule.forFeature([ActividadesEntity])],
})
export class ActividadesModule {}
