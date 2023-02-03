import { Module } from '@nestjs/common';
import { TiposdocumentosService } from './tiposdocumentos.service';
import { TiposdocumentosController } from './tiposdocumentos.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { TiposdocumentoEntity } from './entities/tiposdocumento.entity';

import { AuthModule } from '../auth/auth.module';

@Module({
  controllers: [TiposdocumentosController],
  providers: [TiposdocumentosService],
  imports: [TypeOrmModule.forFeature([TiposdocumentoEntity]), AuthModule],
})
export class TiposdocumentosModule {}
