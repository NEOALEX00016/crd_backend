/* eslint-disable prettier/prettier */
import { IsString, IsNumber, MinLength, MaxLength, Matches, IsEmail,  IsOptional } from 'class-validator';




export class CreateUserDto {

  @IsNumber()
  id_pais: number;
  @IsNumber()
  id_miembro: number;
  @IsString()
  @IsEmail()
  usuario: string;
  
  @IsString()
  @MinLength(6,{message:'La Contraseña Debe Tener Minimo 6 Caracteres'})
  @MaxLength(50,{message:'La Contraseña Debe Tener Maximo 50 Caracteres'})
  @Matches(
    /(?:(?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/, {
    message: 'The password must have a Uppercase, lowercase letter and a number'
})
  password: string;

@IsString()
estado:string
  @IsString()
@IsOptional()
agregado_en:string
@IsString()
@IsOptional()
modifcado_en:Date

}

