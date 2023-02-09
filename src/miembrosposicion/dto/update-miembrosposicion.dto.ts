import { PartialType } from '@nestjs/swagger';
import { CreateMiembrosposicionDto } from './create-miembrosposicion.dto';

export class UpdateMiembrosposicionDto extends PartialType(CreateMiembrosposicionDto) {}
