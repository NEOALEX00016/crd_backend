import { IsNumber, IsString, MinLength } from 'class-validator';

export class CreateTiposedeDto {
  @IsNumber()
  id_tipo_division: number;

  @IsNumber()
  id_pais: number;

  @IsString()
  @MinLength(5, { message: 'El Nombre de Alexis' })
  nombre: string;
}
