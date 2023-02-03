import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { MiembrosService } from './miembros.service';
import { CreateMiembroDto } from './dto/create-miembro.dto';
import { UpdateMiembroDto } from './dto/update-miembro.dto';

@Controller('miembros')
export class MiembrosController {
  constructor(private readonly miembrosService: MiembrosService) {}

  @Post()
  create(@Body() createMiembroDto: CreateMiembroDto) {
    return this.miembrosService.create(createMiembroDto);
  }

  @Get()
  findAll() {
    return this.miembrosService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.miembrosService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateMiembroDto: UpdateMiembroDto) {
    return this.miembrosService.update(+id, updateMiembroDto);
  }

  @Get('pais/:id')
  porpais(@Param('id') id: string) {
    return this.miembrosService.porpais(+id);
  }
  @Get('sede/:id')
  porsede(@Param('id') id: string) {
    return this.miembrosService.porsede(+id);
  }

  @Get('area/:id')
  porarea(@Param('id') id: string) {
    return this.miembrosService.porsarea(+id);
  }

  @Get('sedeyarea/:sede/:area')
  porsedearea(@Param('sede') sede: number, @Param('area') area: number) {
    return this.miembrosService.porsedearea(+sede, +area);
  }
}
