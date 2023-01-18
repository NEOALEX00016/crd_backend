import { ApiProperty } from '@nestjs/swagger';
import { IsDate, IsNotEmpty, IsNumber, IsString } from 'class-validator';
export class CreateDivisionDto {
  @IsNumber()
  @IsNotEmpty()
  @ApiProperty({ description: 'Este al Pais que esta Asociado', example: 1 })
  id_pais: number;

  @IsNumber()
  @IsNotEmpty()
  @ApiProperty({
    description: 'Este es el Tipo de Division que esta Asociado ',
    example: 1,
  })
  id_tipo_division: number;
  @IsString()
  @IsNotEmpty()
  @ApiProperty({
    description: 'Nombre de la Division como tal ',
    example: 'Santo Domingo',
  })
  nombre: string;
  @IsNumber()
  @IsNotEmpty()
  @ApiProperty({
    description: 'Este es el Tipo de Division que esta Asociado ',
    example: 1,
  })
  depende: number;

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
  @ApiProperty({
    description: 'La Fecha que se Agrego el Registro',
    example: '2022-03-29T13:34:00.000',
  })
  agregado_en: Date;

  @IsNumber()
  @ApiProperty({
    description:
      'El id del con el rol que se realizo Esto porque un mismo usuario puede tener varios roles al mismo tiempo',
    example: '1',
  })
  rol_agregado_id: number;
  @IsString()
  @ApiProperty({
    description:
      'El Nombre del con el rol que se realizo Esto porque un mismo usuario puede tener varios roles al mismo tiempo',
    example: '2022-03-29T13:34:00.000',
  })
  rol_agregado_nom: string;

  @IsString()
  @ApiProperty({
    description: 'Esto es el Usuario que realizo la modificacion del registro',
    example: 'NeftaliRosario',
  })
  modificado_por: string;

  @IsDate()
  @ApiProperty({
    description: 'La Fecha que se modifico el Registro',
    example: '2022-03-29T13:34:00.000',
  })
  modificado_en: Date;

  @IsNumber()
  @ApiProperty({
    description:
      'El id del con el rol que se realizo Esto porque un mismo usuario puede tener varios roles al mismo tiempo',
    example: '1',
  })
  rol_modificado_id: number;
  @IsString()
  @ApiProperty({
    description:
      'El Nombre del con el rol que se realizo Esto porque un mismo usuario puede tener varios roles al mismo tiempo',
    example: '2022-03-29T13:34:00.000',
  })
  rol_modificado_nom: string;
}
