/* eslint-disable prettier/prettier */
import { MailerService } from '@nestjs-modules/mailer';
import { Injectable } from '@nestjs/common';

@Injectable()
export class MailService {
  constructor(private mailerService: MailerService) {}

  async sendUserConfirmation(usuario: string, pass: string, nombre: string) {
    await this.mailerService.sendMail({
      to: usuario,
      // from: '"Support Team" <support@example.com>', // override default from
      subject:
        'Bienvenido al Sistema Nacional de Juventud Cruz Roja Dominicana',
      template: './confirmation',
      // `.hbs` extension is appended automatically
      context: {
        usuario: usuario,
        pass: pass,
        name: nombre,
      },
    });
  }

  async sendInvitacion(
    urlok: string,
    urlcancel: string,
    email: string,
    fecha: string,
    actividad: string,
    coordinador: string,
    nombre: string,
  ) {
    await this.mailerService.sendMail({
      to: email,
      subject: `Saludos! Se ha Programado una Actividad en la que Puedes Participar`,
      template: './invitacion',
      context: {
        fecha: fecha,
        coordinador: coordinador,
        name: nombre,
        descripcion:actividad
      },
    });
  }
}
