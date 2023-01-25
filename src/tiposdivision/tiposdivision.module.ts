import { Module } from '@nestjs/common';
import { TiposdivisionService } from './tiposdivision.service';
import { TiposdivisionController } from './tiposdivision.controller';
import { TiposdivisionEntity } from './entities/tiposdivision.entity';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AuthModule } from 'src/auth/auth.module';

@Module({
  controllers: [TiposdivisionController],
  providers: [TiposdivisionService],
  imports: [TypeOrmModule.forFeature([TiposdivisionEntity]), AuthModule],
})
export class TiposdivisionModule {}
