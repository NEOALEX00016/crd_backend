import { Module } from '@nestjs/common';
import { DetallerolesService } from './detalleroles.service';
import { DetallerolesController } from './detalleroles.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { DetalleroleEntity } from './entities/detallerole.entity';
import { AuthModule } from 'src/auth/auth.module';

@Module({
  controllers: [DetallerolesController],
  providers: [DetallerolesService],
  imports: [TypeOrmModule.forFeature([DetalleroleEntity]), AuthModule],
})
export class DetallerolesModule {}
