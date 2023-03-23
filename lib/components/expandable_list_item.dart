import 'package:flutter/material.dart';

class ExpandableListItem extends StatefulWidget {
  final String title;
  final List<Widget> children;

  ExpandableListItem({required this.title, required this.children});

  @override
  _ExpandableListItemState createState() => _ExpandableListItemState();
}

class _ExpandableListItemState extends State<ExpandableListItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 1.0, color: Colors.grey),
          bottom: BorderSide(width: 1.0, color: Colors.grey),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Transform.rotate(
                  angle: (_isExpanded ? 90 : 0) * 3.14 / 180,
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
              ],
            ),
          ),
          _isExpanded
              ? Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Column(
              children: widget.children,
            ),
          )
              : Container(),
        ],
      )
    );
  }
}