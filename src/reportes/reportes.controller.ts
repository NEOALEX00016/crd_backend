import { Controller, Post, Body } from '@nestjs/common';
import { ReportesService } from './reportes.service';
import { Repmiembrosdto } from './dto/repmiembrosdto.dto';
import { Repactividadesdto } from './dto/repactividades.dto';
import { Repvoluntarioparticipantesdto } from './dto/repmiembrosparticipantes.dto';
import { Repvbeneficiariosalcanzadosdto } from './dto/repbeneficiariosalcanzados.dto';
import { Repactividadesneltiempodto } from './dto/repactividadeneltiempo.dto';

@Controller('reportes')
export class ReportesController {
  constructor(private readonly reportesService: ReportesService) {}

  @Post('miembros')
  miembros(@Body() repmiembrosdto: Repmiembrosdto) {
    return this.reportesService.miembros(repmiembrosdto);
  }
  @Post('actividades')
  actividad(@Body() repoactividadesdto: Repactividadesdto) {
    return this.reportesService.actividades(repoactividadesdto);
  }
  @Post('voluntarioparticipantes')
  voluntarioparticipantes(
    @Body() repvoluntarioparticipantesdto: Repvoluntarioparticipantesdto,
  ) {
    return this.reportesService.voluntarioparticipantes(
      repvoluntarioparticipantesdto,
    );
  }
  @Post('beneficiariosalcanzados')
  beneficiariosalcanzados(
    @Body() repvbeneficiariosalcanzadosdto: Repvbeneficiariosalcanzadosdto,
  ) {
    return this.reportesService.beneficiariosalcanzados(
      repvbeneficiariosalcanzadosdto,
    );
  }
  @Post('actividadeseneltiempo')
  actividadeseneltiempo(
    @Body() repactividadesneltiempodto: Repactividadesneltiempodto,
  ) {
    return this.reportesService.actividadeseneltiempo(
      repactividadesneltiempodto,
    );
  }
}
