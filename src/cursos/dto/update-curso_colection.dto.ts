import { IsUUID } from 'class-validator';

export class UpdateCursoColectionDto {
  @IsUUID()
  idcolection: string;
}
