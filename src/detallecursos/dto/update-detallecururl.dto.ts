import { IsString } from 'class-validator';

export class UpdateDetallecursourlDto {
  @IsString()
  url: string;
  @IsString()
  guid: string;
}
