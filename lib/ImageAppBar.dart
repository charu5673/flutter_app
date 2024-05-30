import 'package:flutter/material.dart';

class ImageAppBar extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      titleSpacing:0.0,
      toolbarHeight: 150,
      flexibleSpace: Image.asset("assets/title.png",fit:BoxFit.fill),
      leading:Container(
        padding: const EdgeInsets.only(top: 8.0, left: 8.0),
        alignment: Alignment.topLeft,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromRGBO(0, 0, 0, 0.3),
          ),
          child:Icon(Icons.arrow_back_sharp,color:Colors.white),
        ),

      ),
      elevation: 10.0,
      automaticallyImplyLeading: false,
      expandedHeight:50,
      floating: true,
    );
  }
}