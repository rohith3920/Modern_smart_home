import 'dart:math';

import 'package:flutter/material.dart';

class SmartDeviceBox extends StatefulWidget {
  final String smartDeviceName;
  final String iconPath;
  final bool powerOn;
  void Function(bool?) onChanged;
  SmartDeviceBox(
      {super.key,
      required this.iconPath,
      required this.powerOn,
      required this.smartDeviceName,
      required this.onChanged});

  @override
  State<SmartDeviceBox> createState() => _SmartDeviceBoxState();
}

class _SmartDeviceBoxState extends State<SmartDeviceBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: widget.powerOn ? Colors.grey[800] : Colors.grey[200],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                widget.iconPath,
                height: 65,
                color: widget.powerOn ? Colors.white : Colors.black,
              ),

              // smart device name + switch

              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        widget.smartDeviceName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: widget.powerOn ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: pi / 2,
                    child: Switch(
                      value: widget.powerOn,
                      activeColor: Colors.green,
                      onChanged: widget.onChanged,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
