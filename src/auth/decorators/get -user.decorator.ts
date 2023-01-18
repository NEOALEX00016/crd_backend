/* eslint-disable prettier/prettier */
import { ExecutionContext, InternalServerErrorException } from '@nestjs/common';
import { createParamDecorator } from '@nestjs/common/decorators/http/create-route-param-metadata.decorator';


export const GetUser = createParamDecorator((data,ctx: ExecutionContext) => {



  const req=ctx.switchToHttp().getRequest();

  const user=req.user;
  if(!user)
  throw new InternalServerErrorException('Error de Servidor Favor Verificar')


  return (!data)? user: user[data]
});
