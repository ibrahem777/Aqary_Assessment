
import 'package:aqary_assesment/enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../notifiers/page_notifier.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<PageNotifier>(context);
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(onPressed: (){
              provider.changePage(page: PageName.builder, unknown: false);
            },
              child: Text('Builder Battern Flutter'),),
          ),
          Center(
            child: ElevatedButton(onPressed: (){
              provider.changePage(page: PageName.custompaint, unknown: false);
            },
              child: Text('Custom Paint'),),
          ),
          Center(
            child: ElevatedButton(onPressed: (){
              provider.changePage(page: PageName.bouncinglist, unknown: false);
            },
              child: Text('Bouncing List '),),
          ),
          Center(
            child: ElevatedButton(onPressed: (){
              provider.changePage(page: PageName.bloc, unknown: false);
            },
              child: Text('Bloc '),),
          ),

        ],
      ),
    );
  }
}
