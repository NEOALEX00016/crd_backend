import { PartialType } from '@nestjs/swagger';
import { CreateDetalleroleDto } from './create-detallerole.dto';

export class UpdateDetalleroleDto extends PartialType(CreateDetalleroleDto) {}
