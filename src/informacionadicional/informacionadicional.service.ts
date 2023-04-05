import { Injectable, BadRequestException } from '@nestjs/common';
import { CreateInformacionadicionalDto } from './dto/create-informacionadicional.dto';
import { UpdateInformacionadicionalDto } from './dto/update-informacionadicional.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { InformacionadicionalEntity } from './entities/informacionadicional.entity';
import { Repository } from 'typeorm';
import { NotFoundException } from '@nestjs/common/exceptions/not-found.exception';

@Injectable()
export class InformacionadicionalService {
  constructor(
    @InjectRepository(InformacionadicionalEntity)
    private readonly inforepo: Repository<InformacionadicionalEntity>,
  ) {}
  async create(createInformacionadicionalDto: CreateInformacionadicionalDto) {
    const info = await this.inforepo.create(createInformacionadicionalDto);
    try {
      await this.inforepo.save(info);
      return info;
    } catch (error) {
      throw new BadRequestException(`Error Registrado la Informacion ${error}`);
    }
  }

  async findAll() {
    const info = await this.inforepo.find();
    if (info.length <= 0)
      throw new NotFoundException('Esta Tabla no Contiene registro');
    return info;
  }

  async findOne(id: number) {
    const info = await this.inforepo.findOneBy({ id: id });
    if (!info)
      throw new NotFoundException(`Registro no Encotrado con el Id:${id}`);
    return info;
  }

  async update(
    id: number,
    updateInformacionadicionalDto: UpdateInformacionadicionalDto,
  ) {
    const info = await this.inforepo.preload({
      id,
      ...updateInformacionadicionalDto,
    });
    if (!info)
      throw new NotFoundException(`Registro no Encotrado con el Id:${id}`);

    try {
      await this.inforepo.update(id, info);
      return info;
    } catch (error) {
      throw new BadRequestException(
        `Error Actualizando la Informacion ${error}`,
      );
    }
  }

  async findidmiembro(id: number) {
    const info = await this.inforepo.find({ where: { id_miembro: id } });
    
    if (info.length <= 0)
      throw new NotFoundException(
        `Este Miembro no tiene informacion Adicional`);
     

    return info; 
  }

}
