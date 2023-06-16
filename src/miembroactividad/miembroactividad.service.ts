import { Injectable, BadRequestException, ConsoleLogger } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { CreateMiembroactividadDto } from './dto/create-miembroactividad.dto';
import { UpdateMiembroactividadDto } from './dto/update-miembroactividad.dto';
import { Repository } from 'typeorm';

import { Miembroactividadentity } from './entities/miembroactividad.entity';
import { PosicioneEntity } from 'src/posiciones/entities/posicione.entity';
import { MiembrosposicionEntity } from '../miembrosposicion/entities/miembrosposicion.entity';
import { MiembroEntity } from 'src/miembros/entities/miembro.entity';
import { ActividadesEntity } from '../actividades/entities/actividade.entity';
import { MailService } from 'src/mail/mail.service';
import { NotificacionEntity } from '../notificacion/entities/notificacion.entity';
import { NotFoundException } from '@nestjs/common/exceptions/not-found.exception';

@Injectable()
export class MiembroactividadService {
  constructor(
    @InjectRepository(Miembroactividadentity)
    private readonly repomiembro: Repository<Miembroactividadentity>,
    @InjectRepository(PosicioneEntity)
    private readonly repoposiciones: Repository<PosicioneEntity>,
    @InjectRepository(MiembrosposicionEntity)
    private readonly repomiembroposicion: Repository<MiembrosposicionEntity>,
    @InjectRepository(MiembroEntity)
    private readonly repodemiembros: Repository<MiembroEntity>,
    @InjectRepository(ActividadesEntity)
    private readonly repoactividades: Repository<ActividadesEntity>,
    private mailService: MailService,

    @InjectRepository(NotificacionEntity)
    private readonly noticionrepo: Repository<NotificacionEntity>,
  ) {}
  async create(createMiembroactividadDto: CreateMiembroactividadDto) {
    const actividadmiembro = await this.repomiembro.create(
      createMiembroactividadDto,
    );
    try {
      await this.repomiembro.save(actividadmiembro);
      return actividadmiembro;
    } catch (error) {
      throw new BadRequestException(
        `Error Registrado esta Actividad al Miembro`,
      );
    }
  }

  async findAll() {
    const miembro = await this.repomiembro.find();
    if (miembro.length <= 0)
      throw new NotFoundException('Esta Tabla no contiene Registro');
    return miembro;
  }

  findOne(id: number) {
    return `This action returns a #${id} miembroactividad`;
  }

  async update(
    id: number,
    updateMiembroactividadDto: UpdateMiembroactividadDto,
  ) {
    const actividad = await this.repomiembro.preload({
      id,
      ...updateMiembroactividadDto,
    });
    if (!actividad)
      throw new NotFoundException(`Error encontrando este id ${id}`);
    try {
      await this.repomiembro.update(id, actividad);
      return actividad;
    } catch (error) {
      throw new BadRequestException(
        'Error Actualizando la Actividad del Miembro',
      );
    }
  }

  async notificaractivida(id: number, actividad: number) {
    const posiciones = await this.repoposiciones.findBy({ depende: id });
    const varactividad = await this.repoactividades.findOneBy({
      id: actividad,
    });

    const varidmiembro = varactividad.id_miembro;
    const descripcionactividad = varactividad.descripcion;
    const fechaactividad = varactividad.fecha_actividad;

    const varcoordinador = await this.repodemiembros.findOneBy({
      id: varidmiembro,
    });

    for (const posicione of posiciones) {
      const miembros = await this.repomiembroposicion.find({
        where: { id_posicion: posicione.id, estado: 'Activo' },
      });

      for (const miembro of miembros) {
        const dto = {
          id_miembro: miembro.id_miembro,
          id_actividad: actividad,
        };
        const notiific = {
          id_pais: miembro.id_pais,
          tipo_notificacion: 'Actividad',
          id_actividad: actividad,
          id_miembro: miembro.id_miembro,
          nombre: 'Notificacion de Actividad',
          descripcion: descripcionactividad,
          estado: 'Activo',
          agregado_por: 'Sistema',
          agregado_en: new Date(),
        };

        try {
          await this.noticionrepo.save(notiific);
        } catch (error) {
          throw new BadRequestException(
            `Error Registrado esta Actividad al Miembro ${error}`,
          );
        }

        try {
          await this.repomiembro.save(dto);
        } catch (error) {
          throw new BadRequestException(
            `Error Registrado esta Actividad al Miembro ${error}`,
          );
        }
      }
    }

    const nombrecoordinador =
      varcoordinador.nombre + ' ' + varcoordinador.apellido;

    const voluntarios = await this.repomiembro.find({
      where: { id_actividad: actividad },
    });
    for (const voluntario of voluntarios) {
      const idvoluntario = voluntario.id_miembro;
      //buscar miembro;
      const vvoluntario = await this.repodemiembros.findOneBy({
        id: idvoluntario,
      });
      console.log(vvoluntario);

      const urlok = `https://crd.tusaludmundial/invitacion/${actividad}/${voluntario.id_miembro}/ok`;
      const urlcancel = `https://crd.tusaludmundial/invitacion/${actividad}/${voluntario.id_miembro}/cancel`;
      await this.mailService.sendInvitacion(
        urlok,
        urlcancel,
        vvoluntario.email,
        fechaactividad.toDateString(),
        descripcionactividad,
        nombrecoordinador,
        vvoluntario.nombre + '' + vvoluntario.apellido,
      );
    }
  }
  async findOneactividadmiembro(miembro: number, actividad: number) {
    const miembros = await this.repomiembro.find({
      where: { id_miembro: miembro, id_actividad: actividad },
    });

    if (miembros.length <= 0)
      throw new NotFoundException(
        `Registro para el Miembro ${miembro} y en la actividad ${actividad} no encotrado`,
      );
    return miembros;
  }

