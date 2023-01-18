/* eslint-disable prettier/prettier */
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
  usuario: string;

  @IsString()
  @MinLength(6, { message: 'La Contraseña Debe Tener Minimo 6 Caracteres' })
  @MaxLength(50, { message: 'La Contraseña Debe Tener Maximo 50 Caracteres' })
  @Matches(/(?:(?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/, {
    message:
      'The password must have a Uppercase, lowercase letter and a number',
  })
  password: string;
}
