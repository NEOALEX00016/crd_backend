import { Module } from '@nestjs/common';
import { RankingService } from './ranking.service';
import { RankingController } from './ranking.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { RankingEntity } from './entities/ranking.entity';

@Module({
  controllers: [RankingController],
  providers: [RankingService],
  imports: [TypeOrmModule.forFeature([RankingEntity])],
})
export class RankingModule {}
