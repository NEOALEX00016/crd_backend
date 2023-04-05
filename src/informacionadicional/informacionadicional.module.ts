import { Module } from '@nestjs/common';
import { InformacionadicionalService } from './informacionadicional.service';
import { InformacionadicionalController } from './informacionadicional.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { InformacionadicionalEntity } from './entities/informacionadicional.entity';

@Module({
  controllers: [InformacionadicionalController],
  providers: [InformacionadicionalService],
  imports: [TypeOrmModule.forFeature([InformacionadicionalEntity])],
})
export class InformacionadicionalModule {}
