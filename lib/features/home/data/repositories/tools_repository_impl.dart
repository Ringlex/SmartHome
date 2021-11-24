import 'package:home_app/features/home/data/datasources/tools_remote_data_source.dart';
import 'package:home_app/features/home/domain/entities/tool.dart';
import 'package:home_app/features/home/domain/repositories/tool_repository.dart';

class ToolsRepositoryImpl implements ToolRepositories {
  final ToolsRemoteDataSource remoteTools;

  ToolsRepositoryImpl(this.remoteTools,);

  

  @override
  Future<List<Tool>> getTool(String path) async{
      return remoteTools.getConcreteTool(path);
      
    }
  
    @override
    Future<Tool> updateValue(String path, String value) async{
      return remoteTools.updateTool(path, value);
    
  }
  
}