import 'package:flutter/material.dart';
import '../models/model_tabs.dart';
import 'homepage.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List<ModelTabs> modelTabsData = [];
  ModelTabs currentTab = ModelTabs();
  void buildTabs(){
    List tabsList = [
      {
        "tname" : "Home",
        "tcode" : "HOME",
      },
      {
        "tname" : "Wallet",
        "tcode" : "WALLET",
      },
      {
        "tname" : "Favorate",
        "tcode" : "FAVORATE",
      },
      {
        "tname" : "Bookmark",
        "tcode" : "BOOKMARK",
      }
    ];
    modelTabsData = tabsList.map((e) =>
        ModelTabs.fromJson(e)
    ).toList();

    currentTab = modelTabsData[0];
    modelTabsData[0].isActive = true;
    currentTab.isActive = true;
    ++updateUi.value;
    /* setState(() {

    });*/

  }
  @override
  void initState() {
    buildTabs();
    super.initState();
  }

  ValueNotifier<int> updateUi = ValueNotifier<int>(0);

  buildUI(){
    if(currentTab.cd=="HOME"){
      return HomeScreen();
    }else if(currentTab.cd=="SEARCH"){
      return HomeScreen();
    }else {
      return HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: updateUi,
        builder: (context,value,child){
          return Scaffold(
            body:buildUI(),
            bottomNavigationBar: Container(
              height: 70,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...modelTabsData.map((e) => buildNavigationItem(e)).toList(),
                ],//buildNavigationItems(),
              ),
            ),
          );
        }
    );
  }

  List<Widget> buildNavigationItems(){
    List<Widget> list = [];
    for (var navigationItem in modelTabsData) {
      list.add(buildNavigationItem(navigationItem));
    }
    return list;
  }

  Widget buildNavigationItem(ModelTabs item){
    return GestureDetector(
        onTap: () {
          for (var element in modelTabsData) {element.isActive = false ;}
          item.isActive = true;
          currentTab = item;
          ++updateUi.value;
        },
        child: item.isActive?Container(
          height: MediaQuery.of(context).size.height * 0.07,
          padding: const EdgeInsets.only(left: 15,right: 15,top: 4,bottom: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),

          ),
          child: Column(
            children: [
              CircleAvatar(backgroundColor: Colors.blue,
                maxRadius: 5,
                child: Container(

              ),

              ),
              Icon(item.iconData,size: 28,color : Colors.blue),
              ],
          ),
        ):Icon(item.iconData,size: 28,color : Colors.grey[400])
    );
  }
}
