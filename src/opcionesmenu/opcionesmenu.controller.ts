import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  UseGuards,
} from '@nestjs/common';
import { OpcionesmenuService } from './opcionesmenu.service';
import { CreateOpcionesmenuDto } from './dto/create-opcionesmenu.dto';
import { UpdateOpcionesmenuDto } from './dto/update-opcionesmenu.dto';
import { AuthGuard } from '@nestjs/passport';

@Controller('opcionesmenu')
export class OpcionesmenuController {
  constructor(private readonly opcionesmenuService: OpcionesmenuService) {}

  @Post()
  @UseGuards(AuthGuard())
  create(@Body() createOpcionesmenuDto: CreateOpcionesmenuDto) {
    return this.opcionesmenuService.create(createOpcionesmenuDto);
  }

  @Get()
  @UseGuards(AuthGuard())
  findAll() {
    return this.opcionesmenuService.findAll();
  }

  @Get(':term')
  @UseGuards(AuthGuard())
  findOne(@Param('term') term: string) {
    return this.opcionesmenuService.findOne(term);
  }

  @Patch(':id')
  @UseGuards(AuthGuard())
  update(
    @Param('id') id: string,
    @Body() updateOpcionesmenuDto: UpdateOpcionesmenuDto,
  ) {
    return this.opcionesmenuService.update(+id, updateOpcionesmenuDto);
  }
}
