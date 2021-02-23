import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_test/view/view_model.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stacked test'),
        ),
        body: ViewModelBuilder<ViewModel>.reactive(
          viewModelBuilder: () => ViewModel('get users'),
          onModelReady: (model) {
            model.loadScreen();
          },
          builder: (context, model, _) => Center(
            child: model.isBusy
                ? CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: model.busy(model.users)
                        ? [
                            FlatButton.icon(
                              color: Theme.of(context).primaryColor,
                              label: Text(model.text),
                              icon: Icon(Icons.refresh),
                              onPressed: () {
                                model.getUsers();
                              },
                              onLongPress: () {
                                print(model.isBusy);
                              },
                            )
                          ]
                        : List.generate(model.users.length,
                            (index) => Text(model.users[index])),
                  ),
          ),
        ),
      ),
    );
  }
}
