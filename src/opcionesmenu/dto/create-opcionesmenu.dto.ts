import { ApiProperty } from '@nestjs/swagger';
import { Type } from 'class-transformer';
import { IsDate, IsNumber, IsOptional, IsString } from 'class-validator';
export class CreateOpcionesmenuDto {
  @IsNumber()
  id_pais: number;
  @IsString()
  descripcion: string;
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
