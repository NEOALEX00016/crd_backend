import { ApiProperty } from '@nestjs/swagger';
import { Type } from 'class-transformer';
import { IsDate, IsNumber, IsOptional, IsString } from 'class-validator';
export class CreateProyectonacionalDto {
  @IsString()
  @ApiProperty({
    description: 'Nombre del Proyecto ',
    example: 'General',
  })
  nombre: string;

  @IsString()
  @ApiProperty({
    description: 'Descripcion del Proyecto ',
    example: 'Este Proyecto es para tal cosa',
  })
  descripcion: string;
  @IsDate()
  @ApiProperty({
    description: 'FECHA DE INICIO DEL PROYECTO',
    example: '2023-03-01',
  })
  @Type(() => Date)
  fecha_de_inicio: Date;
  @IsDate()
  @IsOptional()
  @ApiProperty({
    description: 'FECHA DE FIN DEL PROYECTO',
    example: '2023-03-01',
  })
  @Type(() => Date)
  fecha_de_fin: Date;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    description: 'Beneficiario esperado',
    example: '10',
  })
  beneficiarios_esperados: number;
  @IsNumber()
  @IsOptional()
  @ApiProperty({
    description: 'Beneficiarios alcanzado',
    example: '7',
  })
  beneficiarios_alcanzados: number;

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
