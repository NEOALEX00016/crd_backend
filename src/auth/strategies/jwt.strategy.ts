/* eslint-disable prettier/prettier */
import { PassportStrategy } from '@nestjs/passport';
import { InjectRepository } from '@nestjs/typeorm';
import { ExtractJwt, Strategy } from 'passport-jwt';
import { User } from '../entities/user.entity';
import { JwtPayload } from '../intefaces/jwt-payload.interface';
import { Repository } from 'typeorm';
import { UnauthorizedException } from '@nestjs/common/exceptions/unauthorized.exception';
import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';





@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy) {

  constructor(
    @InjectRepository(User)
    private readonly userrepo:Repository<User>,

    configService: ConfigService,
  ){
 
    super({
      
      
      secretOrKey:configService.get('JWT_SECRET'),
      jwtFromRequest:ExtractJwt.fromAuthHeaderAsBearerToken(),


    });
  }
  async validate(payload: JwtPayload): Promise<User> {

    const{usuario}=payload;


    const user = await this.userrepo.findOneBy({ usuario:usuario });
    if (!user)
    throw new  UnauthorizedException('Token Invalido')
    if (user.estado ==='Inactivo')
    throw new  UnauthorizedException('Usuario Inactivo')


    return user; 
  }
}
