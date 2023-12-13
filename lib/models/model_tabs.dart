import 'package:flutter/material.dart';

class ModelTabs{
  String? tName;
  String? cd;
  IconData? iconData;
  bool isActive = false;
  ModelTabs();
  factory ModelTabs.fromJson(Map<String,dynamic> jsonData){
    ModelTabs mt= ModelTabs();
    mt.tName = jsonData['tname'];
    mt.cd = jsonData['tcode'];

    if(mt.cd=="HOME"){
      mt.iconData = Icons.home_outlined;

    }
    else if(mt.cd=="FAVORATE"){
      mt.iconData = Icons.favorite_border_outlined;
    }
    else if(mt.cd=="WALLET"){
      mt.iconData = Icons.account_balance_wallet_outlined;
    }
    else if(mt.cd=="BOOKMARK"){
      mt.iconData = Icons.bookmark_border_outlined;
    }
    return mt;
  }

}



