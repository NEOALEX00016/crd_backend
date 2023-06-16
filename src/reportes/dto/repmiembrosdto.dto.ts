import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsNumber, IsOptional, IsString } from 'class-validator';

export class Repmiembrosdto {
  @IsString()
  @IsNotEmpty()
  @ApiProperty({
    description: 'Fecha de Nacimiento Desde',
  })
  //@Type(() => Date)
  fecha_desde: string;
  @IsString()
  @IsNotEmpty()
  @ApiProperty({
    description: 'Fecha de Nacimiento hasta',
  })
  //@Type(() => Date)
  fecha_hasta: string;

  @IsString()
  @IsNotEmpty()
  @ApiProperty({
    description: 'Sexo del Miembro',
  })
  sexo: string;
  @IsString()
  @IsOptional()
  @ApiProperty({
    description: 'Tipo de Informacion',
  })
  campo1: string;
  @IsString()
  @IsOptional()
  @ApiProperty({
    description: 'Valor Tipo de Informacion',
  })
  valor1: string;
  @IsString()
  @IsOptional()
  @ApiProperty({
    description: 'Tipo de Informacion',
  })
  campo2: string;
  @IsString()
  @IsOptional()
  @ApiProperty({
    description: 'Valor Tipo de Informacion',
  })
  valor2: string;
  @IsString()
  @IsOptional()
  @ApiProperty({
    description: 'Tipo de Informacion',
  })
  campo3: string;
  @IsString()
  @IsOptional()
  @ApiProperty({
    description: 'Valor Tipo de Informacion',
  })
  valor3: string;
  @IsString()
  @IsOptional()
  @ApiProperty({
    description: 'Tipo de Informacion',
  })
  campo4: string;
  @IsString()
  @IsOptional()
  @ApiProperty({
    description: 'Valor Tipo de Informacion',
  })
  valor4: string;
  @IsString()
  @IsOptional()
  @ApiProperty({
    description: 'Tipo de Informacion',
  })
  campo5: string;
  @IsString()
  @IsOptional()
  @ApiProperty({
    description: 'Valor Tipo de Informacion',
  })
  valor5: string;
  @IsString()
  @IsOptional()
  @ApiProperty({
    description: 'Nombre Tipo de Informacion',
  })
  Columna1: string;
  @IsString()
  @IsOptional()
  @ApiProperty({
    description: 'Nombre Tipo de Informacion',
  })
  Columna2: string;
  @IsString()
  @IsOptional()
  @ApiProperty({
    description: 'Nombre Tipo de Informacion',
  })
  Columna3: string;
  @IsString()
  @IsOptional()
  @ApiProperty({
    description: 'Nombre Tipo de Informacion',
  })
  Columna4: string;
  @IsString()
  @IsOptional()
  @ApiProperty({
    description: 'Nombre Tipo de Informacion',
  })
  Columna5: string;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    description: 'Id de la Sede',
  })
  sede: number;
}
