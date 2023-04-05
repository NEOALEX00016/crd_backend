import { IsString } from 'class-validator';

export class UpdateCursoPortadaDto {
  @IsString()
  portada: string;
}
