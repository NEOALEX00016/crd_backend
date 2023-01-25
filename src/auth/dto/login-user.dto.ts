/* eslint-disable prettier/prettier */
import { ApiProperty } from '@nestjs/swagger';
import {
  IsString,
  MinLength,
  MaxLength,
  Matches,
  IsEmail,
} from 'class-validator';

export class LoginUserDto {
  @IsString()
  @IsEmail()
  @ApiProperty({
    description: 'Usuario del Sistema en este caso es el correo electronico',
    example: 'example@crd.org.do',
  })
  usuario: string;

  @IsString()
  @MinLength(6, { message: 'La Contraseña Debe Tener Minimo 6 Caracteres' })
  @MaxLength(50, { message: 'La Contraseña Debe Tener Maximo 50 Caracteres' })
  @Matches(/(?:(?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/, {
    message:
      'La Contrasena debe contener letras Mayuscula, Minuscula y Numeros',
  })
  @ApiProperty({description:'Constrasena del Usuario debe tener un minimo de 6 carcteres y un maximo de 50 caracteres y contener letras en mayuscula y minuscula y numero',example:'Aeio1ñ23232'})
  password: string;
}
