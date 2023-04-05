import { Controller, Get, Post, Body, Patch, Param } from '@nestjs/common';
import { MiembroactividadService } from './miembroactividad.service';
import { CreateMiembroactividadDto } from './dto/create-miembroactividad.dto';
import { UpdateMiembroactividadDto } from './dto/update-miembroactividad.dto';

@Controller('miembroactividad')
export class MiembroactividadController {
  constructor(
    private readonly miembroactividadService: MiembroactividadService,
  ) {}

  @Post()
  create(@Body() createMiembroactividadDto: CreateMiembroactividadDto) {
    return this.miembroactividadService.create(createMiembroactividadDto);
  }

  @Get()
  findAll() {
    return this.miembroactividadService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.miembroactividadService.findOne(+id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateMiembroactividadDto: UpdateMiembroactividadDto,
  ) {
    return this.miembroactividadService.update(+id, updateMiembroactividadDto);
  }

  @Post('noficiaractividad')
  notificaractivida(
    @Body('posicion') posicion: number,
    @Body('actividad') actividad: number,
  ) {
    return this.miembroactividadService.notificaractivida(posicion, actividad);
  }
  @Get('miembro/:miembro/:actividad')
  findOneactividadmiembro(
    @Param('miembro') miembro: number,
    @Param('actividad') actividad: number,
  ) {
    return this.miembroactividadService.findOneactividadmiembro(
      miembro,
      actividad,
    );
  }

  @Get('cantidad/:id')
  findcantidad(@Param('id') id: number) {
    return this.miembroactividadService.findcantidad(id);
  }

  @Get('miembrosaceptados/:id')
  findaceptados(@Param('id') id: number) {
    return this.miembroactividadService.findaceptados(id);
  }
}
