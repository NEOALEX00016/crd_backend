import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
// eslint-disable-next-line @typescript-eslint/no-unused-vars
import * as fs from 'fs';
import { DocumentBuilder } from '@nestjs/swagger';
import { SwaggerModule } from '@nestjs/swagger/dist';
import { ValidationPipe } from '@nestjs/common';

async function bootstrap() {
  //TODO ESTO ES PARA LAS LLAVES DE SSL
  const crPath = '/etc/ssl/virtualmin/1674753540413463/cert.pem';
  const pkPath = '/etc/ssl/virtualmin/1674753540413463/sslkey.pem';
  const option: any = {};
  console.log(fs.existsSync(crPath));
  console.log(fs.existsSync(pkPath));
  if (fs.existsSync(crPath) && fs.existsSync(pkPath)) {
    // cargamos los archivos sobre las options
    console.log('existe');
    option.httpsOptions = {
      cert: fs.readFileSync(crPath),
      key: fs.readFileSync(pkPath),
    };
  }

  // const app = await NestFactory.create(AppModule, { cors: true });
  //TODO esta es para el ssl
  console.log(option);
  const apps = await NestFactory.create(AppModule, option, { cors: true });
  // app.setGlobalPrefix('des');
  apps.setGlobalPrefix('api');
  const options = new DocumentBuilder()
    .setTitle('api_crd')
    .setDescription(
      'Conjunto de EndPoint para el sistema de Cruz Roja Dominicana',
    )
    .setVersion('1.0')
    .build();
  //const document = SwaggerModule.createDocument(app, options);
  const documents = SwaggerModule.createDocument(apps, options);
  //SwaggerModule.setup('des', app, document);
  SwaggerModule.setup('api', apps, documents);
  //
  // app.enableCors({
  // origin: '*',
  //credentials: false,
  //});

  apps.enableCors({
    origin: '*',
  });
  //app.useGlobalPipes(
  // new ValidationPipe({
  //  whitelist: false,
  //forbidNonWhitelisted: true,
  //}),
  //);

  apps.useGlobalPipes(
    new ValidationPipe({
      whitelist: true,
      forbidNonWhitelisted: true,
    }),
  );

  // await app.listen(3400);
  await apps.listen(4362);
}
bootstrap();
