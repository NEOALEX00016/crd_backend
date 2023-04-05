import { Module } from '@nestjs/common';
import { TipoinformacionService } from './tipoinformacion.service';
import { TipoinformacionController } from './tipoinformacion.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { TipoinformacionEntity } from './entities/tipoinformacion.entity';

@Module({
  controllers: [TipoinformacionController],
  providers: [TipoinformacionService],
  imports: [TypeOrmModule.forFeature([TipoinformacionEntity])],
})
export class TipoinformacionModule {}
