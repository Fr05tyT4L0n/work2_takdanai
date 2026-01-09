import 'package:flutter/material.dart';

class RectangleCalc extends StatefulWidget {
  const RectangleCalc({super.key});

  @override
  State<RectangleCalc> createState() => RectangleCalcState();
}

class RectangleCalcState extends State<RectangleCalc> {
  int _width = 0;
  int _length = 0;
  int _area = 0;

  TextEditingController _widthCtrl = TextEditingController();
  TextEditingController _lengthCtrl = TextEditingController();

  void _calcRectangle() {
    _width = int.tryParse(_widthCtrl.text) ?? 0;
    _length = int.tryParse(_lengthCtrl.text) ?? 0;

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
      appBar: AppBar(title: Text("พื้นที่สี่เหลี่ยม"), centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),

        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Text("พื้นที่ทั้งหมด", style: TextStyle(color: Colors.black)),

                  Text("$_area", style: TextStyle(
                      fontSize: 56,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade900,
                    ),
                  ),

                  Text("ตารางเมตร", style: TextStyle(color: Colors.black)),
                ],
              ),
            ),

            SizedBox(height: 15),

            TextField(
              controller: _widthCtrl,
              keyboardType: TextInputType.number,
              decoration: _textFieldStyle.copyWith(
                label: Text("ความกว้าง (เมตร)"),
                prefixIcon: Icon(Icons.swap_horiz, color: Colors.black),
              ),
            ),

            SizedBox(height: 15),

            TextField(
              controller: _lengthCtrl,
              keyboardType: TextInputType.number,
              decoration: _textFieldStyle.copyWith(
                label: Text("ความยาว (เมตร)"),
                prefixIcon: Icon(Icons.swap_vert, color: Colors.black),
              ),
            ),

            SizedBox(height: 15),

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
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
