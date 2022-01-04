import 'package:example_app/models/count_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ImagePicker _picker = ImagePicker();
  String? profilePath;

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterModel>(
      builder: (context, counterModel, child) {
        return Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text(widget.title),
          ),
          drawer: Drawer(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                    ),
                    color: Theme.of(context).primaryColor, //Colors.blue,
                  ),
                  child: Text(
                    'Drawer Header',
                    style: TextStyle(
                      color: Theme.of(context)
                          .secondaryHeaderColor, //Colors.white,
                      fontSize: 36,
                    ),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.message),
                  title: Text('Messages'),
                ),
                ListTile(
                  leading: (profilePath == null) //&& kIsWeb
                      ? const Icon(Icons.account_circle)
                      : CircleAvatar(child: Image.network(profilePath!)),
                  title: const Text('Profile'),
                  onTap: () async {
                    final file =
                        await _picker.pickImage(source: ImageSource.gallery);
                    setState(() => {profilePath = file?.path});
                  },
                ),
                const ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
              ],
            ),
          ),
          body: Center(
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.center,
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
                ListTile(
                  onTap: () => Navigator.of(context).pushNamed("api_page"),
                  title: const Text("API Request Test"),
                ),
                if (profilePath != null)
                  // Image.file(File(profilePath!))
                  Image.network(profilePath!)
                else
                  const Center(child: Text("No Profile Set. Go to menu")),
                ElevatedButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed("decrement_page"),
                    child: const Text("Decrement Page")),
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: Container(height: 50.0),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () =>
                {counterModel.setCounter = counterModel.counter + 1},
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        );
      },
    );
  }
}
