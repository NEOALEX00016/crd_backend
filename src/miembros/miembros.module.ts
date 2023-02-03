import { Module } from '@nestjs/common';
import { MiembrosService } from './miembros.service';
import { MiembrosController } from './miembros.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { MiembroEntity } from './entities/miembro.entity';
import { AuthModule } from '../auth/auth.module';
import { AuthService } from 'src/auth/auth.service';
import { KeyService } from 'src/common/db/dberror/generatesecret';
import { MailModule } from 'src/mail/mail.module';

@Module({
  controllers: [MiembrosController],
  providers: [MiembrosService, AuthService, KeyService],
  imports: [TypeOrmModule.forFeature([MiembroEntity]), AuthModule, MailModule],
})
export class MiembrosModule {}
