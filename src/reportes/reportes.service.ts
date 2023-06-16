import { Injectable, NotFoundException } from '@nestjs/common';
import { Repmiembrosdto } from './dto/repmiembrosdto.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { ReporteEntity } from './entities/reporte.entity';
import { Repository } from 'typeorm';
import { Repactividadesdto } from './dto/repactividades.dto';
import { Repvoluntarioparticipantesdto } from './dto/repmiembrosparticipantes.dto';
import { Repvbeneficiariosalcanzadosdto } from './dto/repbeneficiariosalcanzados.dto';
import { Repactividadesneltiempodto } from './dto/repactividadeneltiempo.dto';

@Injectable()
export class ReportesService {
  constructor(
    @InjectRepository(ReporteEntity)
    private readonly repo: Repository<ReporteEntity>,
  ) {}
  async miembros(repmiembrosdto: Repmiembrosdto) {
    const desde = repmiembrosdto.fecha_desde;
    const hasta = repmiembrosdto.fecha_hasta;
    const sexo = repmiembrosdto.sexo;
    const campo1 = repmiembrosdto.campo1;
    const valor1 = repmiembrosdto.valor1;
    const campo2 = repmiembrosdto.campo2;
    const valor2 = repmiembrosdto.valor2;
    const campo3 = repmiembrosdto.campo3;
    const valor3 = repmiembrosdto.valor3;
    const campo4 = repmiembrosdto.campo4;
    const valor4 = repmiembrosdto.valor4;
    const campo5 = repmiembrosdto.campo5;
    const valor5 = repmiembrosdto.valor5;
    let columna1 = repmiembrosdto.Columna1;
    let columna2 = repmiembrosdto.Columna2;
    let columna3 = repmiembrosdto.Columna3;
    let columna4 = repmiembrosdto.Columna4;
    let columna5 = repmiembrosdto.Columna5;
    const idsede = repmiembrosdto.sede;
    if (
      desde !== null &&
      hasta !== null &&
      sexo == 'T' &&
      campo1 == null &&
      valor1 == null &&
      campo2 == null &&
      valor2 == null &&
      campo3 == null &&
      valor3 == null &&
      campo4 == null &&
      valor4 == null &&
      campo5 == null &&
      valor5 == null
    ) {
      let qry = `select mi.nombre,mi.apellido,mi.fecha_de_nacimiento,mi.sexo,sed.nombre sede from iniciar.tbl_miembros mi
    join iniciar.tbl_sedes sed on sed.id=mi.id_sede
    left join iniciar.tbl_informacion_adicional ifo on ifo.id_miembro = mi.id and ifo.estado='Activo'
    where 1=1
    and fecha_de_nacimiento>=TO_DATE('${desde}', 'YYYY/MM/DD')
    and fecha_de_nacimiento<=TO_DATE('${hasta}', 'YYYY/MM/DD')
    `;

      if (idsede > 0) {
        qry += ` and mi.id_sede=${idsede}`;
      }

      const query = await this.repo.query(qry);

      if (query.length === 0) {
        throw new NotFoundException('No Existe Registro para estos filtros');
      }
      return query;
    }
    if (
      desde !== null &&
      hasta !== null &&
      sexo !== 'T' &&
      campo1 == null &&
      valor1 == null &&
      campo2 == null &&
      valor2 == null &&
      campo3 == null &&
      valor3 == null &&
      campo4 == null &&
      valor4 == null &&
      campo5 == null &&
      valor5 == null
    ) {
      let qry = `select mi.nombre,mi.apellido,mi.fecha_de_nacimiento,mi.sexo,sed.nombre sede 
        from iniciar.tbl_miembros mi
    join iniciar.tbl_sedes sed on sed.id=mi.id_sede
    left join iniciar.tbl_informacion_adicional ifo on ifo.id_miembro = mi.id and ifo.estado='Activo'
    where 1=1
    and fecha_de_nacimiento>=TO_DATE('${desde}', 'YYYY/MM/DD')
    and fecha_de_nacimiento<=TO_DATE('${hasta}', 'YYYY/MM/DD')
   
    and sexo='${sexo}'
    `;
      if (idsede > 0) {
        qry += ` and mi.id_sede=${idsede}`;
      }

      const query = await this.repo.query(qry);

      if (query === 0)
        throw new NotFoundException('No Existe Registro para estos filtros');
      return query;
    }

    if (
      desde !== null &&
      hasta !== null &&
      sexo == 'T' &&
      campo1 !== null &&
      valor1 !== null &&
      campo2 == null &&
      valor2 == null &&
      campo3 == null &&
      valor3 == null &&
      campo4 == null &&
      valor4 == null &&
      campo5 == null &&
      valor5 == null
    ) {
      columna1 = columna1.replace(/ /g, '_');
      let query = `select mi.nombre,mi.apellido,mi.fecha_de_nacimiento,mi.sexo,sed.nombre sede,ifo.valor as ${columna1}  
      from iniciar.tbl_miembros mi
  join iniciar.tbl_sedes sed on sed.id=mi.id_sede
  left join iniciar.tbl_informacion_adicional ifo on ifo.id_miembro = mi.id
  where 1=1
  and ifo.estado='Activo'
  and fecha_de_nacimiento>=TO_DATE('${desde}', 'YYYY/MM/DD')
  and fecha_de_nacimiento<=TO_DATE('${hasta}', 'YYYY/MM/DD')
  and ifo.id_tipo_informacion=${campo1}
  

  `;

      if (valor1 === '*') {
        query += ` and ifo.valor is not null`;
      } else {
        query += ` and ifo.valor='${valor1}'`;
      }

      if (idsede > 0) {
        query += ` and mi.id_sede=${idsede}`;
      }

      const qry = await this.repo.query(query);
      if (!qry.length)
        throw new NotFoundException('No Existe Registro para estos filtros');
      return qry;
    }
    if (
      desde !== null &&
      hasta !== null &&
      sexo == 'T' &&
      campo1 !== null &&
      valor1 !== null &&
      campo2 !== null &&
      valor2 !== null &&
      campo3 == null &&
      valor3 == null &&
      campo4 == null &&
      valor4 == null &&
      campo5 == null &&
      valor5 == null
    ) {
      columna1 = columna1.replace(/ /g, '_');
      columna2 = columna2.replace(/ /g, '_');
      let query = `select mi.nombre,mi.apellido,mi.fecha_de_nacimiento,mi.sexo,sed.nombre sede,ifo.valor as ${columna1},ifo2.valor as ${columna2}
      from iniciar.tbl_miembros mi
  join iniciar.tbl_sedes sed on sed.id=mi.id_sede
  left join iniciar.tbl_informacion_adicional ifo on ifo.id_miembro = mi.id
  left join iniciar.tbl_informacion_adicional ifo2 on ifo2.id_miembro = mi.id

  where 1=1
  and ifo.estado='Activo'
  and ifo2.estado='Activo'
  and fecha_de_nacimiento>=TO_DATE('${desde}', 'YYYY/MM/DD')
  and fecha_de_nacimiento<=TO_DATE('${hasta}', 'YYYY/MM/DD')
  and ifo.id_tipo_informacion=${campo1}
  and ifo2.id_tipo_informacion=${campo2}
  
  `;
      if (valor1 === '*') {
        query += ` and ifo.valor is not null`;
      } else {
        query += ` and ifo.valor='${valor1}'`;
      }
      if (valor2 === '*') {
        query += ` and ifo2.valor is not null`;
      } else {
        query += ` and ifo2.valor='${valor2}'`;
      }
      if (idsede > 0) {
        query += ` and mi.id_sede=${idsede}`;
      }

      const qry = await this.repo.query(query);
      if (!qry.length)
        throw new NotFoundException('No Existe Registro para estos filtros');
      return qry;
    }
    if (
      desde !== null &&
      hasta !== null &&
      sexo == 'T' &&
      campo1 !== null &&
      valor1 !== null &&
      campo2 !== null &&
      valor2 !== null &&
      campo3 !== null &&
      valor3 !== null &&
      campo4 == null &&
      valor4 == null &&
      campo5 == null &&
      valor5 == null
    ) {
      columna1 = columna1.replace(/ /g, '_');
      columna2 = columna2.replace(/ /g, '_');
      columna3 = columna3.replace(/ /g, '_');
      let query = `select mi.nombre,mi.apellido,mi.fecha_de_nacimiento,
      mi.sexo,sed.nombre sede,
      ifo.valor as ${columna1},ifo2.valor as ${columna2},ifo3.valor as ${columna3}
      from iniciar.tbl_miembros mi
  join iniciar.tbl_sedes sed on sed.id=mi.id_sede
  left join iniciar.tbl_informacion_adicional ifo on ifo.id_miembro = mi.id
  left join iniciar.tbl_informacion_adicional ifo2 on ifo2.id_miembro = mi.id
  left join iniciar.tbl_informacion_adicional ifo3 on ifo3.id_miembro = mi.id
  where 1=1
  and ifo.estado='Activo'
  and ifo2.estado='Activo'
  and ifo3.estado='Activo'
  and fecha_de_nacimiento>=TO_DATE('${desde}', 'YYYY/MM/DD')
  and fecha_de_nacimiento<=TO_DATE('${hasta}', 'YYYY/MM/DD')
  and ifo.id_tipo_informacion=${campo1}
  and ifo2.id_tipo_informacion=${campo2}
  and ifo3.id_tipo_informacion=${campo3}
 
  `;
      if (valor1 === '*') {
        query += ` and ifo.valor is not null`;
      } else {
        query += ` and ifo.valor='${valor1}'`;
      }
      if (valor2 === '*') {
        query += ` and ifo2.valor is not null`;
      } else {
        query += ` and ifo2.valor='${valor2}'`;
      }
      if (valor3 === '*') {
        query += ` and ifo3.valor is not null`;
      } else {
        query += ` and ifo3.valor='${valor3}'`;
      }
      if (idsede > 0) {
        query += ` and mi.id_sede=${idsede}`;
      }

      const qry = await this.repo.query(query);
      if (!qry.length)
        throw new NotFoundException('No Existe Registro para estos filtros');
      return qry;
    }
    if (
      desde !== null &&
      hasta !== null &&
      sexo == 'T' &&
      campo1 !== null &&
      valor1 !== null &&
      campo2 !== null &&
      valor2 !== null &&
      campo3 !== null &&
      valor3 !== null &&
      campo4 !== null &&
      valor4 !== null &&
      campo5 == null &&
      valor5 == null
    ) {
      columna1 = columna1.replace(/ /g, '_');
      columna2 = columna2.replace(/ /g, '_');
      columna3 = columna3.replace(/ /g, '_');
      columna4 = columna4.replace(/ /g, '_');
      let query = `select mi.nombre,mi.apellido,mi.fecha_de_nacimiento,
      mi.sexo,sed.nombre sede,
      ifo.valor as ${columna1},ifo2.valor as ${columna2},
      ifo3.valor as ${columna3},ifo4.valor as ${columna4}
      from iniciar.tbl_miembros mi
  join iniciar.tbl_sedes sed on sed.id=mi.id_sede
  left join iniciar.tbl_informacion_adicional ifo on ifo.id_miembro = mi.id
  left join iniciar.tbl_informacion_adicional ifo2 on ifo2.id_miembro = mi.id
  left join iniciar.tbl_informacion_adicional ifo3 on ifo3.id_miembro = mi.id
  left join iniciar.tbl_informacion_adicional ifo4 on ifo4.id_miembro = mi.id
  where 1=1
  and ifo.estado='Activo'
  and ifo2.estado='Activo'
  and ifo3.estado='Activo'
  and ifo4.estado='Activo'
  and fecha_de_nacimiento>=TO_DATE('${desde}', 'YYYY/MM/DD')
  and fecha_de_nacimiento<=TO_DATE('${hasta}', 'YYYY/MM/DD')
  and ifo.id_tipo_informacion=${campo1}
  and ifo2.id_tipo_informacion=${campo2}
  and ifo3.id_tipo_informacion=${campo3}
  and ifo4.id_tipo_informacion=${campo4}

  `;

      if (valor1 === '*') {
        query += ` and ifo.valor is not null`;
      } else {
        query += ` and ifo.valor='${valor1}'`;
      }
      if (valor2 === '*') {
        query += ` and ifo2.valor is not null`;
      } else {
        query += ` and ifo2.valor='${valor2}'`;
      }
      if (valor3 === '*') {
        query += ` and ifo3.valor is not null`;
      } else {
        query += ` and ifo3.valor='${valor3}'`;
      }
      if (valor4 === '*') {
        query += ` and ifo4.valor is not null`;
      } else {
        query += ` and ifo4.valor='${valor4}'`;
      }
      if (idsede > 0) {
        query += ` and mi.id_sede=${idsede}`;
      }
      const qry = await this.repo.query(query);
      if (!qry.length)
        throw new NotFoundException('No Existe Registro para estos filtros');
      return qry;
    }
    if (
      desde !== null &&
      hasta !== null &&
      sexo == 'T' &&
      campo1 !== null &&
      valor1 !== null &&
      campo2 !== null &&
      valor2 !== null &&
      campo3 !== null &&
      valor3 !== null &&
      campo4 !== null &&
      valor4 !== null &&
      campo5 !== null &&
      valor5 !== null
    ) {
      columna1 = columna1.replace(/ /g, '_');
      columna2 = columna2.replace(/ /g, '_');
      columna3 = columna3.replace(/ /g, '_');
      columna4 = columna4.replace(/ /g, '_');
      columna5 = columna5.replace(/ /g, '_');
      let query = `select mi.nombre,mi.apellido,mi.fecha_de_nacimiento,
      mi.sexo,sed.nombre sede, ifo.valor as ${columna1},ifo2.valor as ${columna2},
      ifo3.valor as ${columna3},ifo4.valor as ${columna4},ifo5.valor as ${columna5}
     
      from iniciar.tbl_miembros mi
  join iniciar.tbl_sedes sed on sed.id=mi.id_sede
  left join iniciar.tbl_informacion_adicional ifo on ifo.id_miembro = mi.id
  left join iniciar.tbl_informacion_adicional ifo2 on ifo2.id_miembro = mi.id
  left join iniciar.tbl_informacion_adicional ifo3 on ifo3.id_miembro = mi.id
  left join iniciar.tbl_informacion_adicional ifo4 on ifo4.id_miembro = mi.id
  left join iniciar.tbl_informacion_adicional ifo5 on ifo5.id_miembro = mi.id
  where 1=1
  and ifo.estado='Activo'
  and ifo2.estado='Activo'
  and ifo3.estado='Activo'
  and ifo4.estado='Activo'
  and ifo5.estado='Activo'

  and fecha_de_nacimiento>=TO_DATE('${desde}', 'YYYY/MM/DD')
  and fecha_de_nacimiento<=TO_DATE('${hasta}', 'YYYY/MM/DD')
  and ifo.id_tipo_informacion=${campo1}
  and ifo2.id_tipo_informacion=${campo2}
  and ifo3.id_tipo_informacion=${campo3}
  and ifo4.id_tipo_informacion=${campo4}
  and ifo5.id_tipo_informacion=${campo5}

  `;

      if (valor1 === '*') {
        query += ` and ifo.valor is not null`;
      } else {
        query += ` and ifo.valor='${valor1}'`;
      }
      if (valor2 === '*') {
        query += ` and ifo2.valor is not null`;
      } else {
        query += ` and ifo2.valor='${valor2}'`;
      }
      if (valor3 === '*') {
        query += ` and ifo3.valor is not null`;
      } else {
        query += ` and ifo3.valor='${valor3}'`;
      }
      if (valor4 === '*') {
        query += ` and ifo4.valor is not null`;
      } else {
        query += ` and ifo4.valor='${valor4}'`;
      }
      if (valor5 === '*') {
        query += ` and ifo5.valor is not null`;
      } else {
        query += ` and ifo5.valor='${valor5}'`;
      }
      if (idsede > 0) {
        query += ` and mi.id_sede=${idsede}`;
      }

      const qry = await this.repo.query(query);
      if (!qry.length)
        throw new NotFoundException('No Existe Registro para estos filtros');
      return qry;
    }
    ///ahora vamos a buscar el sexo espesifico
    if (
      desde !== null &&
      hasta !== null &&
      sexo !== 'T' &&
      campo1 !== null &&
      valor1 !== null &&
      campo2 == null &&
      valor2 == null &&
      campo3 == null &&
      valor3 == null &&
      campo4 == null &&
      valor4 == null &&
      campo5 == null &&
      valor5 == null
    ) {
      columna1 = columna1.replace(/ /g, '_');
      let query = `select mi.nombre,mi.apellido,mi.fecha_de_nacimiento,mi.sexo,sed.nombre sede,ifo.valor as ${columna1} 
      from iniciar.tbl_miembros mi
  join iniciar.tbl_sedes sed on sed.id=mi.id_sede
  left join iniciar.tbl_informacion_adicional ifo on ifo.id_miembro = mi.id
  where 1=1
  and ifo.estado='Activo'

  and sexo='${sexo}'
  and fecha_de_nacimiento>=TO_DATE('${desde}', 'YYYY/MM/DD')
  and fecha_de_nacimiento<=TO_DATE('${hasta}', 'YYYY/MM/DD')
  and ifo.id_tipo_informacion=${campo1}

  `;
      if (valor1 === '*') {
        query += ` and ifo.valor is not null`;
      } else {
        query += ` and ifo.valor='${valor1}'`;
      }
      if (idsede > 0) {
        query += ` and mi.id_sede=${idsede}`;
      }

      const qry = await this.repo.query(query);
      if (!qry.length)
        throw new NotFoundException('No Existe Registro para estos filtros');
      return qry;
    }
    if (
      desde !== null &&
      hasta !== null &&
      sexo !== 'T' &&
      campo1 !== null &&
      valor1 !== null &&
      campo2 !== null &&
      valor2 !== null &&
      campo3 == null &&
      valor3 == null &&
      campo4 == null &&
      valor4 == null &&
      campo5 == null &&
      valor5 == null
    ) {
      columna1 = columna1.replace(/ /g, '_');
      columna2 = columna2.replace(/ /g, '_');
      let query = `select mi.nombre,mi.apellido,mi.fecha_de_nacimiento,mi.sexo,sed.nombre sede,
      ifo.valor as ${columna1},ifo2.valor as ${columna2}
      from iniciar.tbl_miembros mi
  join iniciar.tbl_sedes sed on sed.id=mi.id_sede
  left join iniciar.tbl_informacion_adicional ifo on ifo.id_miembro = mi.id
  left join iniciar.tbl_informacion_adicional ifo2 on ifo2.id_miembro = mi.id
  where 1=1
  and ifo.estado='Activo'
  and ifo2.estado='Activo'
  and sexo='${sexo}'
  and fecha_de_nacimiento>=TO_DATE('${desde}', 'YYYY/MM/DD')
  and fecha_de_nacimiento<=TO_DATE('${hasta}', 'YYYY/MM/DD')
  and ifo.id_tipo_informacion=${campo1}
  and ifo2.id_tipo_informacion=${campo2}
  
  `;
      if (valor1 === '*') {
        query += ` and ifo.valor is not null`;
      } else {
        query += ` and ifo.valor='${valor1}'`;
      }
      if (valor2 === '*') {
        query += ` and ifo2.valor is not null`;
      } else {
        query += ` and ifo2.valor='${valor2}'`;
      }
      if (idsede > 0) {
        query += ` and mi.id_sede=${idsede}`;
      }
      const qry = await this.repo.query(query);
      if (!qry.length)
        throw new NotFoundException('No Existe Registro para estos filtros');
      return qry;
    }
    if (
      desde !== null &&
      hasta !== null &&
      sexo !== 'T' &&
      campo1 !== null &&
      valor1 !== null &&
      campo2 !== null &&
      valor2 !== null &&
      campo3 !== null &&
      valor3 !== null &&
      campo4 == null &&
      valor4 == null &&
      campo5 == null &&
      valor5 == null
    ) {
      columna1 = columna1.replace(/ /g, '_');
      columna2 = columna2.replace(/ /g, '_');
      columna3 = columna3.replace(/ /g, '_');
      let query = `select mi.nombre,mi.apellido,mi.fecha_de_nacimiento,mi.sexo,sed.nombre sede,
      ifo.valor as ${columna1},ifo2.valor as ${columna2},ifo3.valor as ${columna3}
      from iniciar.tbl_miembros mi
  join iniciar.tbl_sedes sed on sed.id=mi.id_sede
  left join iniciar.tbl_informacion_adicional ifo on ifo.id_miembro = mi.id
  left join iniciar.tbl_informacion_adicional ifo2 on ifo2.id_miembro = mi.id
  left join iniciar.tbl_informacion_adicional ifo3 on ifo3.id_miembro = mi.id
  where 1=1
  and ifo.estado='Activo'
  and ifo2.estado='Activo'
  and ifo3.estado='Activo'

  and sexo='${sexo}'
  and fecha_de_nacimiento>=TO_DATE('${desde}', 'YYYY/MM/DD')
  and fecha_de_nacimiento<=TO_DATE('${hasta}', 'YYYY/MM/DD')
  and ifo.id_tipo_informacion=${campo1}
  and ifo2.id_tipo_informacion=${campo2}
  and ifo3.id_tipo_informacion=${campo3}
  
  `;
      if (valor1 === '*') {
        query += ` and ifo.valor is not null`;
      } else {
        query += ` and ifo.valor='${valor1}'`;
      }
      if (valor2 === '*') {
        query += ` and ifo2.valor is not null`;
      } else {
        query += ` and ifo2.valor='${valor2}'`;
      }
      if (valor3 === '*') {
        query += ` and ifo3.valor is not null`;
      } else {
        query += ` and ifo3.valor='${valor3}'`;
      }
      if (idsede > 0) {
        query += ` and mi.id_sede=${idsede}`;
      }
      const qry = await this.repo.query(query);
      if (!qry.length)
        throw new NotFoundException('No Existe Registro para estos filtros');
      return qry;
    }
    if (
      desde !== null &&
      hasta !== null &&
      sexo !== 'T' &&
      campo1 !== null &&
      valor1 !== null &&
      campo2 !== null &&
      valor2 !== null &&
      campo3 !== null &&
      valor3 !== null &&
      campo4 !== null &&
      valor4 !== null &&
      campo5 == null &&
      valor5 == null
    ) {
      columna1 = columna1.replace(/ /g, '_');
      columna2 = columna2.replace(/ /g, '_');
      columna3 = columna3.replace(/ /g, '_');
      columna4 = columna4.replace(/ /g, '_');
      let query = `select mi.nombre,mi.apellido,mi.fecha_de_nacimiento,mi.sexo,sed.nombre sede,
      ifo.valor as ${columna1},ifo2.valor as ${columna2},ifo3.valor as ${columna3},ifo4.valor as ${columna4}
      from iniciar.tbl_miembros mi
  join iniciar.tbl_sedes sed on sed.id=mi.id_sede
  left join iniciar.tbl_informacion_adicional ifo on ifo.id_miembro = mi.id
  left join iniciar.tbl_informacion_adicional ifo2 on ifo2.id_miembro = mi.id
  left join iniciar.tbl_informacion_adicional ifo3 on ifo3.id_miembro = mi.id
  left join iniciar.tbl_informacion_adicional ifo4 on ifo4.id_miembro = mi.id
  where 1=1
  and ifo.estado='Activo'
  and ifo2.estado='Activo'
  and ifo3.estado='Activo'
  and ifo4.estado='Activo'

  and sexo='${sexo}'
  and fecha_de_nacimiento>=TO_DATE('${desde}', 'YYYY/MM/DD')
  and fecha_de_nacimiento<=TO_DATE('${hasta}', 'YYYY/MM/DD')
  and ifo.id_tipo_informacion=${campo1}
  and ifo2.id_tipo_informacion=${campo2}
  and ifo3.id_tipo_informacion=${campo3}
  and ifo4.id_tipo_informacion=${campo4}
 
  `;
      if (valor1 === '*') {
        query += ` and ifo.valor is not null`;
      } else {
        query += ` and ifo.valor='${valor1}'`;
      }
      if (valor2 === '*') {
        query += ` and ifo2.valor is not null`;
      } else {
        query += ` and ifo2.valor='${valor2}'`;
      }
      if (valor3 === '*') {
        query += ` and ifo3.valor is not null`;
      } else {
        query += ` and ifo3.valor='${valor3}'`;
      }
      if (valor4 === '*') {
        query += ` and ifo4.valor is not null`;
      } else {
        query += ` and ifo4.valor='${valor4}'`;
      }
      if (idsede > 0) {
        query += ` and mi.id_sede=${idsede}`;
      }
      const qry = await this.repo.query(query);
      if (!qry.length)
        throw new NotFoundException('No Existe Registro para estos filtros');
      return qry;
    }
    if (
      desde !== null &&
      hasta !== null &&
      sexo !== 'T' &&
      campo1 !== null &&
      valor1 !== null &&
      campo2 !== null &&
      valor2 !== null &&
      campo3 !== null &&
      valor3 !== null &&
      campo4 !== null &&
      valor4 !== null &&
      campo5 !== null &&
      valor5 !== null
    ) {
      columna1 = columna1.replace(/ /g, '_');
      columna2 = columna2.replace(/ /g, '_');
      columna3 = columna3.replace(/ /g, '_');
      columna4 = columna4.replace(/ /g, '_');
      columna5 = columna5.replace(/ /g, '_');
      let query = `select mi.nombre,mi.apellido,mi.fecha_de_nacimiento,mi.sexo,sed.nombre sede,
      ifo.valor as ${columna1},ifo2.valor as ${columna2},ifo3.valor as ${columna3},ifo4.valor as ${columna4},ifo5.valor as ${columna5}
      from iniciar.tbl_miembros mi
  join iniciar.tbl_sedes sed on sed.id=mi.id_sede
  left join iniciar.tbl_informacion_adicional ifo on ifo.id_miembro = mi.id
  left join iniciar.tbl_informacion_adicional ifo2 on ifo2.id_miembro = mi.id
  left join iniciar.tbl_informacion_adicional ifo3 on ifo3.id_miembro = mi.id
  left join iniciar.tbl_informacion_adicional ifo4 on ifo4.id_miembro = mi.id
  left join iniciar.tbl_informacion_adicional ifo5 on ifo5.id_miembro = mi.id
  where 1=1
  and ifo.estado='Activo'
  and ifo2.estado='Activo'
  and ifo3.estado='Activo'
  and ifo4.estado='Activo'
  and ifo5.estado='Activo'

  and sexo='${sexo}'
  and fecha_de_nacimiento>=TO_DATE('${desde}', 'YYYY/MM/DD')
  and fecha_de_nacimiento<=TO_DATE('${hasta}', 'YYYY/MM/DD')
  and ifo.id_tipo_informacion=${campo1}
  and ifo2.id_tipo_informacion=${campo2}
  and ifo3.id_tipo_informacion=${campo3}
  and ifo4.id_tipo_informacion=${campo4}
  and ifo5.id_tipo_informacion=${campo5}
 
  `;
      if (valor1 === '*') {
        query += ` and ifo.valor is not null`;
      } else {
        query += ` and ifo.valor='${valor1}'`;
      }
      if (valor2 === '*') {
        query += ` and ifo2.valor is not null`;
      } else {
        query += ` and ifo2.valor='${valor2}'`;
      }
      if (valor3 === '*') {
        query += ` and ifo3.valor is not null`;
      } else {
        query += ` and ifo3.valor='${valor3}'`;
      }
      if (valor4 === '*') {
        query += ` and ifo4.valor is not null`;
      } else {
        query += ` and ifo4.valor='${valor4}'`;
      }
      if (valor5 === '*') {
        query += ` and ifo5.valor is not null`;
      } else {
        query += ` and ifo5.valor='${valor5}'`;
      }
      if (idsede > 0) {
        query += ` and mi.id_sede=${idsede}`;
      }
      const qry = await this.repo.query(query);
      if (!qry.length)
        throw new NotFoundException('No Existe Registro para estos filtros');
      return qry;
    }
  }

