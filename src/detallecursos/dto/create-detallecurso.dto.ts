import { Type } from 'class-transformer';
import { ApiProperty } from '@nestjs/swagger';
import { IsDate, IsNumber, IsOptional, IsString } from 'class-validator';

export class CreateDetallecursoDto {
  @IsNumber()
  @ApiProperty({
    description: 'Id del curso Maestro que pertenece',
    example: '1',
  })
  id_curso: number;
  @IsString()
  @ApiProperty({
    description: 'Titulo de la seccion',
    example: 'Capitulo la alabanza',
  })
  titulo: string;
  @IsString()
  @ApiProperty({
    description: 'Descriipcion del Mismo ',
    example: 'sdsadjashdjasdhkjasdhkasjdhaskjdhkasjdhsakjdas',
  })
  descripcion: string;
  @IsString()
  @ApiProperty({
    description: 'Video o Texto',
    example: 'video',
  })
  tipo: string;

  @IsString()
  @IsOptional()
  @ApiProperty({
    description: 'si es de texto puede tener un formulario y lleva el id',
    example: '1',
  })
  id_formulario: string;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    description: 'Duracion del Video en segundo',
    example: '162',
  })
  duracion: number;

  @IsString()
  @IsOptional()
  @ApiProperty({
    description: 'Pregunta',
    example: 'Quien descubrio america?',
  })
  pregunta: string;
  @IsString()
  @IsOptional()
  @ApiProperty({
    description: 'Posible respuesta numero 3',
    example: 'Cristobal Colon',
  })
  respuesta1: string;
  @IsString()
  @IsOptional()
  @ApiProperty({
    description: 'Posible respuesta numero 2',
    example: 'Erik el Rojo',
  })
  respuesta2: string;
  @IsString()
  @IsOptional()
  @ApiProperty({
    description: 'Posible respuesta numero 3',
    example: 'Alexis German',
  })
  respuesta3: string;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    description: 'Esta es la respuestado de correta',
    example: '1',
  })
  correcta: number;

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
