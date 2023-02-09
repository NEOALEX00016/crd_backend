import { Controller, Get, Post, Body, Patch, Param } from '@nestjs/common';
import { CursosService } from './cursos.service';
import { CreateCursoDto } from './dto/create-curso.dto';
import { UpdateCursoDto } from './dto/update-curso.dto';
import { UpdateCursoPortadaDto } from './dto/update-cursoportada.dto';
import { UpdateCursoColectionDto } from './dto/update-curso_colection.dto';

@Controller('cursos')
export class CursosController {
  constructor(private readonly cursosService: CursosService) {}

  @Post()
  create(@Body() createCursoDto: CreateCursoDto) {
    return this.cursosService.create(createCursoDto);
  }

  @Get()
  findAll() {
    return this.cursosService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.cursosService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateCursoDto: UpdateCursoDto) {
    return this.cursosService.update(+id, updateCursoDto);
  }

  @Patch('colection/:id')
  updatecolection(
    @Param('id') id: string,
    @Body() updateCursoColectionDto: UpdateCursoColectionDto,
  ) {
    return this.cursosService.update(+id, updateCursoColectionDto);
  }

  @Patch('portada/:id')
  updateportada(
    @Param('id') id: string,
    @Body() updateCursoPortadaDto: UpdateCursoPortadaDto,
  ) {
    return this.cursosService.updateportada(+id, updateCursoPortadaDto);
  }
}
