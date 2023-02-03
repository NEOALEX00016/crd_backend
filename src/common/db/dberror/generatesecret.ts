/* eslint-disable prettier/prettier */
import { Injectable } from '@nestjs/common';

@Injectable()
export class KeyService {
  generateRandomKey(length: number): string {
    let key = '';
    const possible = 'abcdefghijklmnopqrstuvwxyz0123456789';

    for (let i = 0; i < length; i++) {
      key += possible.charAt(Math.floor(Math.random() * possible.length));
    }

    return key;
  }
}
