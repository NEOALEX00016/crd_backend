import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { TipoinformacionService } from './tipoinformacion.service';
import { CreateTipoinformacionDto } from './dto/create-tipoinformacion.dto';
import { UpdateTipoinformacionDto } from './dto/update-tipoinformacion.dto';

@Controller('tipoinformacion')
export class TipoinformacionController {
  constructor(
    private readonly tipoinformacionService: TipoinformacionService,
  ) {}

  @Post()
  create(@Body() createTipoinformacionDto: CreateTipoinformacionDto) {
    return this.tipoinformacionService.create(createTipoinformacionDto);
  }

  @Get()
  findAll() {
    return this.tipoinformacionService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.tipoinformacionService.findOne(+id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateTipoinformacionDto: UpdateTipoinformacionDto,
  ) {
    return this.tipoinformacionService.update(+id, updateTipoinformacionDto);
  }
}
