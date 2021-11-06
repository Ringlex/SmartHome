import 'package:flutter/material.dart';

/// Screen to add tool for given room 
///
class AddToolSreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D1117),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints contraints) {
        return Padding(
          padding: const EdgeInsets.only(
            left: 15.0,
            right: 15.0,
            top: 24.0,
          ),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          //TODO: Add possibility to come back from this page -> HomeScreen
                          Navigator.pop(context);
                        },
                        child: Container(
                          child: Center(
                              child: Icon(
                            Icons.chevron_left,
                            color: Color(0xFF58A6FF),
                            size: 40,
                          )),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Add tool',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  textField('Title'),
                  textField('Name of device'),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget textField(String label) {
    return Container(child: TextFormField());
  }
}
