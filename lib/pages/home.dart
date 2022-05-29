import 'package:bondstein_test/pages/attendance.dart';
import 'package:bondstein_test/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/data_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DataProvider provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<DataProvider>(context, listen: false);
    provider.fetchData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Consumer<DataProvider>(
        builder: (context, value, child) {
          if (provider.loadedData) {
            return NotificationListener<ScrollEndNotification>(
              onNotification: (scrollEnd) {
                final metrics = scrollEnd.metrics;
                if (metrics.atEdge) {
                  bool isTop = metrics.pixels == 0;
                  if (isTop) {
                    print('At the top');
                    if (provider.pageCount == 1) {
                      ShowToast.show('Showing more store', false);
                      provider.pageCount = provider.pageCount + 1;
                      provider.fetchData(context);
                    }
                  } else {
                    print('At the bottom');
                    ShowToast.show('Showing more store', false);
                    provider.pageCount = provider.pageCount + 1;
                    provider.fetchData(context);
                  }
                }
                return true;
              },
              child: ListView.builder(
                  itemCount: provider.storeList!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        leading: Icon(Icons.store),
                        title: Text(provider.storeList![index].name!),
                        subtitle: Text(provider.storeList![index].address!),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AttendancePage()));
                        },
                      ),
                    );
                  }),
            );
          } else {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
