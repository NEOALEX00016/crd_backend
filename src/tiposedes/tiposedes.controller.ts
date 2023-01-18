import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { TiposedesService } from './tiposedes.service';
import { CreateTiposedeDto } from './dto/create-tiposede.dto';
import { UpdateTiposedeDto } from './dto/update-tiposede.dto';

@Controller('tiposedes')
export class TiposedesController {
  constructor(private readonly tiposedesService: TiposedesService) {}

  @Post()
  create(@Body() createTiposedeDto: CreateTiposedeDto) {
    return this.tiposedesService.create(createTiposedeDto);
  }

  @Get()
  findAll() {
    return this.tiposedesService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.tiposedesService.findOne(+id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateTiposedeDto: UpdateTiposedeDto,
  ) {
    return this.tiposedesService.update(+id, updateTiposedeDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.tiposedesService.remove(+id);
  }
}
