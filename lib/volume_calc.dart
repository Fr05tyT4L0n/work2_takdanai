import 'package:flutter/material.dart';

class VolumeCalc extends StatefulWidget {
  const VolumeCalc({super.key});

  @override
  State<VolumeCalc> createState() => VolumeCalcState();
}

class VolumeCalcState extends State<VolumeCalc> {
  double _litter = 0;
  double _value = 3.785;
  double _gallon = 0;

  TextEditingController _litterCtrl = TextEditingController();
  TextEditingController _gallonCtrl = TextEditingController();

  void _calcVolume() {
    _litter = double.tryParse(_litterCtrl.text) ?? 0;

    setState(() {
      _gallon = _litter / _value;
      _gallonCtrl.text = _gallon.toStringAsFixed(2);
    });
  }

  // Reuse Styles
  final InputDecoration _textFieldStyle = InputDecoration(
    border: OutlineInputBorder(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ปริมาตร"), centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),

        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.green.shade100),
              ),
              child: Column(
                children: [
                  Text(
                    "ปริมาตรแกลลอน",
                    style: TextStyle(color: Colors.black54),
                  ),

                  SizedBox(height: 15),

                  Text(
                    _gallon.toStringAsFixed(4),
                    style: TextStyle(
                      fontSize: 56,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade900,
                    ),
                  ),
                  Text("แกลลอน", style: TextStyle(color: Colors.black54)),
                ],
              ),
            ),

            SizedBox(height: 15),

            TextField(
              controller: _litterCtrl,
              keyboardType: TextInputType.number,
              decoration: _textFieldStyle.copyWith(
                label: Text("ปริมาตรลิตร"),
                prefixIcon: Icon(Icons.water_drop, color: Colors.black),
              ),
            ),

            SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              height: 60,

              child: ElevatedButton(
                onPressed: () => _calcVolume(),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),

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
