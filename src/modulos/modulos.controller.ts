import { Controller, Get, Param } from '@nestjs/common';
import { ModulosService } from './modulos.service';

@Controller('modulos')
export class ModulosController {
  constructor(private readonly modulosService: ModulosService) {}

  @Get()
  findAll() {
    return this.modulosService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: number) {
    return this.modulosService.findOne(id);
  }
}