  async actividades(repactividadesdto: Repactividadesdto) {
    const desde = repactividadesdto.fecha_desde;
    const hasta = repactividadesdto.fecha_hasta;
    const proyecto = repactividadesdto.idproyecto;
    const area = repactividadesdto.area_accion;
    const subproyecto = repactividadesdto.idsubproyecto;
    const sede = repactividadesdto.sede;
    const entrega = repactividadesdto.entregabienes;
    const asistencia = repactividadesdto.asistencias;
    const orientacion = repactividadesdto.orientacion;
    const capacitacion = repactividadesdto.capacitacion;
    const gestion = repactividadesdto.gestion;

    let qry = `select 
    act.id,
    act.fecha_actividad,
    act.descripcion nombre,
    act.codigo,
    sed.nombre sede,
    pro.nombre proyecto_nacional,
    sub.descripcion sub_proyecto,
    act.area_de_accion,
    act.entregabienes,
    act.asistencias,
    act.orientacion,
    act.capacitacion,
    act.gestion,
    act.id_proyecto_nacional,
	  act.id_sede,
	  act.id_sub_proyecto,
    act.estado
    
    from iniciar.tbl_actividades act
    join iniciar.tbl_sedes sed
    on sed.id=act.id_sede
    join iniciar.tbl_proyectos_nacionales pro
    on pro.id=act.id_proyecto_nacional
    left join iniciar.tbl_sub_proyectos sub 
    on sub.id=act.id_sub_proyecto
    where 1=1`;

    if (desde != '') {
      qry += `  and fecha_actividad>=TO_DATE('${desde}', 'YYYY/MM/DD')`;
    }

    if (hasta != '') {
      qry += `  and fecha_actividad<=TO_DATE('${hasta}', 'YYYY/MM/DD')`;
    }

    if (proyecto != '*') {
      qry += ` and act.id_proyecto_nacional=${proyecto}`;
    }

    if (subproyecto != '*') {
      qry += ` and act.id_sub_proyecto=${subproyecto}`;
    }

    if (sede != '*') {
      qry += ` and act.id_sede=${sede}`;
    }
    if (area != '*') {
      qry += ` and act.area_de_accion='${area}'`;
    }

    if (entrega == 'true') {
      qry += ` and act.entregabienes=${entrega}`;
    }
    if (asistencia == 'true') {
      qry += ` and act.asistencias=${asistencia}`;
    }
    if (orientacion == 'true') {
      qry += ` and act.orientacion=${orientacion}`;
    }

    if (capacitacion == 'true') {
      qry += ` and act.capacitacion=${capacitacion}`;
    }

    if (gestion == 'true') {
      qry += ` and act.gestion=${gestion}`;
    }
    console.log(qry);
    const query = await this.repo.query(qry);

    if (query.length <= 0)
      throw new NotFoundException(`No existen datos para este filtro`);
    return query;
  }

