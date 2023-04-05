import { IsString } from 'class-validator';

export class UpdateCursoInsigniaDto {
  @IsString()
  insignia: string;
}
