import 'dart:async';
import 'dart:io';

class Calculator {
  double add(double a, double b) => a + b;
  double subtract(double a, double b) => a - b;
  double multiply(double a, double b) => a * b;
  double divide(double a, double b) {
    if (b == 0) throw ArgumentError('Cannot divide by zero');
    return a / b;
  }
}

Future<void> main() async {
  final calculator = Calculator();

  while (true) {
    print('\n============================');
    print('       Kalkulator Dart');
    print('============================');
    print('1. Penjumlahan');
    print('2. Pengurangan');
    print('3. Perkalian');
    print('4. Pembagian');
    print('5. Keluar');
    print('============================');

    stdout.write('Pilih operasi (1-5): ');
    String? choice = stdin.readLineSync();

    if (choice == '5') {
      print('Terima kasih sudah menggunakan kalkulator ini! 👋');
      break;
    }

    try {
      stdout.write('Masukkan angka pertama: ');
      double num1 = double.parse(stdin.readLineSync()!);

      stdout.write('Masukkan angka kedua: ');
      double num2 = double.parse(stdin.readLineSync()!);

      double result;
      switch (choice) {
        case '1':
          result = calculator.add(num1, num2);
          print('Hasil Penjumlahan: $result');
          break;
        case '2':
          result = calculator.subtract(num1, num2);
          print('Hasil Pengurangan: $result');
          break;
        case '3':
          result = calculator.multiply(num1, num2);
          print('Hasil Perkalian: $result');
          break;
        case '4':
          result = calculator.divide(num1, num2);
          print('Hasil Pembagian: $result');
          break;
        default:
          print('Pilihan tidak valid. Silakan coba lagi!');
      }
    } catch (e) {
      print('Terjadi kesalahan: $e');
    }
  }
}