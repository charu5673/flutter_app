import 'package:flutter/material.dart';
import 'MainBody.dart';
class TextAppBar extends StatefulWidget {
  @override
  State<TextAppBar> createState() => TextAppBar2();
}
class TextAppBar2 extends State<TextAppBar>
{
  @override
  Widget build(BuildContext context) {
    return getAB();
  }
  static AppBar getAB()
  {
    return AppBar(
        toolbarHeight: 80,
        backgroundColor: Color.fromRGBO(195, 36, 34, 1.0),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Text("The weeknd",style:TextStyle(color:Colors.white,fontSize: 24)),
            Text("Community . +11k members",style:TextStyle(color:Colors.white,fontSize: 10)),
          ],
        ),
        actions:[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.white)
                  ),
                  child: Container(

                    child:Icon(Icons.share,color:Colors.white),
                  ),
                ),
              ),
            ],
          )
        ]
    );
  }
  static AppBar getAB2()
  {
    return AppBar(
        toolbarHeight: 80,
        backgroundColor: Color.fromRGBO(195, 36, 34, 1.0),
        leading: Icon(Icons.arrow_back_sharp),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Text("The weeknd",style:TextStyle(color:Colors.white,fontSize: 24)),
            Text("Community . +11k members",style:TextStyle(color:Colors.white,fontSize: 10)),
          ],
        ),
        actions:[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.white)
                  ),
                  child: Container(

                    child:Icon(Icons.share,color:Colors.white),
                  ),
                ),
              ),
            ],
          )
        ]
    );
  }
}