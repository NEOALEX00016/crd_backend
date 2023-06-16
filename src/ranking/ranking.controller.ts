import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { RankingService } from './ranking.service';
import { CreateRankingDto } from './dto/create-ranking.dto';
import { UpdateRankingDto } from './dto/update-ranking.dto';

@Controller('ranking')
export class RankingController {
  constructor(private readonly rankingService: RankingService) {}

  @Get('voluntariosede/:id_sede/:desde/:hasta')
  findOne(
    @Param('id_sede') id_sede: string,
    @Param('desde') desde: string,
    @Param('hasta') hasta: string,
  ) {
    return this.rankingService.findsede(+id_sede, desde, hasta);
  }
  @Get('voluntariopais/:id_pais/:desde/:hasta')
  findnacional(
    @Param('id_pais') id_pais: string,
    @Param('desde') desde: string,
    @Param('hasta') hasta: string,
  ) {
    return this.rankingService.findnacional(+id_pais, desde, hasta);
  }
}
