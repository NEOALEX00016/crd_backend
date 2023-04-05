import { PartialType } from '@nestjs/swagger';
import { CreateTipoinformacionDto } from './create-tipoinformacion.dto';

export class UpdateTipoinformacionDto extends PartialType(CreateTipoinformacionDto) {}
