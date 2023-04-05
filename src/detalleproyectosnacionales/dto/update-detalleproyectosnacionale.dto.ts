import { PartialType } from '@nestjs/swagger';
import { CreateDetalleproyectosnacionaleDto } from './create-detalleproyectosnacionale.dto';

export class UpdateDetalleproyectosnacionaleDto extends PartialType(CreateDetalleproyectosnacionaleDto) {}
