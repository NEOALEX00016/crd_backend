import {
  BadRequestException,
  Injectable,
  InternalServerErrorException,
  UnauthorizedException,
} from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { CreateUserDto } from './dto/create-user.dto';
import { User } from './entities/user.entity';
import { Repository } from 'typeorm';

import * as bcrypt from 'bcrypt';
import { LoginUserDto } from './dto/login-user.dto';
import { JwtPayload } from './intefaces/jwt-payload.interface';
import { JwtService } from '@nestjs/jwt';
import { UpdatepassDto } from './dto/update-password.dto';
import { NotFoundException } from '@nestjs/common/exceptions/not-found.exception';

@Injectable()
export class AuthService {
  constructor(
    @InjectRepository(User)
    private readonly userrepository: Repository<User>,
    private readonly jwt: JwtService,
  ) {}

  async create(createuserdto: CreateUserDto) {
    try {
      const { password, ...userdate } = createuserdto;
      const user = this.userrepository.create({
        ...userdate,
        password: bcrypt.hashSync(password, 10),
      });
      await this.userrepository.save(user);
      delete user.password;
      return {
        ...user,
        token: this.getjwt({
          usuario: user.usuario,
          id: user.id,
          id_miembro: user.id_miembro,
          estado: user.estado,
        }),
      };
    } catch (error) {
      this.ErrorDB(error);
    }
  }

  async login(loginuserdto: LoginUserDto) {
    const { password, usuario } = loginuserdto;
    const user = await this.userrepository.findOne({
      where: { usuario },
      select: {
        usuario: true,
        password: true,
        id: true,
        estado: true,
        id_miembro: true,
      },
    });
    if (!user)
      throw new UnauthorizedException('Usuario o Contraseña Invalidos');

    if (!bcrypt.compareSync(password, user.password))
      throw new UnauthorizedException('Usuario o Contraseña Invalidos');
    delete user.password;
    return {
      ...user,
      token: this.getjwt({
        usuario: user.usuario,
        id: user.id,
        id_miembro: user.id_miembro,
        estado: user.estado,
      }),
    };
  }

  async update(id: number, updatepassdto: UpdatepassDto) {
    const user = await this.userrepository.preload({ id, ...updatepassdto });
    //const newpassword: bcrypt.hashSync(password, 10);
    if (!user) throw new NotFoundException('Usuario no Encontrado');

    try {
      user.password = await bcrypt.hashSync(updatepassdto.password, 10);
      await this.userrepository.update(id, user);
      delete user.password;
      return user;
    } catch (error) {
      throw new BadRequestException(`${error}`);
    }
  }

  private ErrorDB(error: any) {
    if (error.code === '23505')
      throw new BadRequestException(
        `Error de de Base de Datos: ${error.code}, detalle:${error.detail} `,
      );
    console.log(error);
    throw new InternalServerErrorException(
      `Error de Base de Datos. Favor Verificar el Servidor`,
    );
  }

  private getjwt(payload: JwtPayload) {
    const token = this.jwt.sign(payload);
    return token;
  }
}
