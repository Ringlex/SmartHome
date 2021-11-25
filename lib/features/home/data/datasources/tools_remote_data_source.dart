import 'dart:convert';

import 'package:dartz/dartz_unsafe.dart';
import 'package:firebase_database/firebase_database.dart';
import '../models/tools_model.dart';
import 'package:http/http.dart' as http;

abstract class ToolsRemoteDataSource {
  Future<List<ToolsModel>> getConcreteTool(String path, String pathTool);

  Future<void> updateTool(String path, String value, String key, String pathTool, String variable);
}

class ToolsRemoteDataSourceImpl implements ToolsRemoteDataSource {
  @override
  Future<List<ToolsModel>> getConcreteTool(String path, String pathTool) async{

    final url = 'https://home-346ef-default-rtdb.firebaseio.com/rooms/$path/$pathTool.json';
    final List<ToolsModel> fetchedList = [];
    try{
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      extractedData.forEach((key, value) { 
        fetchedList.add(
          ToolsModel(
            title : value['title'],
            toolName:  value['toolName'],
            icon:  value['icon'],
          )
        );
      });
      }catch (error){
      throw (error);
    }
    return fetchedList;
    }


  @override
  Future<void> updateTool(String path, String value, String key, String pathTool, String variable) async{
    final url = 'https://home-346ef-default-rtdb.firebaseio.com/rooms/$path/$pathTool/$key.json';
    http.patch(Uri.parse(url), body: json.encode({
      '$variable' : value,
    }));
  }

}