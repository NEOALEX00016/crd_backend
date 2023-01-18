import { Module } from '@nestjs/common';
import { PaisService } from './pais.service';
import { PaisController } from './pais.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { PaisEntity } from './entities/pais.entity';
import { AuthModule } from '../auth/auth.module';

@Module({
  controllers: [PaisController],
  providers: [PaisService],
  imports: [TypeOrmModule.forFeature([PaisEntity]), AuthModule],
})
export class PaisModule {}
