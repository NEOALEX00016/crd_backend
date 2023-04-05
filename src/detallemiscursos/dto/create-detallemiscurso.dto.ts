import { Column } from 'typeorm';
import { IsString, IsNumber } from 'class-validator';

export class CreateDetallemiscursoDto {
  @IsNumber()
  id: number;
  @IsNumber()
  id_mis_cursos: number;
  @IsNumber()
  id_detalle: number;
  @IsNumber()
  id_miembro: number;
  @IsNumber()
  tiempo: number;
  @IsString()
  estado: string;
  @IsNumber()
  id_curso: number;
  @IsString()
  titulo: string;
  @IsString()
  descripcion: string;
  @IsString()
  url: string;
}
