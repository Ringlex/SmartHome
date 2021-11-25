import 'package:home_app/features/home/domain/entities/tool.dart';
import 'package:home_app/features/home/domain/repositories/tool_repository.dart';

class GetTools {
  final ToolRepositories repository;

  GetTools(this.repository);

  Future<List<Tool>> callGet(String path, String pathTool) async {
    return await repository.getTool(path, pathTool);
  }

  Future<void> callUpdate(String path, String value, String key, String pathTool, String variable) async {
    return await repository.updateValue(path, value, key, pathTool, variable);
  }
}
