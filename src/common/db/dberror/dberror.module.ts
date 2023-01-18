import {
  BadRequestException,
  InternalServerErrorException,
  Module,
} from '@nestjs/common';

@Module({})
export class DberrorModule {
  public ErroresDb(error: any) {
    if (error.code == 'ORA-01841')
      throw new BadRequestException('La Fecha no Puede ser Nula');

    throw new InternalServerErrorException(
      `Unexpected error, check server logs ${error}`,
    );
  }
}
