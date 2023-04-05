import {
  Controller,
  Post,
  Body,
  UploadedFile,
  UseInterceptors,
} from '@nestjs/common';
import { FilesService } from './files.service';

import { FileInterceptor } from '@nestjs/platform-express';
import { AxiosResponse } from 'axios';

@Controller('files')
export class FilesController {
  constructor(private readonly filesService: FilesService) {}

  @Post('portadascurso')
  @UseInterceptors(FileInterceptor('file'))
  async uploadFile(@UploadedFile() file: Express.Multer.File, @Body('id') id) {
    //console.log(file);
    return await this.filesService.uploadPortadas(file, id);
  }

  @Post('miembros')
  @UseInterceptors(FileInterceptor('file'))
  async uploadFilemiembros(
    @UploadedFile() file,
    @Body('id') id,
  ): Promise<AxiosResponse> {
    return await this.filesService.uploadMiembros(file, id);
  }
  @Post('actividades')
  @UseInterceptors(FileInterceptor('file'))
  async uploadFileactividades(
    @UploadedFile() file: Express.Multer.File,
    @Body('id') id,
  ) {
    return await this.filesService.uploadActividades(file, id);
  }

  @Post('portadasvideos')
  @UseInterceptors(FileInterceptor('file'))
  async uploadportadasvideos(
    @UploadedFile() file: Express.Multer.File,
    @Body('idvideo') idvideo,
  ) {
    //return file
    return await this.filesService.uploadPortadasvideo(file, idvideo);
  }

  @Post('colection')
  async uploadFilecursos(@Body('idcurso') idcurso): Promise<AxiosResponse> {
    //return file
    return await this.filesService.crearcurso(idcurso);
  }

  @Post('subirvideo')
  @UseInterceptors(FileInterceptor('file'))
  async uploadFilevideo(
    @UploadedFile() file: Express.Multer.File,
    @Body('id') id,
  ) {
    //return file
    return await this.filesService.crearFilevideo(file, id);
  }

  @Post('insigniacursos')
  @UseInterceptors(FileInterceptor('file'))
  async uploadinsigniacursos(
    @UploadedFile() file: Express.Multer.File,
    @Body('idcurso') idcurso,
  ) {
    //return file
    return await this.filesService.uploadinsigniacursos(file, idcurso);
  }
}
