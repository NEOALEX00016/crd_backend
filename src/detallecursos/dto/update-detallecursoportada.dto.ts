import { IsString } from 'class-validator';

export class UpdateDetallecursoportadaDto {
  @IsString()
  portada: string;
}
