/* eslint-disable prettier/prettier */
import { ApiProperty } from '@nestjs/swagger';
import { IsString, IsNumber, MinLength, MaxLength, Matches, IsEmail,  IsOptional, } from 'class-validator';




export class CreateUserDto {

  
  @IsNumber()
  @ApiProperty({description:'Id de pais al que pertenece este usuario el id del pais se encuentra en la tabla paises',example:1})
  id_pais: number;
  @IsNumber()
  @ApiProperty({description:'Los usuarios antes de ser Usuarios deben ser Miembros este id de Miembros es le que debe ir en este campo',example:1})
  id_miembro: number;
  @IsString()
  @IsEmail()
  @ApiProperty({
    description: 'Usuario del Sistema en este caso es el correo electronico',
    example: 'example@crd.org.do',
  })
  usuario: string;
  
  @IsString()
  @MinLength(6,{message:'La Contraseña Debe Tener Minimo 6 Caracteres'})
  @MaxLength(50,{message:'La Contraseña Debe Tener Maximo 50 Caracteres'})
  @Matches(
    /(?:(?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/, {
    message: 'The password must have a Uppercase, lowercase letter and a number'
})
  @ApiProperty({description:'Constrasena del Usuario debe tener un minimo de 6 carcteres y un maximo de 50 caracteres y contener letras en mayuscula y minuscula y numero',example:'Aeio1ñ23232'})
  password: string;

@IsString() @ApiProperty({
  description: 'Estado Actual del Usuario',
  example: 'Activo',
  default:'Activo'
})
estado:string
  @IsString()
@IsOptional()
@ApiProperty({
  description: 'Fecha en la cual se agrego este usuario',
  example: '2022-03-29T13:34:00.000',
})
agregado_en:string
@IsString()
@IsOptional()
@ApiProperty({
  description: 'Fecha en la cual se modifico este usuario',
  example: '2022-03-29T13:34:00.000',
})
modifcado_en:Date

}

