import { Module } from '@nestjs/common';
import { NotificacionService } from './notificacion.service';
import { NotificacionController } from './notificacion.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { NotificacionEntity } from './entities/notificacion.entity';

@Module({
  controllers: [NotificacionController],
  providers: [NotificacionService],
  imports: [TypeOrmModule.forFeature([NotificacionEntity])],
  exports: [NotificacionService],
})
export class NotificacionModule {}
