import 'package:home_app/features/home/data/datasources/tools_remote_data_source.dart';
import 'package:home_app/features/home/domain/entities/tool.dart';
import 'package:home_app/features/home/domain/repositories/tool_repository.dart';

class ToolsRepositoryImpl implements ToolRepositories {
  final ToolsRemoteDataSource toolsRemoteDataSource;

  ToolsRepositoryImpl(this.toolsRemoteDataSource,);

  

  @override
  Future<List<Tool>> getTool(String path, String pathTool) async{
      return await toolsRemoteDataSource.getConcreteTool(path, pathTool);
      
    }
  
    @override
    Future<void> updateValue(String path, var value, String key, String pathTool, String variable) async{
      return toolsRemoteDataSource.updateTool(path, value, key, pathTool, variable);
    
  }
  
}