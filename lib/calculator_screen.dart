import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final firstNumberController = TextEditingController();
  final secondNumberController = TextEditingController();

  String result = '0';
  String operationLabel = 'Enter two numbers';

  void calculate(String operation) {
    final first = double.tryParse(firstNumberController.text.trim());
    final second = double.tryParse(secondNumberController.text.trim());

    if (first == null ||
        second == null ||
        !first.isFinite ||
        !second.isFinite) {
      setState(() {
        result = 'Invalid input';
        operationLabel = 'Please enter two valid numbers';
      });
      return;
    }

    if (operation == '÷' && second == 0) {
      setState(() {
        result = 'Cannot divide by zero';
        operationLabel = 'Please change the second number';
      });
      return;
    }

    double answer;

    switch (operation) {
      case '+':
        answer = first + second;
        break;
      case '-':
        answer = first - second;
        break;
      case '×':
        answer = first * second;
        break;
      case '÷':
        answer = first / second;
        break;
      default:
        return;
    }

    setState(() {
      result = answer.toString();
      operationLabel = '$first $operation $second';
    });
  }

  void clearCalculator() {
    firstNumberController.clear();
    secondNumberController.clear();

    setState(() {
      result = '0';
      operationLabel = 'Enter two numbers';
    });
  }

  @override
  void dispose() {
    firstNumberController.dispose();
    secondNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const deepTeal = Color(0xFF0F766E);
    const softMint = Color(0xFFCCFBF1);
    const darkCharcoal = Color(0xFF1F2937);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Calculator',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: deepTeal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 460),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: const BoxDecoration(
                      color: softMint,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.calculate,
                      size: 36,
                      color: deepTeal,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'BASIC CALCULATOR',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.2,
                    color: darkCharcoal,
                  ),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: firstNumberController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                    signed: true,
                  ),
                  style: const TextStyle(
                    color: darkCharcoal,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                    labelText: 'First Number',
                    labelStyle: const TextStyle(color: Color(0xFF4B5563)),
                    hintText: 'Enter the first number',
                    hintStyle: const TextStyle(color: Color(0xFF9CA3AF)),
                    prefixIcon: const Icon(Icons.looks_one, color: deepTeal),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: deepTeal, width: 2),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: secondNumberController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                    signed: true,
                  ),
                  style: const TextStyle(
                    color: darkCharcoal,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Second Number',
                    labelStyle: const TextStyle(color: Color(0xFF4B5563)),
                    hintText: 'Enter the second number',
                    hintStyle: const TextStyle(color: Color(0xFF9CA3AF)),
                    prefixIcon: const Icon(Icons.looks_two, color: deepTeal),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: deepTeal, width: 2),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => calculate('+'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: deepTeal,
                          foregroundColor: Colors.white,
                          elevation: 1,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          '+',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => calculate('-'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: deepTeal,
                          foregroundColor: Colors.white,
                          elevation: 1,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          '−',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => calculate('×'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: deepTeal,
                          foregroundColor: Colors.white,
                          elevation: 1,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          '×',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => calculate('÷'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: deepTeal,
                          foregroundColor: Colors.white,
                          elevation: 1,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          '÷',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    color: softMint,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFF99F6E4),
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        operationLabel,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: deepTeal,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'RESULT',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.5,
                          color: Color(0xFF4B5563),
                        ),
                      ),
                      const SizedBox(height: 6),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          result,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            color: deepTeal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                OutlinedButton.icon(
                  onPressed: clearCalculator,
                  icon: const Icon(Icons.refresh, size: 20),
                  label: const Text(
                    'Clear',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: deepTeal,
                    side: const BorderSide(color: deepTeal, width: 1.5),
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Created by: Earth Justin Lim\nCourse/Code: CCE106L(3447)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    height: 1.5,
                    color: Color(0xFF64748B),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
