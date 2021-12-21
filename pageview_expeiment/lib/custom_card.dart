import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  Color color;
  int index;
  CustomCard(this.color, this.index);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  var groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.6,
      padding: EdgeInsets.all(10),
      child: Card(
        color: widget.color,
        elevation: 6,
        child: Column(
          children: [
            ListTile(
              leading: Radio(
                value: 0,
                groupValue: groupValue,
                onChanged: (int? val) {
                  setState(() {
                    groupValue = val!;
                  });
                },
              ),
              title: const Text('Option 1'),
            ),
            ListTile(
              leading: Radio(
                value: 1,
                groupValue: groupValue,
                onChanged: (int? val) {
                  setState(() {
                    groupValue = val!;
                  });
                },
              ),
              title: const Text('Option 2'),
            ),
            ListTile(
              leading: Radio(
                value: 2,
                groupValue: groupValue,
                onChanged: (int? val) {
                  setState(() {
                    groupValue = val!;
                  });
                },
              ),
              title: const Text('Option 3'),
            ),
            ListTile(
              leading: Radio(
                value: 3,
                groupValue: groupValue,
                onChanged: (int? val) {
                  setState(() {
                    groupValue = val!;
                  });
                },
              ),
              title: const Text('Option 4'),
            ),
          ],
        ),
      ),
    );
  }
}
