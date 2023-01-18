import { Controller, Get, Post, Body, Patch, Param } from '@nestjs/common';
import { PaisService } from './pais.service';
import { CreatePaisDto } from './dto/create-pai.dto';
import { UpdatePaisDto } from './dto/update-pai.dto';
import { UseGuards } from '@nestjs/common/decorators';
import { AuthGuard } from '@nestjs/passport';

@Controller('pais')
export class PaisController {
  constructor(private readonly paisService: PaisService) {}

  @Post()
  @UseGuards(AuthGuard())
  create(@Body() createPaisDto: CreatePaisDto) {
    return this.paisService.create(createPaisDto);
  }

  @Get()
  @UseGuards(AuthGuard())
  findAll() {
    return this.paisService.findAll();
  }

  @Get(':term')
  @UseGuards(AuthGuard())
  findOne(@Param('term') term: string) {
    return this.paisService.findOne(term);
  }

  @Patch(':id')
  @UseGuards(AuthGuard())
  update(@Param('id') id: number, @Body() updatePaisDto: UpdatePaisDto) {
    return this.paisService.update(id, updatePaisDto);
  }
}