  async voluntarioparticipantes(
    repvoluntarioparticipantesdto: Repvoluntarioparticipantesdto,
  ) {
    const desde = repvoluntarioparticipantesdto.fecha_desde;
    const hasta = repvoluntarioparticipantesdto.fecha_hasta;
    const proyecto = repvoluntarioparticipantesdto.idproyecto;
    const area = repvoluntarioparticipantesdto.area_accion;
    const subproyecto = repvoluntarioparticipantesdto.idsubproyecto;
    const sede = repvoluntarioparticipantesdto.sede;
    const entrega = repvoluntarioparticipantesdto.entregabienes;
    const asistencia = repvoluntarioparticipantesdto.asistencias;
    const orientacion = repvoluntarioparticipantesdto.orientacion;
    const capacitacion = repvoluntarioparticipantesdto.capacitacion;
    const gestion = repvoluntarioparticipantesdto.gestion;
    const idactividad = repvoluntarioparticipantesdto.idactividad;

    let qry = `select 
    sum(mujeresjuventud)mujeres,
    sum(hombresjuventud)hombres
    
    from iniciar.tbl_actividades act
    join iniciar.tbl_sedes sed
    on sed.id=act.id_sede
    join iniciar.tbl_proyectos_nacionales pro
    on pro.id=act.id_proyecto_nacional
    left join iniciar.tbl_sub_proyectos sub 
    on sub.id=act.id_sub_proyecto
    where 1=1`;

    if (desde != '') {
      qry += `  and fecha_actividad>=TO_DATE('${desde}', 'YYYY/MM/DD')`;
    }

    if (hasta != '') {
      qry += `  and fecha_actividad<=TO_DATE('${hasta}', 'YYYY/MM/DD')`;
    }

    if (proyecto != '*') {
      qry += ` and act.id_proyecto_nacional=${proyecto}`;
    }

    if (subproyecto != '*') {
      qry += ` and act.id_sub_proyecto=${subproyecto}`;
    }

    if (sede != '*') {
      qry += ` and act.id_sede=${sede}`;
    }
    if (area != '*') {
      qry += ` and act.area_de_accion='${area}'`;
    }

    if (entrega == 'true') {
      qry += ` and act.entregabienes=${entrega}`;
    }
    if (asistencia == 'true') {
      qry += ` and act.asistencias=${asistencia}`;
    }
    if (orientacion == 'true') {
      qry += ` and act.orientacion=${orientacion}`;
    }

    if (capacitacion == 'true') {
      qry += ` and act.capacitacion=${capacitacion}`;
    }

    if (gestion == 'true') {
      qry += ` and act.gestion=${gestion}`;
    }
    if (idactividad != '*') {
      qry += ` and act.id='${idactividad}'`;
    }

    const query = await this.repo.query(qry);

    if (query.length <= 0)
      throw new NotFoundException(`No existen datos para este filtro`);
    return query;
  }

