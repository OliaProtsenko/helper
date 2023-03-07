import 'package:flutter/material.dart';

class FourDigitCodeInput extends StatefulWidget {
  const FourDigitCodeInput({Key? key}) : super(key: key);

  @override
  _FourDigitCodeInputState createState() => _FourDigitCodeInputState();
}

class _FourDigitCodeInputState extends State<FourDigitCodeInput> {
  late List<String> _codes;

  @override
  void initState() {
    super.initState();
    _codes = ['', '', '', ''];
  }

  void _onCodeChanged(int index, String value) {
    if (value.length > 1) {
      value = value.substring(0, 1);
    }
    setState(() {
      _codes[index] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildCodeInputField(0),
        const SizedBox(width: 16),
        _buildCodeInputField(1),
        const SizedBox(width: 16),
        _buildCodeInputField(2),
        const SizedBox(width: 16),
        _buildCodeInputField(3),
      ],
    );
  }

  Widget _buildCodeInputField(int index) {
    return SizedBox(
      width: 50,
      height: 50,
      child: TextField(
        maxLength: 1,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 24),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.zero,
          counterText: '',
          border: OutlineInputBorder(),
        ),
        onChanged: (value) => _onCodeChanged(index, value),
      ),
    );
  }
}
