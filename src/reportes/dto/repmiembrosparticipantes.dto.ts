import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsNumber, IsOptional, IsString } from 'class-validator';

export class Repvoluntarioparticipantesdto {
  @IsString()
  @IsNotEmpty()
  @ApiProperty({
    description: 'Fecha Desde',
  })
  //@Type(() => Date)
  fecha_desde: string;
  @IsString()
  @IsNotEmpty()
  @ApiProperty({
    description: 'Fecha Hasta',
  })
  //@Type(() => Date)
  fecha_hasta: string;

  @IsString()
  @IsOptional()
  @ApiProperty({
    description: 'Id de la Sede',
  })
  sede: string;
  @IsString()
  @IsOptional()
  @ApiProperty({
    description: 'Id del proyecto nacional que pertence',
  })
  idproyecto: string;
  @IsString()
  @IsOptional()
  @ApiProperty({
    description: 'Id sub proyecto',
  })
  idsubproyecto: string;
  @IsString()
  @IsNotEmpty()
  @ApiProperty({
    description: 'Area de Accion',
  })
  //@Type(() => Date)
  area_accion: string;
  @IsString()
  @IsNotEmpty()
  @ApiProperty({
    description: 'Tipo de Area entregabienes',
  })
  //@Type(() => Date)
  entregabienes: string;
  @IsString()
  @IsNotEmpty()
  @ApiProperty({
    description: 'Tipo de Area asistencias',
  })
  //@Type(() => Date)
  asistencias: string;
  @IsString()
  @IsNotEmpty()
  @ApiProperty({
    description: 'Tipo de Area orientacion',
  })
  //@Type(() => Date)
  orientacion: string;
  @IsString()
  @IsNotEmpty()
  @ApiProperty({
    description: 'Tipo de Area capacitacion',
  })
  //@Type(() => Date)
  capacitacion: string;
  @IsString()
  @IsNotEmpty()
  @ApiProperty({
    description: 'Tipo de Area gestion',
  })
  //@Type(() => Date)
  gestion: string;

  @IsString()
  @IsNotEmpty()
  @ApiProperty({
    description: 'Id de una Actividad especifica',
  })
  idactividad: string;
}
