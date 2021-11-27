import 'package:home_app/features/home/domain/entities/tool.dart';
import 'package:home_app/features/home/domain/repositories/tool_repository.dart';

class GetTools {
  final ToolRepositories toolRepositories;

  GetTools(this.toolRepositories);

  Future<List<Tool>> callGet(String path, String pathTool) async {
    return toolRepositories.getTool(path, pathTool);
  }

  Future<void> callUpdate(String path, String value, String key,
      String pathTool, String variable) async {
    return await toolRepositories.updateValue(
        path, value, key, pathTool, variable);
  }
}
