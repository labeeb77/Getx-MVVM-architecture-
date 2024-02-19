import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:getx_mvvm_pattern/data/app_exceptions.dart';
import 'package:getx_mvvm_pattern/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiServices {

  @override
  Future <dynamic>getApi(String url) async{
   
   dynamic jsonResponse;

   try{
    final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
    jsonResponse = returnResponse(response);
   } on SocketException{
    throw InternetException('');
   } on RequesTimeOut{
    throw RequesTimeOut('');
   }
   return jsonResponse;
  }


@override
  Future <dynamic>postApi(var data, String url) async{
   
   dynamic jsonResponse;

   try{
    final response = await http.post(Uri.parse(url),
    body: data
    ).timeout(const Duration(seconds: 10));
    
    jsonResponse = returnResponse(response);
   } on SocketException{
    throw InternetException('');
   } on RequesTimeOut{
    throw RequesTimeOut('');
   }
   log(jsonResponse.toString());
   return jsonResponse;
  }


dynamic returnResponse(http.Response response){
  switch(response.statusCode){
    case 200:
    dynamic responseJson = jsonDecode(response.body);
    return responseJson;
    case 400:
    dynamic responseJson = jsonDecode(response.body);
    return responseJson;
    default:
    throw FetchDataException('error while fetching data${response.statusCode}' );
  }
}
  
}