import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { DocumentosactividadService } from './documentosactividad.service';
import { CreateDocumentosactividadDto } from './dto/create-documentosactividad.dto';
import { UpdateDocumentosactividadDto } from './dto/update-documentosactividad.dto';

@Controller('documentosactividad')
export class DocumentosactividadController {
  constructor(
    private readonly documentosactividadService: DocumentosactividadService,
  ) {}

  @Post()
  create(@Body() createDocumentosactividadDto: CreateDocumentosactividadDto) {
    return this.documentosactividadService.create(createDocumentosactividadDto);
  }

  @Get()
  findAll() {
    return this.documentosactividadService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.documentosactividadService.findOne(+id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateDocumentosactividadDto: UpdateDocumentosactividadDto,
  ) {
    return this.documentosactividadService.update(
      +id,
      updateDocumentosactividadDto,
    );
  }
}
