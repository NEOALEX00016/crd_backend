/* eslint-disable prettier/prettier */
import { Injectable, BadRequestException } from '@nestjs/common';

import axios, { AxiosResponse } from 'axios';


import { CursosService } from '../cursos/cursos.service';
import { DetallecursosService } from '../detallecursos/detallecursos.service';
import fetch from 'node-fetch';
import { MiembrosService } from '../miembros/miembros.service';
import { DocumentosactividadService } from '../documentosactividad/documentosactividad.service';
@Injectable()
export class FilesService {
  constructor(
    private readonly repocursos:CursosService,
    private readonly repodetallecurso:DetallecursosService,
    private readonly repofotomiembro:MiembrosService,
    private readonly repoactividades:DocumentosactividadService

  ) {}
  async uploadPortadas(file, id) {


      const curso=await this.repocursos.findOne(id);
      const uuid= curso.uuid;

      
    const urlportadas=`${process.env.URL_PORTADAS}${uuid}/${file.originalname}`
     const url = `${process.env.URL_API_PORTADAS}${uuid}/${file.originalname}`;
      const options = {
        method: 'PUT',
        headers: {
          'content-type': file.mimetype,
          AccessKey: process.env.ARCHIVOS_API_KEY
        },
        body:file.buffer
      };
     const portadadto={
      portada: urlportadas
     }
     
      try {
        const res = await fetch(url, options);
        const json = await res.json();
        await this.repocursos.updateportada(+id,portadadto);
     
        return json;
      } catch (err) {
        console.error('error:' + err);
      }
    
  }

  async uploadPortadasvideo(file, idvideo) {
  const id=idvideo;
  
  const curso=await this.repodetallecurso.findOne(id);

    const uuid=curso.uuid;
    const urlportadas=`${process.env.URL_PORTADAS_VIDEO}${uuid}/${file.originalname}`
    const url = `${process.env.URL_API_PORTADAS_VIDEO}${uuid}/${file.originalname}`;
    const options = {
      method: 'PUT',
      headers: {
        'content-type': file.mimetype,
        AccessKey: process.env.ARCHIVOS_API_KEY
      },
      body:file.buffer
    };
   const portadadto={
    portada: urlportadas
   }

   try {
    const res = await fetch(url, options);
    const json = await res.json();
    
    await this.repodetallecurso.updateportada(+id,portadadto);
 
    return json;
  } catch (err) {
    return err;
  }
    
  }

  async uploadMiembros( file, id) {

    const idmiembro=id;
  
    const miembros=await this.repofotomiembro.findOne(+id);

    const uuid=miembros.uuid;
     const urlmiembros=`${process.env.URL_MIEMBROS}${uuid}/${file.originalname}`
     const url = `${process.env.URL_API_MIEMBROS}${uuid}/${file.originalname}`;
      const options = {
        method: 'PUT',
        headers: {
          'content-type': file.mimetype,
          AccessKey: process.env.ARCHIVOS_API_KEY
        },
        body:file.buffer
      };
     const portadadto={
      urlfoto: urlmiembros
     }
     
      try {
        const res = await fetch(url, options);
        const json = await res.json();
        await this.repofotomiembro.updateurl(+id,portadadto)
     
        return json;
      } catch (err) {
        console.error('error:' + err);
      }
    
  }

  async uploadActividades(file, actividad){
    
   
    const actividadd = await this.repoactividades.findactividad(+actividad);
   
    const uuidd = actividadd.uuid;
     const urldocumentos=`${process.env.URL_ACTIVIDAD}${uuidd}/${file.originalname}`
     const url = `${process.env.URL_API_ACTIVIDADES}${uuidd}/${file.originalname}`;
      const options = {
        method: 'PUT',
        headers: {
          'content-type': file.mimetype,
          AccessKey: process.env.ARCHIVOS_API_KEY
        },
        body:file.buffer
      };
      console.log(urldocumentos);
     const urldocumento={
      url: urldocumentos
     }
     
      try {
        const res = await fetch(url, options);
        const json = await res.json();
        await this.repoactividades.update(+actividad,urldocumento);
     
        return json;
      } catch (err) {
        console.error('error:' + err);
      }
    
  }

