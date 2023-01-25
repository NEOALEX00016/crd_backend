import { Module } from '@nestjs/common';
import { SedesService } from './sedes.service';
import { SedesController } from './sedes.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { SedeEntity } from './entities/sede.entity';

@Module({
  controllers: [SedesController],
  providers: [SedesService],
  imports: [TypeOrmModule.forFeature([SedeEntity])],
})
export class SedesModule {}
