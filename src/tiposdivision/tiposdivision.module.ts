import { Module } from '@nestjs/common';
import { TiposdivisionService } from './tiposdivision.service';
import { TiposdivisionController } from './tiposdivision.controller';
import { TiposdivisionEntity } from './entities/tiposdivision.entity';
import { TypeOrmModule } from '@nestjs/typeorm';

@Module({
  controllers: [TiposdivisionController],
  providers: [TiposdivisionService],
  imports: [TypeOrmModule.forFeature([TiposdivisionEntity])],
})
export class TiposdivisionModule {}
