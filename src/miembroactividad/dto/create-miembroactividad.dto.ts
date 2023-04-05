import { IsDate, IsNumber, IsOptional, IsString } from 'class-validator';

export class CreateMiembroactividadDto {
  @IsNumber()
  @IsOptional()
  id_miembro: number;

  @IsNumber()
  @IsOptional()
  id_actividad: number;

  @IsDate()
  @IsOptional()
  fecha_de_correo: Date;

  @IsDate()
  @IsOptional()
  aceptado_en: Date;

  @IsDate()
  @IsOptional()
  rechazado_en: Date;

  @IsString()
  @IsOptional()
  estado: string;
}
