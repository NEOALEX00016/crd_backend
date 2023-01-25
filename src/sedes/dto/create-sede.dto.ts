import { ApiProperty } from '@nestjs/swagger';
import { Type } from 'class-transformer';
import { IsNumber, IsString, IsDate, IsOptional } from 'class-validator';

export class CreateSedeDto {
  @IsNumber()
  @ApiProperty({
    description: 'Id del Pais a cual pertence',
    example: 1,
  })
  id_pais: number;

  @IsNumber()
  @ApiProperty({
    description: 'Id del Division a cual pertence el sede',
    example: 1,
  })
  id_division: number;
  @IsNumber()
  @ApiProperty({
    description: 'Tipo de Sede',
    example: 1,
  })
  id_tipo_sede: number;

  @IsString()
  @ApiProperty({
    description: 'Descripcion o Nombre',
    example: 'Sede Central',
  })
  nombre: string;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    description: 'Voluntarios Perteneciente a la Sede ',
    example: 1,
    default: 0,
  })
  voluntarios: number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    description: 'De cual sede Superior depende ',
    example: 1,
  })
  depende: number;

  @IsString()
  @ApiProperty({
    description: 'Estado Actual en el sistema ',
    example: 'Activo',
    enum: ['Activo', 'Inactivo'],
  })
  estado: string;
  @IsString()
  @ApiProperty({
    description: 'Usuario que agrego el Registro',
    example: 'neftali.rosario@gmail.com',
  })
  agregado_por: string;
  @IsDate()
  @IsOptional()
  @ApiProperty({
    description: 'Fecha y hora que se agrego el registro',
    example: '2022-03-29T13:34:00.000',
  })
  @Type(() => Date)
  agregado_en: Date;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    description: 'Id del Rol que Agrego el Registro',
    example: 1,
  })
  rol_agregado_id: number;
  @IsString()
  @IsOptional()
  @ApiProperty({
    description: 'Nombre del rol que agrego',
    example: 'Encargado de ',
  })
  rol_agregado_nom: string;
  @IsString()
  @IsOptional()
  @ApiProperty({
    description: 'Usuario que modifico el Registro',
    example: 'neftali.rosario@gmail.com',
  })
  modificado_por: string;
  @IsDate()
  @IsOptional()
  @Type(() => Date)
  @ApiProperty({
    description: 'Fecha y hora que se modifico el registro',
    example: '2022-03-29T13:34:00.000',
  })
  modificado_en: Date;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    description: 'Id del Rol que modifico el Registro',
    example: 1,
  })
  rol_modificado_id: number;
  @IsString()
  @IsOptional()
  @ApiProperty({
    description: 'Nombre del Rol que modifico el Registro',
    example: 1,
  })
  rol_modificado_nom: string;
}
