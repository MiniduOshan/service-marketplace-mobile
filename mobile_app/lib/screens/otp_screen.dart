import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String phoneNumber;
  const OTPVerificationScreen({super.key, required this.phoneNumber});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final PinInputController _pinController = PinInputController();

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Verify Phone", style: TextStyle(color: Color(0xFF006D44))),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Text("Enter verification code", 
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text("Sent to ${widget.phoneNumber}"),
            const SizedBox(height: 40),
            
            // This is the part causing the error
            MaterialPinField(
              length: 6,
              pinController: _pinController,
              keyboardType: TextInputType.number,
              theme: MaterialPinTheme(
                shape: MaterialPinShape.outlined,
                cellSize: const Size(40, 50),
                borderRadius: BorderRadius.circular(8),
                fillColor: Colors.white,
                focusedFillColor: Colors.white,
                filledFillColor: Colors.white,
                focusedBorderColor: const Color(0xFF006D44),
                borderColor: Colors.grey[300],
                filledBorderColor: Colors.grey[300],
                entryAnimation: MaterialPinAnimation.fade,
              ),
              onChanged: (value) {},
            ),
            
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF006D44)),
                onPressed: () {
                   debugPrint("Verifying: ${_pinController.text}");
                },
                child: const Text("Verify", style: TextStyle(color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}