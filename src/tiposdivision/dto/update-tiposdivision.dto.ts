import { PartialType } from '@nestjs/swagger';
import CreateTiposdivisionDto from './create-tiposdivision.dto';

export class UpdateTiposdivisionDto extends PartialType(
  CreateTiposdivisionDto,
) {}
