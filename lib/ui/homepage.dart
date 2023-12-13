 import 'package:flutter/material.dart';
import '../utils/app_widgets.dart';
import '../utils/global_styles.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);


  Widget exploreCard(context){
    return  Container(
      height: MediaQuery.of(context).size.height * 0.22,
      width: MediaQuery.of(context).size.width * 0.90,

     // margin: EdgeInsets.only(left: 10,right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.lightBlue,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("My Wallet",style: TextStyle(color: Colors.white,fontSize: 16),),
                Container(
                  height: 30,
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                  decoration: BoxDecoration(
                      color: const Color(0xff64a4e8),
                      borderRadius: BorderRadius.circular(10.0),
                      ),
                  width: 100,
                  child: DropdownButton(
                    padding: EdgeInsets.zero,
                       style: const TextStyle(color: Colors.white,fontSize: 16),
                      dropdownColor: const Color(0xff64a4e8),
                      isExpanded: true,iconEnabledColor:Colors.white ,
                      icon: const Icon(Icons.keyboard_arrow_down_rounded),
                      items: const [
                    DropdownMenuItem(value: "USD",child: Text("USD"),)
                  ], value: "USD",
                      underline: const SizedBox(),
                      onChanged: (val){

                  }),
                )
              ],
            ),
          ),
          const Text("\$8,540.00",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
          AppWidgets.size10h,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:const Color(0xff64a4e8),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: (){}, child: Row(
                    children: [
                      const Icon(Icons.account_balance),
                      AppWidgets.size5w,
                      const Text("Transfer",style: TextStyle(color: Colors.white,fontSize: 12,),),
                    ],
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:const Color(0xff64a4e8),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: (){}, child: Row(
                children: [
                  const Icon(Icons.account_balance_wallet_outlined),
                  AppWidgets.size5w,
                  const Text("Deposit",
                    style: TextStyle(color: Colors.white,fontSize: 12,),

                  ),
                ],
              )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:const Color(0xff64a4e8),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: (){}, child: Row(
                children: [
                  const Icon(Icons.swap_calls_outlined),
                  AppWidgets.size5w,
                  const Text("Swap",style: TextStyle(color: Colors.white,fontSize: 12,),),
                ],
              ))

            ],
          ),
        ],
      ),
    );
  }

  Widget buildCard(context,reData) {
    return Card(
      elevation: 10,
      shape:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white)
      ),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        width: MediaQuery.of(context).size.width * 0.45,
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(reData['icon']??"images/stock1.PNG"),
                    AppWidgets.size5w,
                    Text(reData['title']??"BNB",style: GlobalStyles.headingStyle,),
                  ],
                ),
                Image.asset("images/stock_increment.PNG"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text("+1.37",style: GlobalStyles.stockValueStyle,),
                Text("216.3",style: GlobalStyles.stockValueBlackStyle,),

              ],
            )
          ],
        ),
      ),
    );
  }
  Widget buildMyAssetsCard(context,reData) {
    return Card(
      elevation: 10,
      shape:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white)
      ),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [

                    Image.asset(reData['coin']??"images/bitcoin.png",height: 25),
                    AppWidgets.size5w,
                    Text(reData['coin_name']??"Bit Coin",style: GlobalStyles.headingStyle,),
                  ],
                ),
                headingText(reData['amount']??""),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(reData['growth_img']??"images/stock_decrement.PNG"),
                    Text(reData['growth_per']??"4.5%",style: GlobalStyles.stockPerValueStyle,),
                    Text(reData['growth_amount']??"\$12.5",style: GlobalStyles.greyColorTS,),
                  ],
                ),
                Text(reData['amt_bts']??"0.00000056 BTS",style: GlobalStyles.greyColorTS,)
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget headingText(String title){
    return Text(title,style: GlobalStyles.headingStyle,);

  }

  List recommondedList = [
    {
      "title" : "BNB",
      "icon" : "images/stock1.PNG",
      "inc_dec" : "+1.37",
      "growth" : "216.3",
      "growth_img" : "images/stock_increment.PNG",


    },
    {
      "title" : "ADL",
      "icon" : "images/stock2.PNG",
      "inc_dec" : "+2.73   ",
      "growth" : "0.4975",
      "growth_img" : "images/stock_increment.PNG",
    },
    {
      "title" : "BNB",
      "icon" : "images/stock1.PNG",
      "inc_dec" : "+1.37",
      "growth" : "216.3",
      "growth_img" : "images/stock_increment.PNG",
    },
    {
      "title" : "ADL",
      "icon" : "images/stock2.PNG",
      "inc_dec" : "+2.73   ",
      "growth" : "0.4975",
      "growth_img" : "images/stock_increment.PNG",
    },
    {
      "title" : "BNB",
      "icon" : "images/stock1.PNG",
      "inc_dec" : "+1.37",
      "growth" : "216.3",
      "growth_img" : "images/stock_increment.PNG",
    },
    {
      "title" : "ADL",
      "icon" : "images/stock2.PNG",
      "inc_dec" : "+2.73   ",
      "growth" : "0.4975",
    "growth_img" : "images/stock_decrement.PNG",
    }
  ];
  List coinsList = [
    {
      "coin" : "images/bitcoin.png",
      "coin_name" : "BitCoint",
      "amount" : "\$4,500.00",
      "growth_img" : "images/stock_decrement.PNG",
      "growth_per" : "4.5%",
      "growth_amount" : "\$12.5",
      "amt_bts" : "0.00000056 BTS"
    },
    {
      "coin" : "images/bitcoin.png",
      "coin_name" : "Terras",
      "amount" : "\$4,50.00",
      "growth_img" : "images/stock_increment.PNG",
      "growth_per" : "4.5%",
      "growth_amount" : "\$11.5",
      "amt_bts" : "0.00000076 BTS"
    },
    {
      "coin" : "images/bitcoin.png",
      "coin_name" : "BitCoint",
      "amount" : "\$4,500.00",
      "growth_img" : "images/stock_increment.PNG",
      "growth_per" : "4.5%",
      "growth_amount" : "\$12.5",
      "amt_bts" : "0.00000056 BTS"
    }
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(8.0,12.0,8.0,0),
                    margin:  const EdgeInsets.all(8.0,),
                    decoration: BoxDecoration(
                        color: const Color(0xffd9e4ee),
                        borderRadius: BorderRadius.circular(10.0),
                       ),
                    child: Image.asset("images/profile.png",height: 30),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0,),
                        margin:  const EdgeInsets.all(8.0,),
                        decoration: BoxDecoration(
                         /* color: Color(0xffafd4f3),*/
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Icon(Icons.settings_outlined,color: Colors.blue),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0,),
                        decoration: BoxDecoration(
                          color: const Color(0xffd9e4ee),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Icon(Icons.notifications_none_outlined,color: Colors.blue),
                      ),

                    ],
                  ),
                ],
              ),
             AppWidgets.size15h,
              Center(child: exploreCard(context)),
              AppWidgets.size15h,
              headingText("Recommanded"),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...recommondedList.map((e) =>  buildCard(context,e)),
                  ],
                ),
              ),
              AppWidgets.size15h,
              headingText("My Assets"),
              ...coinsList.map((e) => buildMyAssetsCard(context,e)),

          ],
          ),
        ),
      ),
    );
  }
}
