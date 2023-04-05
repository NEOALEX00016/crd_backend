import { Module } from '@nestjs/common';
import { MiembroactividadService } from './miembroactividad.service';
import { MiembroactividadController } from './miembroactividad.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Miembroactividadentity } from './entities/miembroactividad.entity';
import { PosicioneEntity } from '../posiciones/entities/posicione.entity';
import { MiembrosposicionEntity } from '../miembrosposicion/entities/miembrosposicion.entity';
import { MiembroEntity } from 'src/miembros/entities/miembro.entity';
import { ActividadesEntity } from 'src/actividades/entities/actividade.entity';
import { MailModule } from 'src/mail/mail.module';
import { NotificacionEntity } from '../notificacion/entities/notificacion.entity';

@Module({
  controllers: [MiembroactividadController],
  providers: [MiembroactividadService],
  imports: [
    TypeOrmModule.forFeature([
      Miembroactividadentity,
      PosicioneEntity,
      MiembrosposicionEntity,
      MiembroEntity,
      ActividadesEntity,
      NotificacionEntity,
    ]),
    MailModule,
  ],
})
export class MiembroactividadModule {}
