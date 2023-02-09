import { Module } from '@nestjs/common';
import { FilesService } from './files.service';
import { FilesController } from './files.controller';
import { CursosModule } from '../cursos/cursos.module';
import { DetallecursosModule } from '../detallecursos/detallecursos.module';

@Module({
  controllers: [FilesController],
  providers: [FilesService],
  imports: [CursosModule, DetallecursosModule],
})
export class FilesModule {}
