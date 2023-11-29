import 'package:flutter/material.dart';
import 'package:widgets/src/bottom_navigation/bottom_navigation_item.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({
    required this.onChange,
    required this.selectedIndex,
    required this.items,
    super.key,
  })  : assert(items.length >= 2),
        assert(items.length <= 5);
  final void Function(int) onChange;
  final int selectedIndex;
  final List<BottomNavigationItem> items;

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 98,
      width: MediaQuery.sizeOf(context).width,
      child: CustomPaint(
        size: Size(MediaQuery.sizeOf(context).width, 98),
        painter: BottomNavigationPainter(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ..._buildNavItems(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildNavItems() {
    List<Widget> buildNavItems = [];
    for (var i = 0; i < widget.items.length; i++) {
      buildNavItems.add(
        Expanded(
          child: GestureDetector(
            onTap: () => widget.onChange(i),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                widget.items[i].icon,
                Text(
                  widget.items[i].title,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: widget.selectedIndex == i ? const Color(0xff0055D3) : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      if (i + 1 < widget.items.length) {
        buildNavItems.add(
          Container(
            height: 24,
            width: 2,
            color: const Color(0XFFD1D1D6),
          ),
        );
      }
    }
    return buildNavItems;
  }
}

class BottomNavigationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    path.moveTo(size.width * 0.07739947, size.height * 0.005102041);
    path.lineTo(size.width * 0.9232187, size.height * 0.005102041);
    path.cubicTo(size.width * 0.9436213, size.height * 0.005102041, size.width * 0.9609733, size.height * 0.06206888,
        size.width * 0.9640720, size.height * 0.1392347);
    path.lineTo(size.width * 0.9984453, size.height * 0.9948980);
    path.lineTo(size.width * 0.001558173, size.height * 0.9948980);
    path.lineTo(size.width * 0.03656293, size.height * 0.1388153);
    path.cubicTo(size.width * 0.03971040, size.height * 0.06184061, size.width * 0.05703867, size.height * 0.005102041,
        size.width * 0.07739947, size.height * 0.005102041);
    path.close();
    Paint paintStroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    paintStroke.color = const Color(0xffF2F2F7);
    canvas.drawPath(path, paintStroke);

    Paint paintFill = Paint()..style = PaintingStyle.fill;
    paintFill.color = const Color(0xffE5E5EA);
    canvas.drawPath(path, paintFill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
