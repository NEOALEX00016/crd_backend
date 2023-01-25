import { Controller, Post, Body, Get } from '@nestjs/common';
import { Param, Patch, UseGuards } from '@nestjs/common/decorators';
import { AuthGuard } from '@nestjs/passport';
import { AuthService } from './auth.service';
import { GetUser } from './decorators/get -user.decorator';
import { GetRawHeader } from './decorators/raw-header.decorator';
import { CreateUserDto } from './dto/create-user.dto';
import { LoginUserDto } from './dto/login-user.dto';
import { UpdatepassDto } from './dto/update-password.dto';
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

  @Patch('cambiar/:id')
  @UseGuards(AuthGuard())
  updatePass(@Param('id') id: number, @Body() updatepassdto: UpdatepassDto) {
    return this.authService.update(id, updatepassdto);
  }
}
