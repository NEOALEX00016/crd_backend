import { Injectable, BadRequestException } from '@nestjs/common';
import { CreateDocumentosactividadDto } from './dto/create-documentosactividad.dto';
import { UpdateDocumentosactividadDto } from './dto/update-documentosactividad.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { DocumentosactividadEntity } from './entities/documentosactividad.entity';
import { Repository } from 'typeorm';
import { NotFoundException } from '@nestjs/common/exceptions/not-found.exception';

@Injectable()
export class DocumentosactividadService {
  constructor(
    @InjectRepository(DocumentosactividadEntity)
    private readonly repodocumento: Repository<DocumentosactividadEntity>,
  ) {}
  async create(createDocumentosactividadDto: CreateDocumentosactividadDto) {
    const documento = await this.repodocumento.create(
      createDocumentosactividadDto,
    );

    try {
      await this.repodocumento.save(documento);
      return documento;
    } catch (error) {
      throw new BadRequestException(`Error Registrando el Documento ${error}`);
    }
  }

  async findAll() {
    const documentos = await this.repodocumento.find();

    if (documentos.length <= 0)
      throw new NotFoundException('Esta Tabla no contiene Datos');

    return documentos;
  }

  async findOne(id: number) {
    const documentos = await this.repodocumento.find({
      where: { id_actividad: id },
    });

    if (documentos.length <= 0)
      throw new NotFoundException('Registro no Encontrado');
    return documentos;
  }

  async update(
    id: number,
    updateDocumentosactividadDto: UpdateDocumentosactividadDto,
  ) {
    const documentos = await this.repodocumento.preload({
      id,
      ...updateDocumentosactividadDto,
    });

    if (!documentos)
      throw new NotFoundException('Registro no Encontrado para actualizar');
    try {
      await this.repodocumento.update(id, documentos);
      return documentos;
    } catch (error) {
      throw new BadRequestException(`Error Actualizando el Documento ${error}`);
    }
  }

  async findactividad(id: number) {
    const documentos = await this.repodocumento.findOneBy({ id: id });

    if (!documentos) throw new NotFoundException('Registro no Encontrado');
    return documentos;
  }
}
