import { Controller, Get, Post, Body, Patch, Param } from '@nestjs/common';
import { DetallecursosService } from './detallecursos.service';
import { CreateDetallecursoDto } from './dto/create-detallecurso.dto';
import { UpdateDetallecursoDto } from './dto/update-detallecurso.dto';
import { UpdateDetallecursoportadaDto } from './dto/update-detallecursoportada.dto';
import { UpdateDetallecursourlDto } from './dto/update-detallecururl.dto';

@Controller('detallecursos')
export class DetallecursosController {
  constructor(private readonly detallecursosService: DetallecursosService) {}

  @Post()
  create(@Body() createDetallecursoDto: CreateDetallecursoDto) {
    return this.detallecursosService.create(createDetallecursoDto);
  }

  @Get()
  findAll() {
    return this.detallecursosService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.detallecursosService.findOne(+id);
  }
  @Get('curso/:id')
  findCurso(@Param('id') id: string) {
    return this.detallecursosService.findCurso(+id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateDetallecursoDto: UpdateDetallecursoDto,
  ) {
    return this.detallecursosService.update(+id, updateDetallecursoDto);
  }
  @Patch('portada/:id')
  updateportada(
    @Param('id') id: string,
    @Body() updateDetallecursoportadaDto: UpdateDetallecursoportadaDto,
  ) {
    return this.detallecursosService.updateportada(
      +id,
      updateDetallecursoportadaDto,
    );
  }

  @Patch('url/:id')
  updateurl(
    @Param('id') id: string,
    @Body() updateDetallecursourlDto: UpdateDetallecursourlDto,
  ) {
    return this.detallecursosService.updateurl(+id, updateDetallecursourlDto);
  }
}
