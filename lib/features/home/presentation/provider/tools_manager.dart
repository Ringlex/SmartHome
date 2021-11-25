import 'package:flutter/cupertino.dart';
import 'package:home_app/features/home/domain/entities/tool.dart';
import 'package:home_app/features/home/domain/repositories/tool_repository.dart';
import 'package:home_app/features/home/domain/usecases/get_tools.dart';
import 'package:home_app/features/home/presentation/provider/room_tools.dart';

class ToolsManager extends ChangeNotifier {
  GetTools _getTools;
  ToolsManager({@required GetTools getTools}) : _getTools = getTools;

  List<Tool> livingRoomTools = [];
  List<Tool> kitchenTools = [];
  List<Tool> bathroomTools = [];
  List<Tool> bedroomTools = [];
  List<Tool> garageTools = [];

  Future fetchToolsToLists() async {
    
    var result = await _getTools.callGet('livingRoom', 'LivingRoomTools');
    livingRoomTools = result;

    result = await _getTools.callGet('kitchen', 'kitchenTools');
    kitchenTools = result;

    result = await _getTools.callGet('bedroom', 'bedroomTools');
    bedroomTools = result;

    
  }
}
