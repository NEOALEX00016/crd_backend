import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateRankingDto } from './dto/create-ranking.dto';
import { UpdateRankingDto } from './dto/update-ranking.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { RankingEntity } from './entities/ranking.entity';
import { Repository } from 'typeorm';

@Injectable()
export class RankingService {
  constructor(
    @InjectRepository(RankingEntity)
    private readonly rankinrepo: Repository<RankingEntity>,
  ) {}
  async findsede(id_sede: number, desde: string, hasta: string) {
    const resultado = await this.rankinrepo
      .query(`SELECT miem.urlfoto foto, miem.nombre||' '||miem.apellido miembro,sum(ran.puntaje)puntuacion,sed.nombre sede FROM iniciar.tbl_ranking ran
    join iniciar.tbl_miembros miem on miem.id=ran.id_miembro
    join iniciar.tbl_sedes sed on sed.id=ran.id_sede
    join iniciar.tbl_paises pa on pa.id=sed.id_pais
    where 1=1
    and ran.id_sede=${id_sede}
    and  fecha BETWEEN TO_DATE('${desde}', 'YYYY/MM/DD') AND TO_DATE('${hasta}', 'YYYY/MM/DD')
    group by miem.urlfoto,miem.nombre,miem.apellido,sed.nombre
    order by sum(ran.puntaje)`);
    if (resultado == 0)
      throw new NotFoundException(
        'No existe Registro para este Periodo De tiempo',
      );
    return resultado;
  }

  async findnacional(id_pais: number, desde: string, hasta: string) {
    const resultado = await this.rankinrepo
      .query(`SELECT miem.urlfoto foto, miem.nombre||' '||miem.apellido miembro,sum(ran.puntaje)puntuacion,sed.nombre sede FROM iniciar.tbl_ranking ran
    join iniciar.tbl_miembros miem on miem.id=ran.id_miembro
    join iniciar.tbl_sedes sed on sed.id=ran.id_sede
    join iniciar.tbl_paises pa on pa.id=sed.id_pais
    where 1=1
    and sed.id_pais=${id_pais}
    and  fecha BETWEEN TO_DATE('${desde}', 'YYYY/MM/DD') AND TO_DATE('${hasta}', 'YYYY/MM/DD')
    group by miem.urlfoto,miem.nombre,miem.apellido,sed.nombre
    order by sum(ran.puntaje)`);
    if (resultado == 0)
      throw new NotFoundException(
        'No existe Registro para este Periodo De tiempo',
      );
    return resultado;
  }

}
