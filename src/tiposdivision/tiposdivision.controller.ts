import { Controller, Get, Post, Body, Patch, Param } from '@nestjs/common';
import { TiposdivisionService } from './tiposdivision.service';
import CreateTiposdivisionDto from './dto/create-tiposdivision.dto';
import { UpdateTiposdivisionDto } from './dto/update-tiposdivision.dto';

@Controller('tiposdivision')
export class TiposdivisionController {
  constructor(private readonly tiposdivisionService: TiposdivisionService) {}

  @Post()
  create(@Body() createTiposdivisionDto: CreateTiposdivisionDto) {
    return this.tiposdivisionService.create(createTiposdivisionDto);
  }

  @Get()
  findAll() {
    return this.tiposdivisionService.findAll();
  }

  @Get(':term')
  findOne(@Param('term') term: string) {
    return this.tiposdivisionService.findOne(term);
  }

  @Patch(':id')
  update(
    @Param('id') id: number,
    @Body() updateTiposdivisionDto: UpdateTiposdivisionDto,
  ) {
    return this.tiposdivisionService.update(id, updateTiposdivisionDto);
  }
}
