import 'package:flutter/material.dart';

import '../views/question_screen.dart';

class ListItem extends StatefulWidget{

  List<Map<String, String>>listItems;
  String headerTitle;

  ListItem(this.headerTitle,this.listItems);

  @override
  State<StatefulWidget>createState()
  {
    return ListItemState();
  }
}
class ListItemState extends State<ListItem>
{
  bool isExpand=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isExpand=false;
  }
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> listItem = this.widget.listItems;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: (isExpand==true)?const EdgeInsets.all(8.0):const EdgeInsets.all(12.0),
        child: Container(
          decoration:BoxDecoration(
            color: Colors.white,
            borderRadius: (isExpand!=true)?BorderRadius.all(Radius.circular(8)):BorderRadius.all(Radius.circular(22)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: ExpansionTile(
            key: PageStorageKey<String>(this.widget.headerTitle),
            title: Container(
                width: double.infinity,
                child: Text(this.widget.headerTitle,style: TextStyle(fontSize: (isExpand!=true)?18:22),)),
            trailing: Transform.rotate(
              angle: (isExpand ? 90 : 0) * 3.14 / 180,
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.black,
              ),
            ),
            leading: const Icon(Icons.check, color: Colors.green, size: 20),
            onExpansionChanged: (value){
              setState(() {
                isExpand=value;
              });
            },
            children: [
              ...listItem.map((item) =>
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => QuestionScreen(textTop: item['chapter'], textBottom: item['question'])));
                    },
                    child: Container(
                        width: double.infinity,
                        decoration:BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 5,
                              offset: Offset(0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(item['chapter']!, style: TextStyle(color: Colors.black87),),
                        )),
                  ),
                )
              )
            ],
          ),
        ),
      )
    );
  }
}