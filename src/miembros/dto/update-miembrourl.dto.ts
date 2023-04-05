/* eslint-disable prettier/prettier */
// eslint-disable-next-line prettier/prettier

import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsString } from 'class-validator';

export class UpdateMiembroUrlDto {
  @IsString()
  @IsNotEmpty()
  @ApiProperty({
    description: 'Nombre del Miembro',
    example: 'https://jdjfksdjfksdfjksdfjsdkfjsdf.com',
  })
  urlfoto: string;
}
