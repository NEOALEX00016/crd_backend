/* eslint-disable prettier/prettier */

import {   IsString, Matches, MaxLength, MinLength } from 'class-validator';
export class UpdatepassDto {

    

    @IsString()
    @MinLength(6, { message: 'La Contraseña Debe Tener Minimo 6 Caracteres' })
    @MaxLength(50, { message: 'La Contraseña Debe Tener Maximo 50 Caracteres' })
    @Matches(/(?:(?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/, {
      message:
        'La Contrasena debe contener letras Mayuscula, Minuscula y Numeros',
    })
    password: string;
}
