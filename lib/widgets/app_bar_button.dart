import 'package:flutter/material.dart';



class AppBarButton extends StatefulWidget {
  const AppBarButton({Key? key, required this.texto}) : super(key: key);

   final String texto;


  @override
  State<AppBarButton> createState() => _AppBarButtonState();
}

class _AppBarButtonState extends State<AppBarButton> {
  final List _isHovering = [
    false
  ];




  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        setState(() {
          value
              ? _isHovering[0] = true
              : _isHovering[0] = false;
        });
      },
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.texto,
            style: TextStyle(
              color: _isHovering[0]
                  ? Colors.blue[200]
                  : Colors.white,
            ),
          ),
          SizedBox(height: 5),
          Visibility(
            maintainAnimation: true,
            maintainState: true,
            maintainSize: true,
            visible: _isHovering[0],
            child: Container(
              height: 2,
              width: 20,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
