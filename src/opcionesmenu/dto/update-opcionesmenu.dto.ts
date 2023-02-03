import { PartialType } from '@nestjs/swagger';
import { IsNumber, IsOptional } from 'class-validator';
import { CreateOpcionesmenuDto } from './create-opcionesmenu.dto';

export class UpdateOpcionesmenuDto extends PartialType(CreateOpcionesmenuDto) {
  @IsNumber()
  @IsOptional()
  id_pais?: number;
}
