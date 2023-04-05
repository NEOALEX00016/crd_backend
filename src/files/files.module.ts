import { Module } from '@nestjs/common';
import { FilesService } from './files.service';
import { FilesController } from './files.controller';
import { CursosModule } from '../cursos/cursos.module';
import { DetallecursosModule } from '../detallecursos/detallecursos.module';
import { MiembrosModule } from '../miembros/miembros.module';
import { DocumentosactividadModule } from '../documentosactividad/documentosactividad.module';

@Module({
  controllers: [FilesController],
  providers: [FilesService],
  imports: [
    CursosModule,
    DetallecursosModule,
    MiembrosModule,
    DocumentosactividadModule,
  ],
})
export class FilesModule {}
