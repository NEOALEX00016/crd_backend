import { MailerModule } from '@nestjs-modules/mailer';
import { Module } from '@nestjs/common';
import { join } from 'path';
import { MailService } from './mail.service';
import { HandlebarsAdapter } from '@nestjs-modules/mailer/dist/adapters/handlebars.adapter';
import { env } from 'process';

@Module({
  providers: [MailService],
  imports: [
    MailerModule.forRootAsync({
      // imports: [ConfigModule], // import module if not enabled globally
      useFactory: async () => ({
        // transport: config.get("MAIL_TRANSPORT"),
        // or

        transport: {
          host: env.MAIL_HOST,
          secure: false,
          auth: {
            user: env.MAIL_USER,
            pass: env.MAIL_PASSWORD,
          },
        },
        defaults: {
          from: `"Sistema Nacional de Juventud CRD" <${env.MAIL_FROM}>`,
        },
        template: {
          dir: join(__dirname, 'templates'),
          adapter: new HandlebarsAdapter(),
          options: {
            strict: true,
          },
        },
      }),
    }),
  ],

  exports: [MailService],
})
export class MailModule {}
