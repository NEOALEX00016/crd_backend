import { Module } from '@nestjs/common';
import { PosicionesService } from './posiciones.service';
import { PosicionesController } from './posiciones.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { PosicioneEntity } from './entities/posicione.entity';
import { AuthModule } from 'src/auth/auth.module';

@Module({
  controllers: [PosicionesController],
  providers: [PosicionesService],
  imports: [TypeOrmModule.forFeature([PosicioneEntity]), AuthModule],
})
export class PosicionesModule {}
