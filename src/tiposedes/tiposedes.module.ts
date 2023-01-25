import { Module } from '@nestjs/common';
import { TiposedesService } from './tiposedes.service';
import { TiposedesController } from './tiposedes.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { TiposedeEntity } from './entities/tiposede.entity';
import { AuthModule } from 'src/auth/auth.module';

@Module({
  controllers: [TiposedesController],
  providers: [TiposedesService],
  imports: [TypeOrmModule.forFeature([TiposedeEntity]), AuthModule],
})
export class TiposedesModule {}
