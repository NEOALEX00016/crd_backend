import { Controller, Get, Post, Body, Patch, Param } from '@nestjs/common';
import { DivisionService } from './division.service';
import { CreateDivisionDto } from './dto/create-division.dto';
import { UpdateDivisionDto } from './dto/update-division.dto';
import { UseGuards } from '@nestjs/common/decorators';
import { AuthGuard } from '@nestjs/passport';

@Controller('division')
export class DivisionController {
  constructor(private readonly divisionService: DivisionService) {}

  @Post()
  @UseGuards(AuthGuard())
  create(@Body() createDivisionDto: CreateDivisionDto) {
    return this.divisionService.create(createDivisionDto);
  }

  @Get()
  @UseGuards(AuthGuard())
  findAll() {
    return this.divisionService.findAll();
  }

  @Get(':nombre')
  @UseGuards(AuthGuard())
  findOne(@Param('nombre') nombre: string) {
    return this.divisionService.findOne(nombre);
  }

  @Patch(':id')
  @UseGuards(AuthGuard())
  update(
    @Param('id') id: number,
    @Body() updateDivisionDto: UpdateDivisionDto,
  ) {
    return this.divisionService.update(id, updateDivisionDto);
  }

  @Get('id/:id')
  @UseGuards(AuthGuard())
  findid(@Param('id') id: string) {
    return this.divisionService.findid(id);
  }
}
