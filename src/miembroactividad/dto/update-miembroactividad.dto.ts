import { PartialType } from '@nestjs/swagger';
import { CreateMiembroactividadDto } from './create-miembroactividad.dto';

export class UpdateMiembroactividadDto extends PartialType(CreateMiembroactividadDto) {}
