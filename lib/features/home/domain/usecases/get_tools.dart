import 'package:home_app/features/home/domain/entities/tool.dart';
import 'package:home_app/features/home/domain/repositories/tool_repository.dart';

class GetTools {
  final ToolRepositories repository;

  GetTools(this.repository);

  Future<List<Tool>> callGet(String path) async {
    return await repository.getTool(path);
  }

  Future<Tool> callUpdate(String path, String value) async {
    return await repository.updateValue(path, value);
  }
}
