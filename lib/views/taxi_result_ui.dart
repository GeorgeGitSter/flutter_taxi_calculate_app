// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaxiResultUI extends StatefulWidget {
  final double? distance;
  final double? trafficjamTime;
  final double? totalPay;

  TaxiResultUI({super.key, this.distance, this.trafficjamTime, this.totalPay});

  @override
  State<TaxiResultUI> createState() => _TaxiResultUIState();
}

class _TaxiResultUIState extends State<TaxiResultUI> {
  @override
  Widget build(BuildContext context) {
    NumberFormat fm = NumberFormat('#,###,##0.##');
    // NumberFormat fmDistanceAndTime = NumberFormat('#,###,##0.00');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFB22C),
        title: Text(
          'คำนวณค่า Taxi (ผลลัพธ์)',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 100,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/TaxiLogo.png',
                  width: 200,
                ),
                SizedBox(
                  height: 60,
                ),
                Text(
                  '--- ค่า Taxi ---',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ระยะทาง ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '${fm.format(widget.distance)}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      ' กิโลเมตร',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'เวลารถติด ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '${fm.format(widget.trafficjamTime)}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      ' นาที',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'คิดเป็นเงินที่ต้องจ่าย ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '${fm.format(widget.totalPay)}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      ' บาท',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                // Text(
                //   'คิดเป็นเงินที่ต้องจ่าย ${fm.format(widget.totalPay)} บาท',
                //   style: TextStyle(
                //     fontSize: 20,
                //     fontWeight: FontWeight.w500,
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
