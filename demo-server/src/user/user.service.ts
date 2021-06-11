import { HttpException, Injectable, InternalServerErrorException } from '@nestjs/common';
import * as admin from 'firebase-admin';

@Injectable()
export class UserService {
    private db = admin.firestore();

    async getOne(id: string) {
        try {
            var result = await this.db.collection("results").doc(id).get();
            if (result.exists) {
                return result.data();
            }
            else return { "error": `Document with id ${id} not found` };
        } catch (error) {
            console.log(error.message);
            throw InternalServerErrorException;
        }

    }

    async add(a: string, b: string) {
        console.log(a,b );
        var result: number = parseInt(a) + parseInt(b);
        await this.db.collection("results").doc().set({ "result": result });
        console.log({ "result": result });
        return { "result": result };
    }

    
    async modify(id: string, value: any) {
        return await this.db.collection("results").doc(id).update(value);
        
    }
}

