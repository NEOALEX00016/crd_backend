import { PartialType } from '@nestjs/swagger';
import { CreateMiscursoDto } from './create-miscurso.dto';

export class UpdateMiscursoDto extends PartialType(CreateMiscursoDto) {}
