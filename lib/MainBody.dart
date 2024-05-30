import 'package:flutter/material.dart';
import 'package:schaffen_app_project/TextAppBar.dart';
import 'main.dart';
import 'TextAppBar.dart';

class MainBody extends StatefulWidget
{
  @override
  State<MainBody> createState() => MainBody2();

}

class MainBody2 extends State<MainBody>
{
  static bool iconState=false;
  void changes()
  {
    setState(() {
      iconState;
    });
  }
  static AppBar getAB()
  {
    if(iconState)
    return AppBar(
      leading: Icon(Icons.arrow_back_sharp),
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
    else
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
  ScrollController controller = ScrollController();
  static bool _isSearchFieldVisible = false;
  @override
  void initState() {
    super.initState();
    controller.addListener(_scrollListener);
  }
  void _scrollListener()
  {
    if (controller.offset !=0) {
        iconState=true;
        changes();
    } else
    {
      iconState=false;
      changes();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAB(),
      body: SingleChildScrollView(
      controller: controller,
      child:Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          RichText(
          text: TextSpan(
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod vestibulum lacus, nec consequat nulla efficitur sit amet. Proin eu lorem libero. Sed id enim in urna tincidunt sodales. Vivamus vel semper ame",
            style: TextStyle(color: Colors.black, fontSize: 20),
            children: <TextSpan>[
              TextSpan(text: ' ...Read more', style: TextStyle(color: Colors.pink)),
            ],
          ),
        ),
          SizedBox(height: 10),
          Wrap(
            spacing: 10,
            children:[
              OutlinedButton(onPressed: (){}, child: Text("Outdoor")),
              OutlinedButton(onPressed: (){}, child: Text("Outdoor")),
              OutlinedButton(onPressed: (){}, child: Text("+1")),],
          ),
          SizedBox(height: 10),
          Row(
            children:[
              Text("Media, Docs, and Links",style:TextStyle(fontSize: 20)),
              Spacer(),
              Icon(Icons.arrow_forward),
            ],
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 140,
            child:ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                getImage(),
                SizedBox(width: 10),
                getImage(),
                SizedBox(width: 10),
                getImage(),
                SizedBox(width: 10),
                getImage(),
                SizedBox(width: 10),
                getImage(),
                SizedBox(width: 10),
                getImage(),
              ],
            ),),
          SizedBox(height: 10),
          Row(
            children:[
              Text("Mute notification"),
              Spacer(),
              Icon(Icons.toggle_off),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Icon(Icons.delete),
                  Text("Clear chat"),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.lock),
                  Text("Encryption"),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.exit_to_app,color:Colors.pink),
                  Text("Exit community",style:TextStyle(color:Colors.pink)),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.thumb_down,color:Colors.pink),
                  Text("Report",style:TextStyle(color:Colors.pink)),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Column(
          children: [
          Row(
          children: [
          Text("Members"),
          Spacer(),
          IconButton(onPressed: (){
            setState(() {
              _isSearchFieldVisible=true;
            });
          }, icon: Icon(Icons.search))
          ],
          ),
      Column(
              children: [
                if (_isSearchFieldVisible)
                  bringSearch(),
                SizedBox(height: 10),
                getProfileRow("Following"),
                getProfileRow("Add"),
                getProfileRow("Add"),
                getProfileRow("Add"),
                getProfileRow("Add"),
                getProfileRow("Add"),
                getProfileRow("Add"),
                getProfileRow("Add"),
                getProfileRow("Add"),
                getProfileRow("Add"),
                getProfileRow("Add"),
                getProfileRow("Add"),
                getProfileRow("Add"),
              ],
            ),
    ],
    ),
        ],
      ),
      ),
      ),
    );
  }
  SizedBox getProfileRow(String s)
  {
    return SizedBox(
      height: 50,
      child:Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(200.0),
          child:Image.asset("./assets/pfp.png"),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Yashika"),
            Text("29, India"),
          ],
        ),
        Spacer(),
        FilledButton(
          onPressed: (){},
          child: Text(s),
        )
      ],
      ),
    );
  }
  SizedBox bringSearch()
  {
    return SizedBox(
        height: 50,
        child: Row(
        children: [
          SizedBox(
            height: 50,
          width: MediaQuery.of(context).size.width-140,
          child: TextField(
            style: TextStyle(fontSize: 10),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Search Member',
            ),
          ),
    ),
          SizedBox(
            width: 100,
            child: TextButton(onPressed: (){
              setState(() {
                _isSearchFieldVisible=false;
              });
            }, child: Text("Cancel")),
          ),

        ],
        ),
    );
  }
  ClipRRect getImage()
  {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.asset("./assets/media.png"),
    );
  }
}
