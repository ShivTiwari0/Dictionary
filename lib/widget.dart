import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key, required this.header, required this.value});

  final String header;
  final String value;

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(elevation: 7,shadowColor:Colors.white ,
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          Flexible(
            child: Text(
              widget.header,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            width: 1,
          ),
          Flexible(
            child: Text(
              '${widget.value}  ',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
    );
  }
}
