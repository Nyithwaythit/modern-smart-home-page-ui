import 'package:flutter/material.dart';
import 'package:i/util/smart_devices.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //padding constants
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  //list of smart devices
  List mySmartDevices = [
    //[ smart devices, iconPath , powerStates
    ["Smart Light", "lib/icons/light-bulb.png", true],
    ["Smart AC", "lib/icons/air-conditioner.png",false],
    ["Smart TV", "lib/icons/smart-tv.png",false],
    ["Smart Fan", "lib/icons/fan.png", false],
  ];
  // power button switched
  void powerSwitchChanged(bool value, int index){
    setState(() {
      mySmartDevices[index][2]= value;
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
            //custom app bar
            Padding(
              padding:  EdgeInsets.symmetric(
                horizontal:horizontalPadding,
                vertical: verticalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // menu bar
                  Image.asset('lib/icons/menu.png',
                  height:45,
                  color: Colors.grey[800],
                  ),
                
                //account item
                Icon(
                  Icons.person,
                  size:45,
                  color: Colors.grey[800],
                )
            
                ],
                
              ),
            ),

            const SizedBox(height:20),

            // Welcome Nyi Thway Thit

           Padding(
             padding:  EdgeInsets.symmetric(horizontal:horizontalPadding),
             child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text ('Welcome Home,',
                 style: TextStyle(fontSize: 20,
                 color: Colors.grey[700],
                 ),
                 ),
               const Text ('Nyi Thway Thit',
                style: TextStyle(
                  fontSize: 40,
                ),
               ),
              ],
             ),
           ),

          const SizedBox(height:25),

          Padding(
            padding:  EdgeInsets.symmetric(horizontal:horizontalPadding),
            child:  Divider(
              color: Colors.grey[400],
              thickness: 1,
            ),
          ),

            //smart device - grid
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child:const  Text('Smart Devices ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),

          Expanded(
            child: GridView.builder(
              padding:const EdgeInsets.all(25),
            itemCount : mySmartDevices.length,
            physics:const  NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 1.3 ),
            
             itemBuilder: (context,index){
            return SmartDeviceBox(
              smartDevicesName: mySmartDevices[index][0],
              iconPath: mySmartDevices[index][1],
              powerOn: mySmartDevices[index][2],
              onChanged: (value) => powerSwitchChanged(value, index),
              );
            },
          ),
        )



      
           
          ],
      
        ),
      ),
    );
  }
}