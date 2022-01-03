import 'package:example_app/models/count_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DecrementPage extends StatefulWidget {
  const DecrementPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DecrementPage> createState() => _DecrementPageState();
}

class _DecrementPageState extends State<DecrementPage> {
  String? profilePath;

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterModel>(builder: (context, counterModel, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: ListView(
            padding: const EdgeInsets.all(8),
            shrinkWrap: true,
            children: <Widget>[
              Center(
                child: Text(
                  'You have clicked the button this many times:',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              Center(
                child: Text(
                  '${counterModel.counter}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Container(height: 50.0),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {counterModel.setCounter = counterModel.counter - 1},
          tooltip: 'Decrement',
          child: const Icon(Icons.remove),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      );
    });
  }
}
