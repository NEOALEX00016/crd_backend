import { Controller, Get, Post, Body, Patch, Param } from '@nestjs/common';
import { ProyectonacionalService } from './proyectonacional.service';
import { CreateProyectonacionalDto } from './dto/create-proyectonacional.dto';
import { UpdateProyectonacionalDto } from './dto/update-proyectonacional.dto';

@Controller('proyectonacional')
export class ProyectonacionalController {
  constructor(
    private readonly proyectonacionalService: ProyectonacionalService,
  ) {}

  @Post()
  create(@Body() createProyectonacionalDto: CreateProyectonacionalDto) {
    return this.proyectonacionalService.create(createProyectonacionalDto);
  }

  @Get()
  findAll() {
    return this.proyectonacionalService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.proyectonacionalService.findOne(+id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateProyectonacionalDto: UpdateProyectonacionalDto,
  ) {
    return this.proyectonacionalService.update(+id, updateProyectonacionalDto);
  }
}
