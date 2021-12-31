import 'package:example_app/models/api_fetch.dart';
import 'package:flutter/material.dart';

class ApiScreen extends StatelessWidget {
  const ApiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Screen"),
      ),
      body: FutureBuilder(
        future: fetchApiData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            RowDataList rows = snapshot.data as RowDataList;
            return ListView.builder(
              itemCount: rows.rowDataList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    rows.rowDataList[index].reviewerName ?? "",
                  ),
                  subtitle: Text(
                    rows.rowDataList[index].summary ?? "",
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
