//flutter packages pub run build_runner build --delete-conflicting-outputs
import 'package:chopper/chopper.dart';
import 'package:server_demo/constants/StringConstants.dart';

part 'ApiService.chopper.dart';

@ChopperApi(baseUrl: '')
abstract class ApiService extends ChopperService {
//  @Get(headers: {'abc':'cba'})
//  @Get(headers: {'Content-Type':'text/plain'})
//  //OR
//  Future<Response> getPosts(
//      @Header('header-name') String headerValue
//      );
//  @Get()
//  Future<Response> getPosts();
//
//  @Get(path: '{id}')
//  Future<Response> getPost(@Path('id') int id);

  @Get(path: '/user/add/{a}/{b}')
  Future<Response> getSum({@Path('a') String a, @Path('b') String b});

  static ApiService create() {
    final client = ChopperClient(
        baseUrl: apiUrl,
        services: [
          _$ApiService(),
        ],
        converter: JsonConverter());
    return _$ApiService(client);
  }
//query example
//  Future<Response> getPost(@Path('id') int id, @Query('q') String name);

}
