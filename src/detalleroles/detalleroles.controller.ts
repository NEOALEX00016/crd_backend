import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  UseGuards,
} from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { DetallerolesService } from './detalleroles.service';
import { CreateDetalleroleDto } from './dto/create-detallerole.dto';
import { UpdateDetalleroleDto } from './dto/update-detallerole.dto';

@Controller('detalleroles')
export class DetallerolesController {
  constructor(private readonly detallerolesService: DetallerolesService) {}

  @Post()
  @UseGuards(AuthGuard())
  create(@Body() createDetalleroleDto: CreateDetalleroleDto) {
    return this.detallerolesService.create(createDetalleroleDto);
  }

  @Get()
  @UseGuards(AuthGuard())
  findAll() {
    return this.detallerolesService.findAll();
  }

  @Get(':id')
  @UseGuards(AuthGuard())
  findOne(@Param('id') id: string) {
    return this.detallerolesService.findOne(+id);
  }

  @Patch(':id')
  @UseGuards(AuthGuard())
  update(
    @Param('id') id: string,
    @Body() updateDetalleroleDto: UpdateDetalleroleDto,
  ) {
    return this.detallerolesService.update(+id, updateDetalleroleDto);
  }
}
