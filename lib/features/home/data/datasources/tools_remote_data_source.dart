import 'package:firebase_database/firebase_database.dart';
import '../models/tools_model.dart';

abstract class ToolsRemoteDataSource {
  Future<ToolsModel> getConcreteTool();

  Future<ToolsModel> updateTool();
}

class ToolsRemoteDataSourceImpl implements ToolsRemoteDataSource {
  @override
  Future<ToolsModel> getConcreteTool() {
    // TODO: implement getConcreteTool
    
  }

  @override
  Future<ToolsModel> updateTool() {
    // TODO: implement updateTool
    
  }

}