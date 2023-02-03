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
}
