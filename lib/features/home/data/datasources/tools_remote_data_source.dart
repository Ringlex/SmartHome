import 'dart:convert';

import '../models/tools_model.dart';
import 'package:http/http.dart' as http;

abstract class ToolsRemoteDataSource {
  Future<List<ToolsModel>> getConcreteTool(String path, String pathTool);

  Future<void> updateTool(
      String path, String value, String key, String pathTool, String variable);
}

class ToolsRemoteDataSourceImpl implements ToolsRemoteDataSource {
  final http.Client client;

  ToolsRemoteDataSourceImpl(this.client);
  @override
  Future<List<ToolsModel>> getConcreteTool(String path, String pathTool) async {
    final url =
        'https://home-346ef-default-rtdb.firebaseio.com/rooms/$path/$pathTool.json';
    List<ToolsModel> fetchedList = [];
    final response = await client.get(Uri.parse(url));

    List body = json.decode(response.body);

    return fetchedList = body.map((tool) => ToolsModel.fromJson(tool)).toList();
  }

  @override
  Future<void> updateTool(String path, String value, String key,
      String pathTool, String variable) async {
    final url =
        'https://home-346ef-default-rtdb.firebaseio.com/rooms/$path/$pathTool/$key.json';
    http.patch(Uri.parse(url),
        body: json.encode({
          '$variable': value,
        }));
  }
}
