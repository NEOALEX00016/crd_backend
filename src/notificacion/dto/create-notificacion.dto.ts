import { ApiProperty } from '@nestjs/swagger';
import { Type } from 'class-transformer';
import { IsNumber, IsOptional, IsString, IsDate } from 'class-validator';

export class CreateNotificacionDto {
  @IsNumber()
  @ApiProperty({
    description: 'Id del pais',
    example: '12',
  })
  id_pais: number;

  @IsNumber()
  @ApiProperty({
    description: 'Id de la sede si pertenece a una',
    example: '12',
  })
  id_sede: number;

  @IsString()
  @ApiProperty({
    description: 'Actividad,o General',
    example: 'Actividad',
  })
  tipo_notificacion: string;

  @IsNumber()
  @IsOptional()
  @ApiProperty({
    description: 'Id de la actividad si pertenece a una',
    example: '12',
  })
  id_actividad: number;

  @IsNumber()
  @ApiProperty({
    description: 'id del miembro que recibe la notificacion',
    example: '12',
  })
  id_miembro: number;

  @IsString()
  @ApiProperty({
    description: 'Nombre de la Notificiacion',
    example: 'Notificacion de Actividad, Notificacion General',
  })
  nombre: string;
  @IsString()
  @ApiProperty({
    description: 'Descripcion de la Notificacion ',
    example: 'Notificacacion Sobre Tal Cosa',
  })
  descripcion: string;

  @IsDate()
  @IsOptional()
  @Type(() => Date)
  @ApiProperty({
    description: 'Fecha de lectura de la notificacion',
    example: 'Activo',
  })
  fecha_lectura: Date;

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
