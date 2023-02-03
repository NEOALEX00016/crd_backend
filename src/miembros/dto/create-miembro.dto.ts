import { ApiProperty } from '@nestjs/swagger';
import { Type } from 'class-transformer';
import {
  IsDate,
  IsEmail,
  IsNotEmpty,
  IsNumber,
  IsOptional,
  IsString,
} from 'class-validator';

export class CreateMiembroDto {
  @IsNumber()
  @IsNotEmpty()
  @ApiProperty({
    description: 'Id pais que pertence',
    example: 1,
  })
  id_pais: number;
  @IsNumber()
  @IsOptional()
  @IsNotEmpty()
  @ApiProperty({
    description: 'id de la sede que pertenece',
    example: 1,
  })
  id_sede: number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    description: 'id de la area que pertence dentro de la sede',
    example: 1,
  })
  id_area: number;
  @IsString()
  @IsNotEmpty()
  @ApiProperty({
    description: 'Nombre del Miembro',
    example: 'Alexis',
  })
  nombre: string;
  @IsString()
  @IsNotEmpty()
  @ApiProperty({
    description: 'Apellidos del Miembro',
    example: 'German',
  })
  apellido: string;
  @IsString()
  @IsNotEmpty()
  @ApiProperty({
    description: 'Nacionalidad del Miembro',
    example: 'Dominicana',
  })
  nacionalidad: string;
  @IsString()
  @IsNotEmpty()
  @ApiProperty({
    description: 'Lugar de Nacimiento del Miembro',
    example: 'Santo Domingo',
  })
  lugar_de_nacimiento: string;
  @IsDate()
  @IsNotEmpty()
  @Type(() => Date)
  @ApiProperty({
    description: 'Fecha de Nacimiento  del Miembro',
    example: '1987-03-09',
  })
  fecha_de_nacimiento: Date;
  @IsDate()
  @IsNotEmpty()
  @Type(() => Date)
  @ApiProperty({
    description: 'Fecha de Registro  del Miembro',
    example: '1987-03-09',
  })
  fecha_de_registro: Date;
  @IsDate()
  @IsOptional()
  @Type(() => Date)
  @ApiProperty({
    description: 'Fecha de Finalizacion  del Miembro',
    example: '1987-03-09',
  })
  fecha_de_finalizacion: Date;
  @IsNumber()
  @IsNotEmpty()
  @ApiProperty({
    description: 'Tipo de Miebro',
    example: [
      'TIPO_VOLUNTARIO=1',
      'TIPO_ASALARIADO=2',
      'TIPO_VOLUNTARIOSA=3',
      'TIPO_EXTERNO=4',
    ],
  })
  tipo_miembro: number;

  @IsNumber()
  @IsNotEmpty()
  @ApiProperty({
    description: 'Tipo de Documento del Miembro',
    example: ['Cedula', 'Paporte', 'Licencia'],
  })
  id_tipo_documento: number;
  @IsString()
  @IsNotEmpty()
  @ApiProperty({
    description: 'Documento del Miembro',
    example: ['00117935759'],
  })
  documento: string;
  @IsString()
  @IsEmail()
  @ApiProperty({
    description: 'Usuario del Sistema en este caso es el correo electronico',
    example: 'example@crd.org.do',
  })
  email: string;

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
