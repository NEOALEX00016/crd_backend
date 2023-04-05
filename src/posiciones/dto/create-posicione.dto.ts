import { ApiProperty } from '@nestjs/swagger';
import { Type } from 'class-transformer';
import { IsDate, IsNumber, IsOptional, IsString } from 'class-validator';

export class CreatePosicioneDto {
  @IsNumber()
  @ApiProperty({
    description: 'id pais asociado',
    example: 1,
  })
  id_pais: number;
  @IsNumber()
  @ApiProperty({
    description: 'id sede asociado',
    example: 1,
  })
  id_sede: number;
  @IsNumber()
  @ApiProperty({
    description: 'id area asociado',
    example: 1,
  })
  id_area: number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    description: 'id rol asociado',
    example: 1,
  })
  id_rol: number;
  @IsString()
  @ApiProperty({
    description: 'Nombre de la Posicion',
    example: 'Voluntario',
  })
  nombre: string;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    description: 'Posiciones disponibles',
    example: 10000,
  })
  posiciones_disponible: number;
  @IsNumber()
  @IsOptional()
  
  @ApiProperty({
    description: 'Esto es si depede de otra posicion',
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
    nullable: true,
  })
  modificado_en: Date;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    description: 'Id del Rol que modifico el Registro',
    example: 1,
    nullable: true,
  })
  rol_modificado_id: number;
  @IsString()
  @IsOptional()
  @ApiProperty({
    description: 'Nombre del Rol que modifico el Registro',
    example: 1,
    nullable: true,
  })
  rol_modificado_nom: string;
}
