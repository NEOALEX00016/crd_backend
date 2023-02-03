import { ApiProperty } from '@nestjs/swagger';
import {
  IsBoolean,
  IsDate,
  IsNotEmpty,
  IsNumber,
  IsOptional,
  IsString,
} from 'class-validator';

export class CreateDetalleroleDto {
  @IsNumber()
  id_pais: number;
  @IsNumber()
  id_roles: number;
  @IsNumber()
  id_opcion: number;
  @IsBoolean()
  leer: boolean;
  @IsBoolean()
  escribir: boolean;
  @IsBoolean()
  imprimir: boolean;
  @IsBoolean()
  eliminar: boolean;

  @IsString()
  @IsNotEmpty()
  @ApiProperty({
    description: 'Esto es el Estado',
    example: '[Activo,Inactivo]',
  })
  estado: string;

  @IsString()
  @ApiProperty({
    description: 'Esto es el Usuario que realizo la insercion del registro',
    example: 'NeftaliRosario',
  })
  agregado_por: string;

  @IsDate()
  @IsOptional()
  @ApiProperty({
    description: 'La Fecha que se Agrego el Registro',
    example: '2022-03-29T13:34:00.000',
  })
  agregado_en: Date;

  @IsNumber()
  @IsOptional()
  @ApiProperty({
    description:
      'El id del con el rol que se realizo Esto porque un mismo usuario puede tener varios roles al mismo tiempo',
    example: '1',
  })
  rol_agregado_id: number;
  @IsString()
  @IsOptional()
  @ApiProperty({
    description:
      'El Nombre del con el rol que se realizo Esto porque un mismo usuario puede tener varios roles al mismo tiempo',
    example: '2022-03-29T13:34:00.000',
  })
  rol_agregado_nom: string;

  @IsString()
  @IsOptional()
  @ApiProperty({
    description: 'Esto es el Usuario que realizo la modificacion del registro',
    example: 'NeftaliRosario',
  })
  modificado_por: string;

  @IsDate()
  @IsOptional()
  @ApiProperty({
    description: 'La Fecha que se modifico el Registro',
    example: '2022-03-29T13:34:00.000',
  })
  modificado_en: Date;

  @IsNumber()
  @IsOptional()
  @ApiProperty({
    description:
      'El id del con el rol que se realizo Esto porque un mismo usuario puede tener varios roles al mismo tiempo',
    example: '1',
  })
  rol_modificado_id: number;
  @IsString()
  @IsOptional()
  @ApiProperty({
    description:
      'El Nombre del con el rol que se realizo Esto porque un mismo usuario puede tener varios roles al mismo tiempo',
    example: '2022-03-29T13:34:00.000',
  })
  rol_modificado_nom: string;
}
