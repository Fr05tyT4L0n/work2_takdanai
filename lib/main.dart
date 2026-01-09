import 'package:flutter/material.dart';

// Components
import 'rectangle_calc.dart';
import 'volume_calc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/RectangleCalc': (context) => RectangleCalc(),
        '/VolumeCalc': (context) => VolumeCalc(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            SizedBox(height: 15),

            Text(
              "โปรแกรมคำนวณ",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 5),

            Text(
              "กรุณาเลือกรายการที่ต้องการ",
              style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
            ),

            SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 60,

              child: TextButton(
                onPressed: () => Navigator.pushNamed(context, '/RectangleCalc'),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue.shade600,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Icon(Icons.square_foot),

                    SizedBox(width: 12),

                    Text(
                      "คำนวณพื้นที่สี่เหลี่ยม",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              height: 60,

              child: TextButton(
                onPressed: () => Navigator.pushNamed(context, '/VolumeCalc'),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green.shade600,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.water_drop),

                    SizedBox(width: 15),

                    Text(
                      "แปลงลิตรเป็นแกลลอน",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
