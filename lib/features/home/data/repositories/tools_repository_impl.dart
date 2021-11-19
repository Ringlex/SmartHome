import 'package:dartz/dartz.dart';
import 'package:home_app/features/home/data/datasources/tools_remote_data_source.dart';
import 'package:home_app/features/home/domain/entities/tool.dart';
import 'package:home_app/features/home/domain/repositories/tool_repository.dart';

class ToolsRepositoryImpl implements ToolRepositories {
  final ToolsRemoteDataSource remoteTools;

  ToolsRepositoryImpl(this.remoteTools);

  

  @override
  Future<Tool> getTool(String path) async{
      // TODO: implement getTool
      
    }
  
    @override
    Future<Tool> updateValue(String path, String value) async{
    // TODO: implement updateValue
    
  }
  
}