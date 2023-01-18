import { PartialType } from '@nestjs/swagger';
import { CreateTiposedeDto } from './create-tiposede.dto';

export class UpdateTiposedeDto extends PartialType(CreateTiposedeDto) {}
