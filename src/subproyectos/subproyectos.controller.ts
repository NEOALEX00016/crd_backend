import { Controller, Get, Post, Body, Patch, Param } from '@nestjs/common';
import { SubproyectosService } from './subproyectos.service';
import { CreateSubproyectoDto } from './dto/create-subproyecto.dto';
import { UpdateSubproyectoDto } from './dto/update-subproyecto.dto';

@Controller('subproyectos')
export class SubproyectosController {
  constructor(private readonly subproyectosService: SubproyectosService) {}

  @Post()
  create(@Body() createSubproyectoDto: CreateSubproyectoDto) {
    return this.subproyectosService.create(createSubproyectoDto);
  }

  @Get()
  findAll() {
    return this.subproyectosService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.subproyectosService.findOne(+id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateSubproyectoDto: UpdateSubproyectoDto,
  ) {
    return this.subproyectosService.update(+id, updateSubproyectoDto);
  }

  @Get('sede/:id')
  finsede(@Param('id') id: string) {
    return this.subproyectosService.finsede(+id);
  }

  @Get('nacional/:id')
  findproyectonacional(@Param('id') id: string) {
    return this.subproyectosService.findproyectonacional(+id);
  }
}
