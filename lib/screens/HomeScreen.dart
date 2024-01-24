import 'package:flutter/material.dart';
import 'package:modern_smart_home/utily/smart_device_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // padding constants

  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  // list of smart devices

  List mySmartDevices = [
    // [smartDeviceName, iconPath , powerStatus]

    [
      "Smart Light",
      "lib/icons/light-bulb.png",
      true,
    ],
    [
      "Smart Ac",
      "lib/icons/air-conditioner.png",
      false,
    ],
    [
      "Smart Tv",
      "lib/icons/smart-tv.png",
      false,
    ],
    [
      "Smart Fan",
      "lib/icons/fan.png",
      false,
    ]
  ];

  // power button switched

  void powerSwitchChanged(bool? value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // custom app bar
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // menu icon
                  Image.asset(
                    'lib/icons/menu.png',
                    height: 45,
                    color: Colors.grey[800],
                  ),
                  // account Icon'

                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey[800],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome Home,'),
                  Text(
                    'Rohith Reddy',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            // smart devices + grid

            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: const Text(
                'Smart Devices',
              ),
            ),

            Expanded(
                child: GridView.builder(
              itemCount: mySmartDevices.length,
              padding: const EdgeInsets.all(25),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.3,
              ),
              itemBuilder: (context, index) {
                return SmartDeviceBox(
                  smartDeviceName: mySmartDevices[index][0],
                  powerOn: mySmartDevices[index][2],
                  iconPath: mySmartDevices[index][1],
                  onChanged: (value) {
                    return powerSwitchChanged(value, index);
                  },
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
