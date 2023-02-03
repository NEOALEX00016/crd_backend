import { Module } from '@nestjs/common';
import { OpcionesmenuService } from './opcionesmenu.service';
import { OpcionesmenuController } from './opcionesmenu.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { OpcionesmenuEntity } from './entities/opcionesmenu.entity';
import { AuthModule } from 'src/auth/auth.module';

@Module({
  controllers: [OpcionesmenuController],
  providers: [OpcionesmenuService],
  imports: [TypeOrmModule.forFeature([OpcionesmenuEntity]), AuthModule],
})
export class OpcionesmenuModule {}