  async findcantidad(actividad: number) {
    const result = await this.repomiembro.query(
      `SELECT COUNT(*)aceptados FROM iniciar.tbl_miembros_actividad where id_actividad=${actividad} and estado='Aceptado'`,
    );
    return result[0];
  }
  async findaceptados(actividad: number) {
    const result = await this.repomiembro.query(
      `SELECT MI.ID ID_MIEMBRO,
      MI.NOMBRE,
      MI.APELLIDO,
      MI.URLFOTO,
      MI.SEXO,
      MI.ID_AREA,
      area.nombre AREA,
      ACT.ESTADO
    FROM INICIAR.TBL_MIEMBROS_ACTIVIDAD ACT
    JOIN INICIAR.TBL_MIEMBROS MI ON MI.ID = ACT.ID_MIEMBRO
    join iniciar.tbl_areas area on area.id=mi.id_area
    where act.estado='Aceptado' and act.id_actividad=${actividad}`,
    );
    if (!result)
      throw new NotFoundException(
        'No Se encuantran Registros Aceptados para esta Actividad',
      );
    return result;
  }
  async misactividades(miembro: number, estado: string) {
    if (estado == 'all') {
      const result = await this.repomiembro.query(
        `SELECT ACT.DESCRIPCION ACTIVIDAD,
      ACT.CODIGO,
      ACT.ID
      ID_ACTIVIDAD,
      ACT.FECHA_ACTIVIDAD,
      ACT.AREA_DE_ACCION,
      MI.ESTADO,
      ACEPTADO_EN,
      RECHAZADO_EN,
      mi.id_miembro
    FROM INICIAR.TBL_MIEMBROS_ACTIVIDAD MI
    JOIN INICIAR.TBL_ACTIVIDADES ACT ON ACT.ID = MI.ID_ACTIVIDAD
    where 1=1 
    and mi.id_miembro=${miembro}
    order by act.fecha_actividad
    `,
      );

      if (!result)
        throw new NotFoundException(
          'No Se encuantran Registros Aceptados para esta Actividad',
        );
      return result;
    } else {
      const result = await this.repomiembro.query(
        `SELECT ACT.DESCRIPCION ACTIVIDAD,
      ACT.CODIGO,
      ACT.ID
      ID_ACTIVIDAD,
      ACT.FECHA_ACTIVIDAD,
      ACT.AREA_DE_ACCION,
      act.estado estado_actividad,
      MI.ESTADO,
      ACEPTADO_EN,
      RECHAZADO_EN,
      mi.id_miembro
    FROM INICIAR.TBL_MIEMBROS_ACTIVIDAD MI
    JOIN INICIAR.TBL_ACTIVIDADES ACT ON ACT.ID = MI.ID_ACTIVIDAD
    where 1=1 
    and mi.id_miembro=${miembro}
    and mi.estado='${estado}'
    order by act.fecha_actividad
    `,
      );

      if (!result)
        throw new NotFoundException(
          'No Se encuantran Registros Aceptados para esta Actividad',
        );
      return result;
    }
  }
  async invitacionmiembros(actividad: number, estado: string) {
    if (estado == 'all') {
      const result = await this.repomiembro.query(
        `SELECT ACT.DESCRIPCION ACTIVIDAD,
        ACT.CODIGO,
        ACT.ID
        ID_ACTIVIDAD,
        ACT.FECHA_ACTIVIDAD,
        ACT.AREA_DE_ACCION,
        MI.ESTADO,
        ACEPTADO_EN,
        RECHAZADO_EN,
        mi.id_miembro,
      miem.nombre,
      miem.apellido,
      miem.urlfoto	  
      FROM INICIAR.TBL_MIEMBROS_ACTIVIDAD MI
      JOIN INICIAR.TBL_ACTIVIDADES ACT ON ACT.ID = MI.ID_ACTIVIDAD
    join iniciar.tbl_miembros miem on miem.id=mi.id_miembro
      where 1=1 
      and mi.id_actividad=${actividad}
      order by act.fecha_actividad
    `,
      );

      if (result == 0)
        throw new NotFoundException(
          'No Se encuentran Registros Miembros Invitados para esta Actividad',
        );

      return result;
    } else {
      const result = await this.repomiembro.query(
        `SELECT ACT.DESCRIPCION ACTIVIDAD,
        ACT.CODIGO,
        ACT.ID
        ID_ACTIVIDAD,
        ACT.FECHA_ACTIVIDAD,
        ACT.AREA_DE_ACCION,
        MI.ESTADO,
        ACEPTADO_EN,
        RECHAZADO_EN,
        mi.id_miembro,
      miem.nombre,
      miem.apellido,
      miem.urlfoto	  
      FROM INICIAR.TBL_MIEMBROS_ACTIVIDAD MI
      JOIN INICIAR.TBL_ACTIVIDADES ACT ON ACT.ID = MI.ID_ACTIVIDAD
    join iniciar.tbl_miembros miem on miem.id=mi.id_miembro
      where 1=1 
      and mi.id_actividad=${actividad}
     and mi.estado='${estado}'
    order by act.fecha_actividad
    `,
      );

      if (result === 0)
        throw new NotFoundException(
          'No Se encuantran Registros Miembros Aceptados para esta Actividad',
        );
      return result;
    }
  }
}
