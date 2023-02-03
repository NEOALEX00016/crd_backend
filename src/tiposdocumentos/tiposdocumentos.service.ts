import { Injectable, BadRequestException } from '@nestjs/common';
import { CreateTiposdocumentoDto } from './dto/create-tiposdocumento.dto';
import { UpdateTiposdocumentoDto } from './dto/update-tiposdocumento.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { NotFoundException } from '@nestjs/common/exceptions/not-found.exception';
import { TiposdocumentoEntity } from './entities/tiposdocumento.entity';

@Injectable()
export class TiposdocumentosService {
  constructor(
    @InjectRepository(TiposdocumentoEntity)
    private readonly tiposrepo: Repository<TiposdocumentoEntity>,
  ) {}

  async create(createTiposdocumentoDto: CreateTiposdocumentoDto) {
    const tipo = await this.tiposrepo.create(createTiposdocumentoDto);

    try {
      await this.tiposrepo.save(tipo);
      return tipo;
    } catch (error) {
      throw new BadRequestException(`Error Realizadon el Registro ${error}`);
    }
  }

  async findAll() {
    const tipo = await this.tiposrepo.find();
    if (tipo.length <= 0)
      throw new NotFoundException('Esta Tabla no Contiene Registros');

    return tipo;
  }

  async findOne(term: string) {
    if (!isNaN(+term)) {
      const tipo = await this.tiposrepo.findBy({ id_pais: +term });
      if (tipo.length <= 0)
        throw new NotFoundException('Registro No Encontrados');
      return tipo;
    } else {
      const tipo = await this.tiposrepo.findBy({
        descripcion: term,
      });
      if (tipo.length <= 0)
        throw new NotFoundException('Registro No Encontrados');
      return tipo;
    }
  }

  async update(id: number, updateTiposdocumentoDto: UpdateTiposdocumentoDto) {
    const tipo = await this.tiposrepo.preload({
      id,
      ...updateTiposdocumentoDto,
    });

    if (!tipo.id)
      throw new NotFoundException('Error Al Localizar el Tipo de Documentos');

    try {
      await this.tiposrepo.update(id, tipo);
      return tipo;
    } catch (error) {
      throw new BadRequestException('Error al Actualizar Registro');
    }
  }
}
