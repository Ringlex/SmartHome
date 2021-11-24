import 'package:dartz/dartz_unsafe.dart';
import 'package:firebase_database/firebase_database.dart';
import '../models/tools_model.dart';

abstract class ToolsRemoteDataSource {
  Future<List<ToolsModel>> getConcreteTool(String path);

  Future<ToolsModel> updateTool(String path, String value);
}

class ToolsRemoteDataSourceImpl implements ToolsRemoteDataSource {
  @override
  Future<List<ToolsModel>> getConcreteTool(String path) async{
    final List<ToolsModel> fetchedList = [];
    final ref = FirebaseDatabase.instance.reference().child('rooms').child('bathroom').child('bathroomTools');

    await ref.once().then((data) {
      fetchedList.add(ToolsModel(
        title: data.value['title'],
        toolName: data.value['toolName'],
        icon: data.value['icon'],
      ));
    });
    
      return fetchedList;
    }


  @override
  Future<ToolsModel> updateTool(String path, String value) {
    // TODO: implement updateTool
    
  }

}