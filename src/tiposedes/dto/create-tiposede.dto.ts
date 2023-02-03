import { ApiProperty } from '@nestjs/swagger';
import { Type } from 'class-transformer';
import {
  IsDate,
  IsNumber,
  IsOptional,
  IsString,
  MinLength,
} from 'class-validator';

export class CreateTiposedeDto {
  @IsNumber()
  @ApiProperty({
    description: ' Al Tipo de division que Pertence',
    example: 1,
  })
  id_tipo_division: number;

  @IsNumber()
  @ApiProperty({
    description: 'El Pais que esta vinculado',
    example: '1',
  })
  id_pais: number;

  @IsString()
  @MinLength(5, { message: 'La sede debe contener 5 caracteres minimo' })
  @ApiProperty({
    description: 'Descripcion del Tipo de Sede',
    example: 'Sede Central, Sede Municipal',
  })
  nombre: string;
  @IsString()
  @ApiProperty({
    description: 'Estado del Registro Actual',
    example: 'Activo',
  })
  estado: string;
  @IsString()
  @ApiProperty({
    description: 'Quien Agregado el Registro',
    example: 'neftali.rosario@adn.com',
  })
  agregado_por: string;
  @IsDate()
  @IsOptional()
  @Type(() => Date)
  @ApiProperty({
    description: 'La Fecha que se Agrego el Registro',
    example: '2022-03-29T13:34:00.000',
  })
  agregado_en: Date;

  @IsNumber()
  @IsOptional()
  @ApiProperty({
    description: 'Id rol Agregado ',
    example: '1',
  })
  rol_agregado_id: number;
  @IsString()
  @IsOptional()
  @ApiProperty({
    description: 'Nombre del rol que agrego',
    example: 'Voluntario',
  })
  rol_agregado_nom: string;

  @IsString()
  @IsOptional()
  modificado_por: string;
  @IsDate()
  @IsOptional()
  @ApiProperty({
    description: 'La Fecha que se Modifico  el Registro',
    example: '2022-03-29T13:34:00.000',
  })
  modificado_en: Date;

  @IsNumber()
  @IsOptional()
  @ApiProperty({
    description: 'Id rol Modificado ',
    example: '1',
  })
  rol_modificado_id: number;
  @IsString()
  @IsOptional()
  @ApiProperty({
    description: 'Nombre del rol que modifico',
    example: 'Voluntario',
  })
  rol_modificado_nombre: string;
}
