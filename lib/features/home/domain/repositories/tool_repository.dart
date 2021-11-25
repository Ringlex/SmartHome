import 'package:home_app/features/home/domain/entities/tool.dart';

abstract class ToolRepositories {
  Future<List<Tool>> getTool (String path, String pathTool);
  Future<void> updateValue (String path, String value, String key, String pathTool, String variable);
}