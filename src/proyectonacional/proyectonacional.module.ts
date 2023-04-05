import { Module } from '@nestjs/common';
import { ProyectonacionalService } from './proyectonacional.service';
import { ProyectonacionalController } from './proyectonacional.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ProyectonacionalEntity } from './entities/proyectonacional.entity';

@Module({
  controllers: [ProyectonacionalController],
  providers: [ProyectonacionalService],
  imports: [TypeOrmModule.forFeature([ProyectonacionalEntity])],
})
export class ProyectonacionalModule {}
