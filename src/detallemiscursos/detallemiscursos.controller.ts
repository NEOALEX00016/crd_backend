import { Controller, Get, Body, Patch, Param } from '@nestjs/common';
import { DetallemiscursosService } from './detallemiscursos.service';
import { UpdateDetallemiscursoDto } from './dto/update-detallemiscurso.dto';

@Controller('detallemiscursos')
export class DetallemiscursosController {
  constructor(
    private readonly detallemiscursosService: DetallemiscursosService,
  ) {}

  @Get()
  findAll() {
    return this.detallemiscursosService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.detallemiscursosService.findOne(+id);
  }

  @Get('miembrocurso/:idmiembro/:idcurso')
  findmiebro(
    @Param('idmiembro') idmiembro: string,
    @Param('idcurso') idcurso: string,
  ) {
    return this.detallemiscursosService.finddetallemiscursos(
      +idmiembro,
      +idcurso,
    );
  }

  @Patch('tiempodetcurso/:iddetalle')
  updateportada(
    @Param('iddetalle') iddetalle: string,
    @Body() updateDetallemiscursoDto: UpdateDetallemiscursoDto,
  ) {
    return this.detallemiscursosService.update(
      +iddetalle,
      updateDetallemiscursoDto,
    );
  }
}
