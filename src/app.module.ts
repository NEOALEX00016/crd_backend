import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { PaisEntity } from './pais/entities/pais.entity';
import { PaisModule } from './pais/pais.module';
import { DberrorModule } from './common/db/dberror/dberror.module';
import { TiposdivisionModule } from './tiposdivision/tiposdivision.module';
import { TiposdivisionEntity } from './tiposdivision/entities/tiposdivision.entity';
import { DivisionModule } from './division/division.module';
import { DivisionEntity } from './division/entities/division.entity';
import { AuthModule } from './auth/auth.module';
import { User } from './auth/entities/user.entity';
import { TiposedesModule } from './tiposedes/tiposedes.module';
import { SedesModule } from './sedes/sedes.module';
import { TiposedeEntity } from './tiposedes/entities/tiposede.entity';
import { SedeEntity } from './sedes/entities/sede.entity';
import { AreasModule } from './areas/areas.module';
import { ModulosModule } from './modulos/modulos.module';
import { RolesModule } from './roles/roles.module';
import { DetallerolesModule } from './detalleroles/detalleroles.module';
import { OpcionesmenuModule } from './opcionesmenu/opcionesmenu.module';
import { PosicionesModule } from './posiciones/posiciones.module';
import { TiposdocumentosModule } from './tiposdocumentos/tiposdocumentos.module';
import { MiembrosModule } from './miembros/miembros.module';
import { MailModule } from './mail/mail.module';

const env = process.env;
@Module({
  imports: [
    ConfigModule.forRoot(),
    TypeOrmModule.forRoot({
      type: 'postgres',
      host: env.DB_HOST,
      port: +env.DB_PORT,
      username: env.DB_USER,
      password: env.DB_PASS,
      database: env.DB_NAME,
      autoLoadEntities: !!env.DB_AUTOLOAD,
      entities: [
        PaisEntity,
        TiposdivisionEntity,
        DivisionEntity,
        User,
        TiposedeEntity,
        SedeEntity,
      ],
      synchronize: false,
      schema: 'iniciar',
    }),
    PaisModule,
    DberrorModule,
    TiposdivisionModule,
    DivisionModule,
    AuthModule,
    TiposedesModule,
    SedesModule,
    AreasModule,
    ModulosModule,
    RolesModule,
    DetallerolesModule,
    OpcionesmenuModule,
    PosicionesModule,
    TiposdocumentosModule,
    MiembrosModule,
    MailModule,
  ],
  controllers: [],
  providers: [],
})
export class AppModule {}
