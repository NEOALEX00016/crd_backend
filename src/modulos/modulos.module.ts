import { Module } from '@nestjs/common';
import { ModulosService } from './modulos.service';
import { ModulosController } from './modulos.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Moduloentity } from './entities/modulo.entity';
import { AuthModule } from 'src/auth/auth.module';

@Module({
  controllers: [ModulosController],
  providers: [ModulosService],
  imports: [TypeOrmModule.forFeature([Moduloentity]), AuthModule],
})
export class ModulosModule {}
