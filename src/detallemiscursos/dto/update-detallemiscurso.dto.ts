import { IsNumber, IsString } from 'class-validator';

export class UpdateDetallemiscursoDto {
  @IsNumber()
  tiempo: number;
  @IsString()
  estado: string;
}
