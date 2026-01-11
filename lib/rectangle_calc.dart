import 'package:flutter/material.dart';

class RectangleCalc extends StatefulWidget {
  const RectangleCalc({super.key});

  @override
  State<RectangleCalc> createState() => RectangleCalcState();
}

class RectangleCalcState extends State<RectangleCalc> {
  double _width = 0;
  double _length = 0;
  double _area = 0;

  TextEditingController _widthCtrl = TextEditingController();
  TextEditingController _lengthCtrl = TextEditingController();

  void _calcRectangle() {
    _width = double.tryParse(_widthCtrl.text) ?? 0;
    _length = double.tryParse(_lengthCtrl.text) ?? 0;

    setState(() {
      _area = _width * _length;
    });
  }

  // Reuse Styles
  final InputDecoration _textFieldStyle = InputDecoration(
    border: OutlineInputBorder(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("พื้นที่สี่เหลี่ยม")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30),

        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Text(
                      "พื้นที่ทั้งหมด",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black)
                  ),

                  SizedBox(height: 25),

                  Text(
                      _area.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 56,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade900,
                    ),
                  ),

                  SizedBox(height: 25),

                  Text("ตารางเมตร",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black)
                  ),
                ],
              ),
            ),

            SizedBox(height: 25),

            TextField(
              controller: _widthCtrl,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 24),
              decoration: _textFieldStyle.copyWith(
                label: Text("ความกว้าง (เมตร)"),
                prefixIcon: Icon(Icons.swap_horiz, color: Colors.black),
              ),
            ),

            SizedBox(height: 25),

            TextField(
              controller: _lengthCtrl,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 24),
              decoration: _textFieldStyle.copyWith(
                label: Text("ความยาว (เมตร)"),
                prefixIcon: Icon(Icons.swap_vert, color: Colors.black),
              ),
            ),

            SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 60,

              child: ElevatedButton(
                onPressed: () => _calcRectangle(),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),

                child: Text(
                  "คำนวณ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            Text("สูครการหาพื้นที่สีเหลี่ยมผืนผ้า คือ ความกว้าง x ความยาว",
            style:
              TextStyle(
                fontSize: 16
              )
            ),

            SizedBox(height: 10),

            Text("สูครการหาพื้นที่สีเหลี่ยมจตุรัส คือ ความยาวด้าน x ความยาวด้าน"),
          ],
        ),
      ),
    );
  }
}
