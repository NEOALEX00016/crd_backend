import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  UseGuards,
} from '@nestjs/common';
import { PosicionesService } from './posiciones.service';
import { CreatePosicioneDto } from './dto/create-posicione.dto';
import { UpdatePosicioneDto } from './dto/update-posicione.dto';
import { AuthGuard } from '@nestjs/passport';

@Controller('posiciones')
export class PosicionesController {
  constructor(private readonly posicionesService: PosicionesService) {}

  @Post()
  @UseGuards(AuthGuard())
  create(@Body() createPosicioneDto: CreatePosicioneDto) {
    return this.posicionesService.create(createPosicioneDto);
  }

  @Get()
  @UseGuards(AuthGuard())
  findAll() {
    return this.posicionesService.findAll();
  }

  @Get(':term')
  @UseGuards(AuthGuard())
  findOne(@Param('term') term: string) {
    return this.posicionesService.findOne(term);
  }

  @Patch(':id')
  @UseGuards(AuthGuard())
  update(
    @Param('id') id: string,
    @Body() updatePosicioneDto: UpdatePosicioneDto,
  ) {
    return this.posicionesService.update(+id, updatePosicioneDto);
  }
}
