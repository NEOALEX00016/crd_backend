import { Module } from '@nestjs/common';
import { DivisionService } from './division.service';
import { DivisionController } from './division.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { DivisionEntity } from './entities/division.entity';

@Module({
  controllers: [DivisionController],
  providers: [DivisionService],
  imports: [TypeOrmModule.forFeature([DivisionEntity])],
})
export class DivisionModule {}
