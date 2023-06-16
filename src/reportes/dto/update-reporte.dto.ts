import { PartialType } from '@nestjs/swagger';
import { Repmiembrosdto } from './repmiembrosdto.dto';

export class UpdateReporteDto extends PartialType(Repmiembrosdto) {}