  async crearcurso(idcurso): Promise<AxiosResponse> {
    console.log(process.env.VIDEO_API_KEY);
    const headers = {
      AccessKey: process.env.VIDEO_API_KEY,
      accept: 'application/json',
      'content-type': 'application/*+json',
    };
    const curso=await this.repocursos.findOne(idcurso);

    const url = `${process.env.URL_API_CUROS}`;
    console.log(url);
    try {
      const response = await axios.post(
        url,
        { "name": curso.nombre },
        {
          headers,
        },
      );
      
      const res = await response.data;
      if(!res.guid)
      throw new BadRequestException('Error')
      const colection={
        idcolection: res.guid

      }
      await this.repocursos.updateColection(+idcurso,colection)
      console.log(res);
      return res;
    } catch (error) {
      throw error;
    }
  }
  async uploadFilevideo(file,id): Promise<AxiosResponse> {

    const url= `https://video.bunnycdn.com/library/93553/videos/${id}?enabledResolutions={380,720}`
    const options = {
      method: 'PUT',
      headers: {
        'content-type': 'application/json',
        AccessKey: process.env.VIDEO_API_KEY
      },
      body: file.buffer};
      console.log(options)
      try {
        const res = await fetch(url, options);
        const json = await res.json();
      
     
        return json;
      } catch (err) {
        console.error('error:' + err);
      }
    
       
}

async crearFilevideo(file, id){

  const url=process.env.URL_API_VIDEOS;
  const nombre=await this.repodetallecurso.findOne(id);
  const curso = await this.repocursos.findOne(nombre.id_curso);
  const colectionid=curso.idcolection;
    const options = {
    method: 'POST',
    headers: {
      'content-type': 'application/json',
      AccessKey: process.env.VIDEO_API_KEY
    },
    body:JSON.stringify({
      title:`${nombre.titulo}`,
      collectionId:`${colectionid}`
    })};

 
  try {
    // if(nombre.guid.length>0){
    //   await this.deleteFilevideo(nombre.guid);
    // }

    const res = await fetch(url, options);
    const json = await res.json();
    const ids=json.guid;
    await this.uploadFilevideo(file,ids);
    const urlfinal=`${process.env.URL_VIDEOS}${ids}`;
    const urldto ={
      url:`${urlfinal}`,
      guid:`${ids}`
    }  
    console.log(urlfinal);
      await this.repodetallecurso.updateurl(+id,urldto);
      return json;
  
  

  
    
  } catch (err) {
   return err;
  }

   

}


async deleteFilevideo(id){

  const url= `https://video.bunnycdn.com/library/93553/videos/${id}`
  const options = {
    method: 'DELETE',
    headers: {
      'content-type': 'application/json',
      AccessKey: process.env.VIDEO_API_KEY
    },
    };
    console.log(options)
    try {
      const res = await fetch(url, options);
      const json = await res.json();
    
   
      return json;
    } catch (err) {
      console.error('error:' + err);
    }
  
     
}


async uploadinsigniacursos(file, idcurso) {
  const id=idcurso;
  console.log('1');
  
  const curso=await this.repocursos.findOne(+id);
  console.log('2');
  console.log('3');
  

    const uuid=curso.uuid;
    const urlportadas=`${process.env.URL_INSIGNIA}${uuid}/${file.originalname}`
    const url = `${process.env.URL_API_INSIGNIA}${uuid}/${file.originalname}`;
    const options = {
      method: 'PUT',
      headers: {
        'content-type': file.mimetype,
        AccessKey: process.env.ARCHIVOS_API_KEY
      },
      body:file.buffer
    };
   const insignia={
    insignia: urlportadas
   }

   try {
    const res = await fetch(url, options);
    const json = await res.json();
    
    await this.repocursos.updateinsignia(+id,insignia);
 
    return json;
  } catch (err) {
    return err;
  }
    
  }

}