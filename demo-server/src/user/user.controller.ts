import { Body, Controller, Get, Param, Put } from '@nestjs/common';
import { UserService } from './user.service';

@Controller('user')
export class UserController {

    constructor(private readonly userService: UserService){}

    @Get("/get-one/:id")
    async getOne(@Param('id') id:string) {
      return this.userService.getOne(id);
    }

    @Get("/add/:a/:b")
    async arithmetic(@Param('a') a:string,@Param('b') b:string ) {
      return await this.userService.add(a,b);
    }


    @Put("/modify/:id")
    async modify(@Param('id') id:string,@Body() value:any ) {
      return await this.userService.modify(id, value);
    }

}