  async beneficiariosalcanzados(
    repvbeneficiariosalcanzadosdto: Repvbeneficiariosalcanzadosdto,
  ) {
    const desde = repvbeneficiariosalcanzadosdto.fecha_desde;
    const hasta = repvbeneficiariosalcanzadosdto.fecha_hasta;
    const proyecto = repvbeneficiariosalcanzadosdto.idproyecto;
    const area = repvbeneficiariosalcanzadosdto.area_accion;
    const subproyecto = repvbeneficiariosalcanzadosdto.idsubproyecto;
    const sede = repvbeneficiariosalcanzadosdto.sede;
    const entrega = repvbeneficiariosalcanzadosdto.entregabienes;
    const asistencia = repvbeneficiariosalcanzadosdto.asistencias;
    const orientacion = repvbeneficiariosalcanzadosdto.orientacion;
    const capacitacion = repvbeneficiariosalcanzadosdto.capacitacion;
    const gestion = repvbeneficiariosalcanzadosdto.gestion;
    const idactividad = repvbeneficiariosalcanzadosdto.idactividad;
    let qry = `select 
  sum(act."05_hombres")"05_hombres",
	sum(act."05_mujeres")"05mujeres",
	sum(act."612_hombres")"612_hombres",
	sum(act."612_mujeres")"612_mujeres",
	sum(act."1317_hombres")"1317_hombres",
	sum(act."1317_mujeres")"1317_mujeres",
	sum(act."1829_hombres")"1829_hombres",
	sum(act."1829_mujeres")"1829_mujeres",
	sum(act."3039_hombres")"3039_hombres",
	sum(act."3039_mujeres")"3039_mujeres",
	sum(act."4049_hombres")"4049_hombres",
	sum(act."4049_mujeres")"4049_mujeres",
	sum(act."5059_hombres")"5059_hombres",
	sum(act."5059_mujeres")"5059_mujeres",
	sum(act."6069_hombres")"6069_hombres",
	sum(act."6069_mujeres")"6069_mujeres",
	sum(act."7079_hombres")"7079_hombres",
	sum(act."7079_mujeres")"7079_mujeres",
	sum(act."80_hombres")"80_hombres",
	sum(act."80_mujeres")"80_mujeres",
	sum(act.otros_hombres)otros_hombres,
	sum(act.otros_mujeres)otros_mujeres
    from iniciar.tbl_actividades act
    join iniciar.tbl_sedes sed
    on sed.id=act.id_sede
    join iniciar.tbl_proyectos_nacionales pro
    on pro.id=act.id_proyecto_nacional
    left join iniciar.tbl_sub_proyectos sub 
    on sub.id=act.id_sub_proyecto
    where 1=1`;

    if (desde != '') {
      qry += `  and fecha_actividad>=TO_DATE('${desde}', 'YYYY/MM/DD')`;
    }

    if (hasta != '') {
      qry += `  and fecha_actividad<=TO_DATE('${hasta}', 'YYYY/MM/DD')`;
    }

    if (proyecto != '*') {
      qry += ` and act.id_proyecto_nacional=${proyecto}`;
    }

    if (subproyecto != '*') {
      qry += ` and act.id_sub_proyecto=${subproyecto}`;
    }

    if (sede != '*') {
      qry += ` and act.id_sede=${sede}`;
    }
    if (area != '*') {
      qry += ` and act.area_de_accion='${area}'`;
    }

    if (entrega == 'true') {
      qry += ` and act.entregabienes=${entrega}`;
    }
    if (asistencia == 'true') {
      qry += ` and act.asistencias=${asistencia}`;
    }
    if (orientacion == 'true') {
      qry += ` and act.orientacion=${orientacion}`;
    }

    if (capacitacion == 'true') {
      qry += ` and act.capacitacion=${capacitacion}`;
    }

    if (gestion == 'true') {
      qry += ` and act.gestion=${gestion}`;
    }
    if (idactividad != '*') {
      qry += ` and act.id='${idactividad}'`;
    }

    const query = await this.repo.query(qry);

    if (query.length <= 0)
      throw new NotFoundException(`No existen datos para este filtro`);
    return query;
  }

