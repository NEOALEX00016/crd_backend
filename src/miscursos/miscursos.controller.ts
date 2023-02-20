import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { MiscursosService } from './miscursos.service';
import { CreateMiscursoDto } from './dto/create-miscurso.dto';
import { UpdateMiscursoDto } from './dto/update-miscurso.dto';

@Controller('miscursos')
export class MiscursosController {
  constructor(private readonly miscursosService: MiscursosService) {}

  @Post()
  create(@Body() createMiscursoDto: CreateMiscursoDto) {
    return this.miscursosService.create(createMiscursoDto);
  }

  @Get()
  findAll() {
    return this.miscursosService.findAll();
  }

  @Get('miembro/:id')
  findOne(@Param('id') id: string) {
    return this.miscursosService.findOne(+id);
  }

  @Get('miembrocurso/:id_miembro/:id_curso')
  findmiembrocurso(
    @Param('id_miembro') id_miembro: number,
    @Param('id_curso') id_curso: number,
  ) {
    return this.miscursosService.findmiembrocurso(id_miembro, id_curso);
  }
}
