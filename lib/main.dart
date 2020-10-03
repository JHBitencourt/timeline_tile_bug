import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TimelineListWidget(),
    );
  }
}

class TimelineListWidget extends StatefulWidget {
  @override
  _TimelineListWidgetState createState() => _TimelineListWidgetState();
}

class _TimelineListWidgetState extends State<TimelineListWidget> {
  int _totalLength = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 16.0,
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            primary: false,
            padding: EdgeInsets.zero,
            itemCount: _totalLength,
            itemBuilder: (BuildContext context, int index) {
              return TimelineTile(
                alignment: TimelineAlign.manual,
                lineX: 0.1,
                isFirst: index == 0,
                isLast: index == _totalLength - 1,
                indicatorStyle: IndicatorStyle(
                  indicatorY: 0.25,
                  height: 60,
                  width: 60,
                  indicator: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  drawGap: true,
                ),
                topLineStyle: LineStyle(
                  color: Colors.grey,
                  width: 3,
                ),
                rightChild: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: _getItem(index: index),
                ),
              );
            },
          ),
          Container(
            color: Colors.grey,
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 16.0,
                ),
                border: InputBorder.none,
                hintText: 'Write a comment.....',
                hintStyle: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
                suffixIcon: Container(
                  height: 24,
                  width: 24,
                  margin: EdgeInsets.all(
                    8.0,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.send,
                      color: Colors.grey,
                      size: 16,
                    ),
                  ),
                ),
              ),
              cursorColor: Colors.white,
              autocorrect: false,
              autofocus: false,
              maxLines: 1,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getItem({@required int index}) {
    if (index == 0) {
      return Container(
        color: Colors.blue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: 'Claudia Blake',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(
                          text: ' reviewed ',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: 'Avengers',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(
                      20.0,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 12.0,
                    ),
                    child: Text(
                      '7.8',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '2hrs ago',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 8.0,
                      ),
                      child: Text(
                        '897',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  '9 Comments',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: index == _totalLength - 1 ? 8.0 : 32.0,
            ),
          ],
        ),
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Claudia Blake',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 4.0,
          ),
          Text(
            'Good organizational values, great environment to work in, great people and everything you want from an employer.',
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '2hrs ago',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 8.0,
                    ),
                    child: Text(
                      '897',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                '9 Comments',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: index == _totalLength - 1 ? 8.0 : 32.0,
          ),
        ],
      );
    }
  }
}
