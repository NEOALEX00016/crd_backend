import { PartialType } from '@nestjs/swagger';
import { CreateTiposdocumentoDto } from './create-tiposdocumento.dto';

export class UpdateTiposdocumentoDto extends PartialType(CreateTiposdocumentoDto) {}
