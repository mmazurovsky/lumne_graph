import 'package:flutter/material.dart';

import '../data/graph_data.dart';
import '../painters/my_painter.dart';

class GraphPage extends StatefulWidget {
  const GraphPage({
    Key? key,
  }) : super(key: key);

  @override
  State<GraphPage> createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  final List<Offset> _pointList = [];
  final List<CustomPaint> _painters = [];
  double maxY = 0;
  late double _greyContainerSize;

  @override
  void initState() {
    super.initState();
    //*INFO: getting the maximum value of y in our data list
    for (int i = 0; i < (graphData.length); i++) {
      if (graphData[i].abs() > maxY) {
        maxY = graphData[i];
      }
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    //*INFO: getting the container size according to the device display width
    _greyContainerSize = MediaQuery.of(context).size.width;
    final greyContainerHalfSize = _greyContainerSize / 2;

    //*INFO: calculating the points(offsets) with the normalized y value so that
    //* the graph stays in grey container boundaries
    double x = 0;
    for (int i = 0; i < (graphData.length); i++) {
      final y = graphData[i] * (-1);

      final normalizedY = y / maxY * greyContainerHalfSize;

      final point = Offset(x, normalizedY);
      x += 2;

      _pointList.add(point);
    }

    //*INFO: creation of a list of lines to be drawn in the grey container
    for (int i = 0; i < _pointList.length - 1; i++) {
      final point1 = _pointList[i];
      final point2 = _pointList[i + 1];
      final painter = CustomPaint(
        painter: MyPainter(
          point1: point1,
          point2: point2,
        ),
      );
      _painters.add(painter);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: _greyContainerSize,
            height: _greyContainerSize,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
            ),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                //*INFO: a horizontal line (X axis) in the center of the grey container
                CustomPaint(
                  painter: MyPainter(
                    point1: const Offset(0, 0),
                    point2: Offset(MediaQuery.of(context).size.width, 0),
                    colorOfTheLine: Colors.red,
                  ),
                ),
                Row(
                  children: _painters,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
