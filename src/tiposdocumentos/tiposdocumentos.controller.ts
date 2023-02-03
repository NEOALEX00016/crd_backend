import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  UseGuards,
} from '@nestjs/common';
import { TiposdocumentosService } from './tiposdocumentos.service';
import { CreateTiposdocumentoDto } from './dto/create-tiposdocumento.dto';
import { UpdateTiposdocumentoDto } from './dto/update-tiposdocumento.dto';
import { AuthGuard } from '@nestjs/passport';

@Controller('tiposdocumentos')
export class TiposdocumentosController {
  constructor(
    private readonly tiposdocumentosService: TiposdocumentosService,
  ) {}

  @Post()
  @UseGuards(AuthGuard())
  create(@Body() createTiposdocumentoDto: CreateTiposdocumentoDto) {
    return this.tiposdocumentosService.create(createTiposdocumentoDto);
  }

  @Get()
  @UseGuards(AuthGuard())
  findAll() {
    return this.tiposdocumentosService.findAll();
  }

  @Get(':id')
  @UseGuards(AuthGuard())
  findOne(@Param('id') id: string) {
    return this.tiposdocumentosService.findOne(id);
  }

  @Patch(':id')
  @UseGuards(AuthGuard())
  update(
    @Param('id') id: string,
    @Body() updateTiposdocumentoDto: UpdateTiposdocumentoDto,
  ) {
    return this.tiposdocumentosService.update(+id, updateTiposdocumentoDto);
  }
}
