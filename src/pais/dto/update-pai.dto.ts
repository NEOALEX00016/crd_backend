import { PartialType } from '@nestjs/swagger';
import { CreatePaisDto } from './create-pai.dto';

export class UpdatePaisDto extends PartialType(CreatePaisDto) {}
