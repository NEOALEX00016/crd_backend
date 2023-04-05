import { ApiProperty } from '@nestjs/swagger';
import { Type } from 'class-transformer';
import {
  IsBoolean,
  IsNumber,
  IsDate,
  IsString,
  IsOptional,
} from 'class-validator';
export class CreateActividadeDto {
  @IsNumber()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  id_proyecto_nacional: number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  id_sub_proyecto: number;

  @IsNumber()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  id_miembro: number;
  @IsNumber()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  id_sede: number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  id_areas_de_accion: number;

  @IsBoolean()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  entregablebienes: boolean;
  @IsBoolean()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  asistencias: boolean;
  @IsBoolean()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  orientacion: boolean;
  @IsBoolean()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  capacitacion: boolean;
  @IsBoolean()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  gestion: boolean;
  @IsDate()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  @Type(() => Date)
  fecha_actividad: Date;
  @IsBoolean()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  local: boolean;
  @IsBoolean()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  institucion: boolean;
  @IsBoolean()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  viviendas: boolean;
  @IsBoolean()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  comunidad: boolean;
  @IsBoolean()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  puestos: boolean;
  @IsBoolean()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  carceles: boolean;
  @IsString()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  latitud: string;
  @IsString()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  longitud: string;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  horainicio: number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  horafin: number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  voluntariosjuventud: number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  mujeresjuventud: number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  hombresjuventud: number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  mujeresotros: number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  hombresotros: number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  totalvoluntario: number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '05_mujeres': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '05_hombres': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '05_discapacidad': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '05_migrantes': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '05_embarazadas': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '612_mujeres': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '612_hombres': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '612_discapacidad': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '612_migrantes': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '612_embarazadas': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '1317_mujeres': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '1317_hombres': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '1317_discapacidad': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '1317_migrantes': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '1317_embarazadas': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '1829_mujeres': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '1829_hombres': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '1829_discapacidad': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '1829_migrantes': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '1829_embarazadas': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '3039_mujeres': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '3039_hombres': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '3039_discapacidad': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '3039_migrantes': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '3039_embarazadas': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '4049_mujeres': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '4049_hombres': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '4049_discapacidad': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '4049_migrantes': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '4049_embarazadas': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '5059_mujeres': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '5059_hombres': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '5059_discapacidad': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '5059_migrantes': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '5059_embarazadas': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '6069_mujeres': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '6069_hombres': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '6069_discapacidad': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '6069_migrantes': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '6069_embarazadas': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '7079_mujeres': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '7079_hombres': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '7079_discapacidad': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '7079_migrantes': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '7079_embarazadas': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '80_mujeres': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '80_hombres': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '80_discapacidad': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '80_migrantes': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  '80_embarazadas': number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  otros_mujeres: number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  otros_hombres: number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  otros_discapacidad: number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  otros_migrantes: number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  otros_embarazadas: number;
  @IsString()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  descripcion: string;
  @IsString()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  comentario: string;
  @IsBoolean()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  menores: boolean;

  @IsString()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  dificultades: string;
  @IsString()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  area_de_accion: string;
  @IsString()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  codigo: string;

  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  maximo: number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    example: 'No es Obligatorio',
  })
  aceptados: number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    description: 'Participantes',
    example: 'No es Obligatorio',
  })
  participantes: number;
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
