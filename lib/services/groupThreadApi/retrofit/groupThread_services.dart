import 'package:dio/dio.dart';
import 'package:flutter_frontend/model/group_thread_list.dart';
import 'package:retrofit/http.dart';

part 'groupThread_services.g.dart';


@RestApi(baseUrl: 'http://localhost:8001')
abstract class GroupThreadServices{
  factory GroupThreadServices(Dio dio) => _GroupThreadServices(dio);

  @GET('/t_group_messages/{id}')
  Future<GroupThreadMessage> getAllThread(
    @Path("id") int id, @Query("s_channel_id") int channelId,@Header('Authorization') String token
  );

  @POST("/groupthreadmsg")
  Future<void> sendGroupThreadData(
    @Body() Map<String, dynamic> requestBody,@Header('Authorization') String token
  );
}
