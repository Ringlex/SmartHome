import 'package:flutter/cupertino.dart';
import 'package:home_app/features/home/domain/entities/tool.dart';
import 'package:home_app/features/home/domain/usecases/get_tools.dart';

class ToolsManager extends ChangeNotifier {
  GetTools _getTools;
  ToolsManager({@required GetTools getTools}) : _getTools = getTools;

  List<Tool> livingRoomTools = [];
  List<Tool> kitchenTools = [];
  List<Tool> bathroomTools = [];
  List<Tool> bedroomTools = [];
  List<Tool> garageTools = [];

  Future<List<Tool>> getList(String path, String pathTool) async {
    List<Tool> _tools = [];
    _tools = await _getTools.callGet(path, pathTool);
    return _tools;
    //notifyListeners();
  }

  Future<void> fetchToolsToLists() async {
    livingRoomTools = await getList('livingRoom', 'livingRoomTools');
    kitchenTools = await getList('kitchen', 'kitchenTools');
    bathroomTools = await getList('bathroom', 'bathroomTools');
    bedroomTools = await getList('bedroom', 'bedroomTools');
    garageTools = await getList('garage', 'garageTools');

    print(livingRoomTools);
    print(garageTools);
    print(bedroomTools);
    print(kitchenTools);
    notifyListeners();
  }

  
}
