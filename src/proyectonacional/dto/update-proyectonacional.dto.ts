import { PartialType } from '@nestjs/swagger';
import { CreateProyectonacionalDto } from './create-proyectonacional.dto';

export class UpdateProyectonacionalDto extends PartialType(CreateProyectonacionalDto) {}
