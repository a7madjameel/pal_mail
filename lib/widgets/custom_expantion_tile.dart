import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile({super.key, required this.title,  this.count, required this.child});
  final String title ;
  final String? count;
  final Widget child ;
  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool _customExpandedTile = false ;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data:  ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(

        title:  Text(widget.title),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.count!),
            IconButton(
              onPressed: () {
                setState(() {
                });
              },
              icon: Icon(_customExpandedTile
                  ? Icons.arrow_forward_ios_outlined
                  : Icons.keyboard_arrow_up),
              color: _customExpandedTile
                  ? Colors.blue
                  : Colors.grey.shade400,
            ),
          ],
        ),
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
                margin: const EdgeInsets.only(bottom: 15),

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                child: widget.child),
          ),
        ],
        onExpansionChanged: (value) {
          setState(() {
            _customExpandedTile = value;
          });
        },
      ),
    );
  }
}