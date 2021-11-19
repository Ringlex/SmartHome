import 'package:home_app/features/home/domain/entities/tool.dart';
import 'package:home_app/features/home/domain/repositories/tool_repository.dart';

class GetTools {
  final ToolRepositories repository;

  GetTools(this.repository);

  Future<Tool> call(String path) async {
    return await repository.getTool(path);
  }
}