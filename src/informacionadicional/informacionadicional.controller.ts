import { Controller, Get, Post, Body, Patch, Param } from '@nestjs/common';
import { InformacionadicionalService } from './informacionadicional.service';
import { CreateInformacionadicionalDto } from './dto/create-informacionadicional.dto';
import { UpdateInformacionadicionalDto } from './dto/update-informacionadicional.dto';

@Controller('informacionadicional')
export class InformacionadicionalController {
  constructor(
    private readonly informacionadicionalService: InformacionadicionalService,
  ) {}

  @Post()
  create(@Body() createInformacionadicionalDto: CreateInformacionadicionalDto) {
    return this.informacionadicionalService.create(
      createInformacionadicionalDto,
    );
  }

  @Get()
  findAll() {
    return this.informacionadicionalService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.informacionadicionalService.findOne(+id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateInformacionadicionalDto: UpdateInformacionadicionalDto,
  ) {
    return this.informacionadicionalService.update(
      +id,
      updateInformacionadicionalDto,
    );
  }

  @Get('miembro/:id')
  findidmiembro(@Param('id') id: string) {
    return this.informacionadicionalService.findidmiembro(+id);
  }
}
