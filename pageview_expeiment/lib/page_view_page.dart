import 'package:flutter/material.dart';
import 'package:pageview_expeiment/custom_card.dart';

class PageViewPage extends StatefulWidget {
  PageViewPage({Key? key}) : super(key: key);

  PageController pageController = PageController();

  @override
  _PageViewPageState createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  final List<CustomCard> cards = [
    CustomCard(Colors.pink, 1),
    CustomCard(Colors.grey, 2),
    CustomCard(Colors.blueGrey, 3),
    CustomCard(Colors.red, 4),
    CustomCard(Colors.green, 5),
    CustomCard(Colors.lime, 6),
    CustomCard(Colors.yellow, 7),
    CustomCard(Colors.blueAccent, 8),
  ];

  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      title: const Text('Page View Demo'),
      actions: [
        IconButton(
          onPressed: () {
            CustomModal(widget.pageController).showQuestionMenu(context);
          },
          icon: const Icon(Icons.book),
        )
      ],
    );

    return Scaffold(
      appBar: appbar,
      body: Column(
        children: [
          Container(
            height: (MediaQuery.of(context).size.height - appbar.preferredSize.height) * 0.9,
            child: PageView(
              controller: widget.pageController,
              children: cards.toList(),
            ),
          ),
          Container(
            height: (MediaQuery.of(context).size.height - appbar.preferredSize.height) * 0.1,
            color: Colors.indigoAccent,
          )
        ],
      ),
    );
  }
}

class CustomModal extends StatelessWidget {
  int length = 8;

  int currentCard = 0;

  PageController controller = PageController();
  CustomModal(this.controller);

  void showQuestionMenu(BuildContext ctx) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      context: ctx,
      builder: (bCtx) {
        return GestureDetector(
          onTap: () {},
          child: CustomModal(controller),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          height: 300,
          child: GridView.count(
            crossAxisCount: 6,
            children: List<Widget>.generate(length, (index) {
              return Container(
                margin: const EdgeInsets.all(10),
                child: TextButton(
                  onPressed: () {
                    controller.animateToPage(
                      index,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear,
                    );
                    currentCard = index;
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        elevation: 0,
      ),
    );
  }
}
