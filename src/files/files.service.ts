/* eslint-disable prettier/prettier */
import { Injectable, BadRequestException } from '@nestjs/common';

import axios, { AxiosResponse } from 'axios';


import { CursosService } from '../cursos/cursos.service';
import { DetallecursosService } from '../detallecursos/detallecursos.service';
import fetch from 'node-fetch';
@Injectable()
export class FilesService {
  constructor(
    private readonly repocursos:CursosService,
    private readonly repodetallecurso:DetallecursosService
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

  async uploadMiembros(miembro, file): Promise<AxiosResponse> {
    const headers = {
      'Content-Type': 'application/octet-stream',
      AccessKey: process.env.ARCHIVOS_API_KEY,
    };
    const buffer = file.buffer;
    const base64 = buffer.toString('base64');
    const data = `data:${file.mimetype};name=${file.originalname};base64,${base64}`;
    const url = `${process.env.URL_API_MIEMBROS}${miembro}/${file.originalname}`;
    try {
      const response = await axios.put(url, data, {
        headers,
      });
      const res = await response.data;
      console.log(res);
      return res;
    } catch (error) {
      throw error;
    }
  }

  async uploadActividades(actividad, file): Promise<AxiosResponse> {
    const headers = {
      'Content-Type': 'application/octet-stream',
      AccessKey: process.env.ARCHIVOS_API_KEY,
    };
    const buffer = file.buffer;
    const base64 = buffer.toString('base64');
    const data = `data:${file.mimetype};name=${file.originalname};base64,${base64}`;
    const url = `${process.env.URL_API_ACTIVIDADES}${actividad}/${file.originalname}`;
    try {
      const response = await axios.put(url, data, {
        headers,
      });
      const res = await response.data;
      console.log(res);
      return res;
    } catch (error) {
      throw error;
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

async crearFilevideo(file, id): Promise<AxiosResponse> {

 

  const url=process.env.URL_API_VIDEOS;
  const nombre=await this.repodetallecurso.findOne(id);

  const curso = await this.repocursos.findOne(nombre.id_curso);

  const colectionid=curso.idcolection;
  


console.log(colectionid);

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
    const res = await fetch(url, options);
    const json = await res.json();
    const ids=json.guid;
    await this.uploadFilevideo(file,ids);
    const urlfinal=`${process.env.URL_VIDEOS}${ids}`;
    const urldto ={
      url:`${urlfinal}`,
      guid:`${ids}`

    }  
    await this.repodetallecurso.updateurl(+id,urldto);
    
    return json;
  } catch (err) {
   return err;
  }

   

}



}