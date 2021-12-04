import 'package:equatable/equatable.dart';

class Tool extends Equatable {
  final int id;
  final String title;
  final String toolName;
  final int icon;
  final int volume;
  final int channel;
  final int brightness;
   int tmeperature;
  final String coffeMode;
  final String coolingMode;
  final String turboMode;
  final int timer;
  final String washMode;
  final String workMode;
  final int playOn;
  final int washTemerature;
  final int speedEngine;
  final String cleaningMode;
  final int countGrain;
  final int ml;
  final int fanOn;
  final String bakingMode;
  final String meals;
  final String bakingTemp;

  Tool({
    this.id,
    this.title,
    this.toolName,
    this.icon,
    this.volume,
    this.channel,
    this.brightness,
    this.tmeperature,
    this.coffeMode,
    this.coolingMode,
    this.turboMode,
    this.timer,
    this.washMode,
    this.workMode,
    this.playOn,
    this.washTemerature,
    this.speedEngine,
    this.cleaningMode,
    this.countGrain,
    this.ml,
    this.fanOn,
    this.bakingMode,
    this.meals,
    this.bakingTemp,
  });


  @override
  List<Object> get props => [
        id,
        title,
        toolName,
        icon,
        volume,
        channel,
        brightness,
        tmeperature,
        coffeMode,
        coolingMode,
        turboMode,
        timer,
        washMode,
        workMode,
        playOn,
        washTemerature,
        speedEngine,
        cleaningMode,
        countGrain,
        ml,
        fanOn,
        bakingMode,
        meals,
        bakingTemp,
      ];
}
