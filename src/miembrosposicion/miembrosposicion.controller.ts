import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { MiembrosposicionService } from './miembrosposicion.service';
import { CreateMiembrosposicionDto } from './dto/create-miembrosposicion.dto';
import { UpdateMiembrosposicionDto } from './dto/update-miembrosposicion.dto';

@Controller('miembrosposicion')
export class MiembrosposicionController {
  constructor(
    private readonly miembrosposicionService: MiembrosposicionService,
  ) {}

  @Post()
  create(@Body() createMiembrosposicionDto: CreateMiembrosposicionDto) {
    return this.miembrosposicionService.create(createMiembrosposicionDto);
  }

  @Get()
  findAll() {
    return this.miembrosposicionService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.miembrosposicionService.findOne(+id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateMiembrosposicionDto: UpdateMiembrosposicionDto,
  ) {
    return this.miembrosposicionService.update(+id, updateMiembrosposicionDto);
  }
}
