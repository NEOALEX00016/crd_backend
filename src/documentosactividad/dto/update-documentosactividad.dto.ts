import { PartialType } from '@nestjs/swagger';
import { CreateDocumentosactividadDto } from './create-documentosactividad.dto';

export class UpdateDocumentosactividadDto extends PartialType(CreateDocumentosactividadDto) {}
