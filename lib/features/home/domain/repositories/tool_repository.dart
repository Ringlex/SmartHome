import 'package:home_app/features/home/domain/entities/tool.dart';

abstract class ToolRepositories {
  Future<List<Tool>> getTool (String path);
  Future<Tool> updateValue (String path, String value);
}