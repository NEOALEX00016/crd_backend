import { PartialType } from '@nestjs/swagger';
import { CreateSubproyectoDto } from './create-subproyecto.dto';

export class UpdateSubproyectoDto extends PartialType(CreateSubproyectoDto) {}
