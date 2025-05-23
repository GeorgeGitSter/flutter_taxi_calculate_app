// ignore_for_file: sort_child_properties_last
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_taxi_calculate_app/views/taxi_result_ui.dart';


class TaxiHomeUI extends StatefulWidget {
  const TaxiHomeUI({super.key});

  @override
  State<TaxiHomeUI> createState() => _TaxiHomeUIState();
}

class _TaxiHomeUIState extends State<TaxiHomeUI> {
  // TextField Controllers
  TextEditingController _distanceController = TextEditingController();
  TextEditingController _trafficjamTimeController = TextEditingController();

  // Alert Dialog Method
  _warningDialog(msg) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('คำเตือน'),
        content: Text(
          msg,
        ),
        actions: [
          //  TextButton ปุ่มไม่มีพื้นหลัง
          OutlinedButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'ตกลง',
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFB22C),
        title: Text(
          'คำนวณค่า Taxi',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
          ),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 40,
                  ),
                  child: Image.asset(
                    'assets/images/TaxiLogo.png',
                    width: 200,
                  ),
                ),
                TextField(
                  controller: _distanceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "ป้อนระยะทาง",
                      labelText: "ระยะทาง (กิโลเมตร)",
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 25,
                        horizontal: 20,
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _trafficjamTimeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "ป้อนเวลารถติด (ไม่มีป้อน 0)",
                      labelText: "เวลารถติด (นาที)",
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 25,
                        horizontal: 20,
                      )),
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    // validate UI หากมีปัญหาแสดง alert dialog
                    if (_distanceController.text.isEmpty) {
                      _warningDialog('ป้อนระยะทางด้วย...');
                    } else if (_trafficjamTimeController.text.isEmpty) {
                      _warningDialog('ป้อนเวลารถติดด้วย...');
                    } else {
                      double distance = double.parse(_distanceController.text);
                      double trafficjamTime =
                          double.parse(_trafficjamTimeController.text);

                      double notFirstKM = distance - 1;

                      double totalPay =
                          35 + (notFirstKM * 5.50) + (trafficjamTime * 0.50);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TaxiResultUI(
                                    distance: distance,
                                    trafficjamTime: trafficjamTime,
                                    totalPay: totalPay,
                                  )));
                    }
                  },
                  child: Text(
                    'คำนวณ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFB22C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    minimumSize: Size(
                      double.infinity,
                      60,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    _distanceController.clear();
                    _trafficjamTimeController.clear();
                  },
                  child: Text(
                    'ยกเลิก',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[900]!,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    minimumSize: Size(
                      double.infinity,
                      60,
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Image.asset(
                  'assets/images/Chetsada_Signature.png',
                  width: 100,
                ),
                Text(
                  'Created by Chetsada',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
