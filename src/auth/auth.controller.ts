import { Controller, Post, Body, Get } from '@nestjs/common';
import { UseGuards } from '@nestjs/common/decorators';
import { Req } from '@nestjs/common/decorators/http/route-params.decorator';
import { AuthGuard } from '@nestjs/passport';
import { AuthService } from './auth.service';
import { GetUser } from './decorators/get -user.decorator';
import { GetRawHeader } from './decorators/raw-header.decorator';
import { CreateUserDto } from './dto/create-user.dto';
import { LoginUserDto } from './dto/login-user.dto';
import { User } from './entities/user.entity';

@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Post('registrar')
  createUser(@Body() createuserdto: CreateUserDto) {
    return this.authService.create(createuserdto);
  }

  @Post('login')
  loginUser(@Body() loginuserdto: LoginUserDto) {
    return this.authService.login(loginuserdto);
  }
  @Get('private')
  @UseGuards(AuthGuard())
  testingprivateroutes(
    @GetRawHeader() req: Express.Request,
    @GetUser() user: User,
    @GetUser('usuario') usuario: User,
  ) {
    console.log(req);
    return { ok: true, mensaje: 'hola', usuario, req };
  }
}
