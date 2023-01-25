import { Module } from '@nestjs/common';
import { DivisionService } from './division.service';
import { DivisionController } from './division.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { DivisionEntity } from './entities/division.entity';
import { AuthModule } from 'src/auth/auth.module';

@Module({
  controllers: [DivisionController],
  providers: [DivisionService],
  imports: [TypeOrmModule.forFeature([DivisionEntity]), AuthModule],
})
export class DivisionModule {}
