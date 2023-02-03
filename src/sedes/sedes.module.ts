import { Module } from '@nestjs/common';
import { SedesService } from './sedes.service';
import { SedesController } from './sedes.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { SedeEntity } from './entities/sede.entity';
import { AuthModule } from 'src/auth/auth.module';

@Module({
  controllers: [SedesController],
  providers: [SedesService],
  imports: [TypeOrmModule.forFeature([SedeEntity]), AuthModule],
})
export class SedesModule {}
