import { PartialType } from '@nestjs/swagger';
import { CreateInformacionadicionalDto } from './create-informacionadicional.dto';

export class UpdateInformacionadicionalDto extends PartialType(CreateInformacionadicionalDto) {}
