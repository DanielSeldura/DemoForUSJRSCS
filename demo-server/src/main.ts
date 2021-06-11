import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import * as admin from 'firebase-admin';
const SERVICE_CREDENTIALS = require('../credential.json');
async function bootstrap() {
  admin.initializeApp({
  credential: admin.credential.cert(SERVICE_CREDENTIALS),
});

  const app = await NestFactory.create(AppModule);
  await app.listen(3000);
}
bootstrap();