  async actividadeseneltiempo(
    repactividadesneltiempodto: Repactividadesneltiempodto,
  ) {
    const desde = repactividadesneltiempodto.fecha_desde;
    const hasta = repactividadesneltiempodto.fecha_hasta;
    const proyecto = repactividadesneltiempodto.idproyecto;
    const area = repactividadesneltiempodto.area_accion;
    const subproyecto = repactividadesneltiempodto.idsubproyecto;
    const sede = repactividadesneltiempodto.sede;
    const entrega = repactividadesneltiempodto.entregabienes;
    const asistencia = repactividadesneltiempodto.asistencias;
    const orientacion = repactividadesneltiempodto.orientacion;
    const capacitacion = repactividadesneltiempodto.capacitacion;
    const gestion = repactividadesneltiempodto.gestion;
    const idactividad = repactividadesneltiempodto.idactividad;
    let qry = `select 
    count(*)actividades,
    to_char(act.fecha_actividad,'YYYY/MM/DD') fecha
  from iniciar.tbl_actividades act
  join iniciar.tbl_sedes sed
  on sed.id=act.id_sede
  join iniciar.tbl_proyectos_nacionales pro
  on pro.id=act.id_proyecto_nacional
  left join iniciar.tbl_sub_proyectos sub 
  on sub.id=act.id_sub_proyecto
  where 1=1`;

    if (desde != '') {
      qry += `  and fecha_actividad>=TO_DATE('${desde}', 'YYYY/MM/DD')`;
    }

    if (hasta != '') {
      qry += `  and fecha_actividad<=TO_DATE('${hasta}', 'YYYY/MM/DD')`;
    }

    if (proyecto != '*') {
      qry += ` and act.id_proyecto_nacional=${proyecto}`;
    }

    if (subproyecto != '*') {
      qry += ` and act.id_sub_proyecto=${subproyecto}`;
    }

    if (sede != '*') {
      qry += ` and act.id_sede=${sede}`;
    }
    if (area != '*') {
      qry += ` and act.area_de_accion='${area}'`;
    }

    if (entrega == 'true') {
      qry += ` and act.entregabienes=${entrega}`;
    }
    if (asistencia == 'true') {
      qry += ` and act.asistencias=${asistencia}`;
    }
    if (orientacion == 'true') {
      qry += ` and act.orientacion=${orientacion}`;
    }

    if (capacitacion == 'true') {
      qry += ` and act.capacitacion=${capacitacion}`;
    }

    if (gestion == 'true') {
      qry += ` and act.gestion=${gestion}`;
    }
    if (idactividad != '*') {
      qry += ` and act.id='${idactividad}'`;
    }

    qry += `group by to_char(act.fecha_actividad,'YYYY/MM/DD')`;
    qry += `order by to_char(act.fecha_actividad,'YYYY/MM/DD') ASC`;

    const query = await this.repo.query(qry);

    if (query.length <= 0)
      throw new NotFoundException(`No existen datos para este filtro`);
    return query;
  }
}
