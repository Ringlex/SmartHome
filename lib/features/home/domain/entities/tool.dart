

import 'package:equatable/equatable.dart';

class Tool extends Equatable {
  final String title;
  final String toolName;
  final String icon;
  final Properties properties;

  Tool({ this.title, this.toolName, this.properties, this.icon});

  @override
  
  List<Object> get props => [title, toolName, properties, icon];
}

class Properties {
  int volume;
  int channel;
  int brightness;
  int tmeperature;
  String coffeMode;
  String coolingMode;
  String turboMode;
  int timer;
  String washMode;
  String workMode;
  String playOn;
  int washTemerature;
  int speedEngine;
  String cleaningMode;
  int countGrain;
  int ml;
  int fanOn;
  String bakingMode;
  String meals;
  String bakingTemp;    
}