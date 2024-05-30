import 'package:flutter/material.dart';
import 'package:schaffen_app_project/ImageAppBar.dart';
import 'package:schaffen_app_project/TextAppBar.dart';
import 'package:schaffen_app_project/MainBody.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: mediator(),
    );
  }


}

class mediator extends StatefulWidget{
  @override
  State<mediator> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<mediator> {
  bool sheetFlag=false;
  bool iconState=false;
  void changes()
  {
    setState(() {
      iconState;
    });
  }
  AppBar getAB()
  {
    if(iconState) {
      return AppBar(
        leadingWidth: 84,
          leading: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(0, 0, 0, 0.3),
                ),
                child:Icon(Icons.arrow_back_sharp,color:Colors.white),
              ),
              SizedBox(width:10),
              SizedBox(
                width: 50,
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Image.asset("./assets/media.png"),
                ),
              ),
            ],
          ),
          toolbarHeight: 80,
          backgroundColor: Color.fromRGBO(195, 36, 34, 1.0),
          title: const Column(
            children: [
              Text("The weeknd",
                  style: TextStyle(color: Colors.white, fontSize: 24)),
              Text("Community . +11k members",
                  style: TextStyle(color: Colors.white, fontSize: 10)),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    padding: const EdgeInsets.all(1.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(0, 0, 0, 0.3),
                    ),
                    child: Container(
                      child: IconButton(
                        onPressed: (){
                          sheetFlag=true;
                          showModalBottomSheet(
                              showDragHandle: true,
                              context: context, builder: (BuildContext context){
                            return SizedBox(
                              height:180,
                              child:Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: const Column(
                                  children: [
                                    SizedBox(
                                      height: 50,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width:40,
                                          ),
                                          Icon(Icons.link),
                                          Text("   Invite"),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width:40,
                                            ),
                                            Icon(Icons.person),
                                            Text("   Add member"),
                                          ],
                                        ),
                                    ),
                                    SizedBox(
                                      height: 50,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width:40,
                                            ),
                                            Icon(Icons.people),
                                            Text("   Add Group"),
                                          ],
                                        ),
                                    ),
                                    SizedBox(height:30),
                                  ],
                                ),
                              ),
                            );
                          });
                        },
                          icon:Icon(Icons.more_vert,color:Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ]
      );
    }
    else {
      return AppBar(
          toolbarHeight: 80,
          backgroundColor: const Color.fromRGBO(195, 36, 34, 1.0),
          title: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("The weeknd",
                  style: TextStyle(color: Colors.white, fontSize: 24)),
              Text("Community . +11k members",
                  style: TextStyle(color: Colors.white, fontSize: 10)),
            ],
          ),
          actions: [
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

                      child: Icon(Icons.share, color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ]
      );
    }
  }
  static ScrollController controller = ScrollController();
  static bool _isSearchFieldVisible = false;
  ScrollController ncontroller=ScrollController();
  @override
  void initState() {
    super.initState();
    controller.addListener(_scrollListener);
  }
  void _scrollListener()
  {
    if(ncontroller.offset<200&&controller.offset==0)
      {
        iconState=false;
        changes();
      }
    if (controller.offset !=0) {
      setState(() {
        ncontroller.animateTo(230.0, duration: Duration(milliseconds: 100), curve: Curves.ease);
      });
      iconState=true;
      changes();
    }
    else if(controller.offset==0&&ncontroller.offset>=230)
    {
      setState(() {
        ncontroller.animateTo(0.0, duration: Duration(milliseconds: 300), curve: Curves.ease);
      });
      iconState=false;
      changes();
    }
  }
  //Made by Charu Mishra 2024
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      body: NestedScrollView(
        controller: ncontroller,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          return [ImageAppBar()];
        },
        body: Scaffold(
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
        TextSpan(text: ' ...Read more', style: TextStyle(color: Colors.pink[400])),
        ],
        ),
        ),
        SizedBox(height: 10),
    Row(
    children:[
      getButton("Outdoor"),
      getButton("Outdoor"),
      getButton("Outdoor"),
      getButton("+"),
    ],
    ),
    SizedBox(height: 10),
    Row(
    children:[
    Text("Media, Docs, and Links",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
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
    SizedBox(height: 20),
    Row(
    children:[
    Text("Mute notification",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
    Spacer(),
    Icon(Icons.toggle_off,size:50,color:Colors.grey),
    ],
    ),
          SizedBox(height: 20),
    Column(
    children: [
    Row(
    children: [
    Icon(Icons.delete),
    Text("Clear chat",style:TextStyle(fontSize: 20)),
    ],
    ),
      SizedBox(height: 20),
    Row(
    children: [
    Icon(Icons.lock),
    Text("Encryption",style:TextStyle(fontSize: 20)),
    ],
    ),
      SizedBox(height: 20),
    Row(
    children: [
    Icon(Icons.exit_to_app,color:Colors.pink[400]),
    Text("Exit community",style:TextStyle(color:Colors.pink[400],fontSize: 20)),
    ],
    ),
      SizedBox(height: 20),
    Row(
    children: [
    Icon(Icons.thumb_down,color:Colors.pink[400]),
    Text("Report",style:TextStyle(color:Colors.pink[400],fontSize: 20)),
    ],
    ),
    ],
    ),
    SizedBox(height: 10),
    Column(
    children: [
    Row(
    children: [
    Text("Members",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
    Spacer(),
    IconButton(onPressed: (){
    setState(() {
    controller.animateTo(MediaQuery.of(context).size.height-80,curve: Curves.ease,duration: Duration(milliseconds:10));
    _isSearchFieldVisible=true;
    });
    }, icon: Icon(Icons.search,color:Colors.black,size:30))
    ],
    ),
    Column(
    children: [
    if (_isSearchFieldVisible)
    bringSearch(),
    SizedBox(height: 10),
    getProfileRow("Following"),
      getProfileRow("     Add     "),
      getProfileRow("     Add     "),
      getProfileRow("     Add     "),
      getProfileRow("     Add     "),
      getProfileRow("     Add     "),
      getProfileRow("     Add     "),
      getProfileRow("     Add     "),
      getProfileRow("     Add     "),
      getProfileRow("     Add     "),
      getProfileRow("     Add     "),
      getProfileRow("     Add     "),
      getProfileRow("     Add     "),
    ],
    ),
    ],
    ),
    ],
    ),
    ),
    ),
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
          SizedBox(width:15),
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
            style: FilledButton.styleFrom(
              backgroundColor: (s=="Following")?Colors.grey:Colors.pink[400],
            ),
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
      height: 35,
      child: Row(
        children: [
          SizedBox(
            height: 35,
            width: MediaQuery.of(context).size.width-140,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: TextField(
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '      Search Member',
                ),
              ),
            ),

          ),
          SizedBox(
            width: 100,
            child: TextButton(onPressed: (){
              setState(() {
                _isSearchFieldVisible=false;
              });
            }, child: Text("Cancel",style:TextStyle(color:Colors.black,fontSize: 17))
            ),
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
  SizedBox getButton(String s)
  {
    return SizedBox(
      width: (s=="Outdoor")?3.2*MediaQuery.of(context).size.width/13:MediaQuery.of(context).size.width/7,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.pink),
        ),
        child: Text(s,style:TextStyle(color: Colors.pink[400],fontSize: (s=="Outdoor")?13:20))
        ),
    );
  }
}
