import 'package:home_app/features/home/data/datasources/tools_remote_data_source.dart';
import 'package:home_app/features/home/domain/entities/tool.dart';
import 'package:home_app/features/home/domain/repositories/tool_repository.dart';

class ToolsRepositoryImpl implements ToolRepositories {
  final ToolsRemoteDataSource remoteTools;

  ToolsRepositoryImpl(this.remoteTools,);

  

  @override
  Future<List<Tool>> getTool(String path, String pathTool) async{
      return remoteTools.getConcreteTool(path, pathTool);
      
    }
  
    @override
    Future<void> updateValue(String path, String value, String key, String pathTool, String variable) async{
      return remoteTools.updateTool(path, value, key, pathTool, variable);
    
  }
  
}