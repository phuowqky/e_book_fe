import 'package:app_bong_da/core/network/api_response.dart';
import 'package:app_bong_da/data/models/login_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  @POST("api/auth/login")
  Future<ApiResponse<LoginModel>> login(@Body() User user);
}
