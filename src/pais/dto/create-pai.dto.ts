import { ApiProperty } from '@nestjs/swagger';
import {
  IsBase64,
  IsNotEmpty,
  IsNumber,
  IsOptional,
  IsString,
} from 'class-validator';

export class CreatePaisDto {
  @IsString()
  @IsNotEmpty()
  @ApiProperty({
    description: 'Nombre del Pais',
    example: 'República Dominicana',
  })
  nombre: string;

  @IsString()
  @IsNotEmpty()
  @ApiProperty({
    description: 'Codigo de dos Caracteres del ISO 3166-1',
    example: 'DO',
  })
  alpha2: string;

  @IsString()
  @IsNotEmpty()
  @ApiProperty({
    description: 'Codigo de tres Caracteres del ISO 3166-1',
    example: 'DOM',
  })
  alpha3: string;

  @IsNumber()
  @IsNotEmpty()
  @ApiProperty({
    description: 'Codigo de Numerico del Pais Correspondiente al ISO 3166-1',
    example: '214',
  })
  codigo: number;

  @IsString()
  @IsOptional()
  @ApiProperty({
    description: 'Definición del Dominio WEB de los cada pais',
    example: '.do',
  })
  domains: string;

  @IsNumber()
  @IsOptional()
  @ApiProperty({
    description: 'Cantidad de Habitante segun el Ultimo Senso del Pais',
    example: '10358000',
  })
  habitantes: string;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    description: 'Superficie del Pais',
    example: '47500',
  })
  superficie: number;

  @IsBase64()
  @IsOptional()
  bandera: Buffer;
  @IsString()
  @IsOptional()
  @ApiProperty({
    description: 'Estado Actual del Pais en la Base de Datos',
    example: '[Activo,Inactivo]',
  })
  estado: string;

  @IsString()
  @IsOptional()
  @ApiProperty({
    description: 'Ruta de la Imagen de la Bandera del Pais',
    example: 'https://rutaimagen.com',
  })
  ruta_bandera: string;
}
