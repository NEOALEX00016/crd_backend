import { PartialType } from '@nestjs/swagger';
import { CreateDetallecursoDto } from './create-detallecurso.dto';

export class UpdateDetallecursoDto extends PartialType(CreateDetallecursoDto) {}
