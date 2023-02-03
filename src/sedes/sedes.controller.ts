import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  UseGuards,
} from '@nestjs/common';
import { SedesService } from './sedes.service';
import { CreateSedeDto } from './dto/create-sede.dto';
import { UpdateSedeDto } from './dto/update-sede.dto';
import { AuthGuard } from '@nestjs/passport';

@Controller('sedes')
export class SedesController {
  constructor(private readonly sedesService: SedesService) {}

  @Post()
  @UseGuards(AuthGuard())
  create(@Body() createSedeDto: CreateSedeDto) {
    return this.sedesService.create(createSedeDto);
  }

  @Get()
  findAll() {
    return this.sedesService.findAll();
  }

  @Get(':term')
  findOne(@Param('term') term: string) {
    return this.sedesService.findOne(term);
  }

  @Patch(':id')
  @UseGuards(AuthGuard())
  update(@Param('id') id: string, @Body() updateSedeDto: UpdateSedeDto) {
    return this.sedesService.update(+id, updateSedeDto);
  }
  @Get('id/:id')
  findid(@Param('id') id: number) {
    return this.sedesService.findid(+id);
  }
}
