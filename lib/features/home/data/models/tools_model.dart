import 'package:home_app/features/home/domain/entities/tool.dart';

class ToolsModel extends Tool {
  ToolsModel({
    final String title,
    final String toolName,
    final String icon,
    final Properties properties,
  }) : super(
          title: title,
          toolName: toolName,
          icon: icon,
          properties: properties,
        );
}
