import 'package:flutter/material.dart';

class OTPValidatorPage extends StatefulWidget {
  @override
  _OTPValidatorPageState createState() => _OTPValidatorPageState();
}

class _OTPValidatorPageState extends State<OTPValidatorPage> {
  final TextEditingController otpController = TextEditingController();
  String enteredOTP = '';
  bool validateOTP(String enteredOTP) {
    String actualOTP = '1234';
    return enteredOTP == actualOTP;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff7D48EA),
      appBar: AppBar(
        actionsIconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff7D48EA),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // OTP Input Fields
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                for (int i = 0; i < 4; i++)
                  Container(
                    width: 50,
                    decoration: BoxDecoration(
                      color:
                          Colors.white, // Change the color to the desired color
                      borderRadius: BorderRadius.circular(
                          10), // Optional: Adjust border radius as needed
                    ),
                    child: TextField(
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        counterText: '',
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          if (value.isNotEmpty) {
                            if (i == 0)
                              enteredOTP = value;
                            else
                              enteredOTP += value;
                          }
                        });
                      },
                    ),
                  ),
              ],
            ),
            SizedBox(height: 20),
            // Validate Button
            ElevatedButton(
              onPressed: () {
                if (validateOTP(enteredOTP)) {
                  // OTP is valid
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('OTP is valid!')),
                  );
                } else {
                  // OTP is invalid
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Invalid OTP!')),
                  );
                }
              },
              child: Text('Validate OTP'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: OTPValidatorPage(),
  ));
}
