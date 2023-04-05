import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { DetalleproyectosnacionalesService } from './detalleproyectosnacionales.service';
import { CreateDetalleproyectosnacionaleDto } from './dto/create-detalleproyectosnacionale.dto';
import { UpdateDetalleproyectosnacionaleDto } from './dto/update-detalleproyectosnacionale.dto';

@Controller('detalleproyectosnacionales')
export class DetalleproyectosnacionalesController {
  constructor(
    private readonly detalleproyectosnacionalesService: DetalleproyectosnacionalesService,
  ) {}

  @Post()
  create(
    @Body()
    createDetalleproyectosnacionaleDto: CreateDetalleproyectosnacionaleDto,
  ) {
    return this.detalleproyectosnacionalesService.create(
      createDetalleproyectosnacionaleDto,
    );
  }

  @Get()
  findAll() {
    return this.detalleproyectosnacionalesService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.detalleproyectosnacionalesService.findOne(+id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body()
    updateDetalleproyectosnacionaleDto: UpdateDetalleproyectosnacionaleDto,
  ) {
    return this.detalleproyectosnacionalesService.update(
      +id,
      updateDetalleproyectosnacionaleDto,
    );
  }


  @Get('proyecto/:id')
  findproyecto(@Param('id') id: string) {
    return this.detalleproyectosnacionalesService.findproyecto(+id);
  }
}
