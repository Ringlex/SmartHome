// @dart=2.9
import 'package:home_app/features/home/domain/entities/tool.dart';

class ToolsModel extends Tool {
  ToolsModel({
      final int id,
      final String title,
      final String toolName,
      final int icon,
      final int volume,
      final int channel,
      final int brightness,
      final int tmeperature,
      final String coffeMode,
      final String coolingMode,
      final String turboMode,
      final int timer,
      final String washMode,
      final String workMode,
      final int playOn,
      final int washTemerature,
      final int speedEngine,
      final String cleaningMode,
      final int countGrain,
      final int ml,
      final int fanOn,
      final String bakingMode,
      final String meals,
      final String bakingTemp,
  }) : super(
          id: id,
          title: title,
          toolName: toolName,
          icon: icon,
          volume: volume,
          channel: channel,
          brightness: brightness,
          tmeperature: tmeperature,
          coffeMode: coffeMode,
          coolingMode: coolingMode,
          turboMode: turboMode,
          timer: timer,
          washMode: washMode,
          workMode: workMode,
          playOn: playOn,
          washTemerature: washTemerature,
          speedEngine: speedEngine,
          cleaningMode: cleaningMode,
          countGrain: countGrain,
          ml: ml,
          fanOn: fanOn,
          bakingMode: bakingMode,
          meals: meals,
          bakingTemp: bakingTemp,
        );

  factory ToolsModel.fromJson(Map<String, dynamic> json) {
    return ToolsModel(
      id: json['id'],
      title: json['title'],
      toolName: json['toolName'],
      icon: json['icon'],
      volume: json['volume'],
      channel: json['channel'],
      brightness: json['brightness'],
      tmeperature: json['temperature'],
      coffeMode: json['coffeMode'],
      coolingMode: json['coolingMode'],
      turboMode: json['turboMode'],
      timer: json['timer'],
      washMode: json['washMode'],
      workMode: json['workMode'],
      playOn: json['playOn'],
      washTemerature: json['washTemerature'],
      speedEngine: json['speedEngine'],
      cleaningMode: json['cleaningMode'],
      countGrain: json['countGrain'],
      ml: json['ml'],
      fanOn: json['fanOn'],
      bakingMode: json['bakingMode'],
      meals: json['meals'],
      bakingTemp: json['bakingTemp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'toolName': toolName,
      'icon': icon,
    };
  }
}
