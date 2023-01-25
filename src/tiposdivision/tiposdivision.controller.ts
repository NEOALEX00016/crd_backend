import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  UseGuards,
} from '@nestjs/common';
import { TiposdivisionService } from './tiposdivision.service';
import CreateTiposdivisionDto from './dto/create-tiposdivision.dto';
import { UpdateTiposdivisionDto } from './dto/update-tiposdivision.dto';
import { AuthGuard } from '@nestjs/passport';

@Controller('tiposdivision')
export class TiposdivisionController {
  constructor(private readonly tiposdivisionService: TiposdivisionService) {}

  @Post()
  @UseGuards(AuthGuard())
  create(@Body() createTiposdivisionDto: CreateTiposdivisionDto) {
    return this.tiposdivisionService.create(createTiposdivisionDto);
  }

  @Get()
  @UseGuards(AuthGuard())
  findAll() {
    return this.tiposdivisionService.findAll();
  }

  @Get(':term')
  @UseGuards(AuthGuard())
  findOne(@Param('term') term: string) {
    return this.tiposdivisionService.findOne(term);
  }

  @Patch(':id')
  @UseGuards(AuthGuard())
  update(
    @Param('id') id: number,
    @Body() updateTiposdivisionDto: UpdateTiposdivisionDto,
  ) {
    return this.tiposdivisionService.update(id, updateTiposdivisionDto);
  }
}
