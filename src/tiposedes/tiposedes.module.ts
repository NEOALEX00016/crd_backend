import { Module } from '@nestjs/common';
import { TiposedesService } from './tiposedes.service';
import { TiposedesController } from './tiposedes.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { TiposedeEntity } from './entities/tiposede.entity';

@Module({
  controllers: [TiposedesController],
  providers: [TiposedesService],
  imports: [TypeOrmModule.forFeature([TiposedeEntity])],
})
export class TiposedesModule {}
