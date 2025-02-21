import 'package:test/test.dart';
import 'package:dart_calculator/main.dart';

void main() {
  late Calculator calculator;

  setUp(() {
    calculator = Calculator();
  });

  group('Calculator Basic Operations', () {
    test('Pertambahan', () {
      expect(calculator.calculate(Operation.add, 5, 3), equals(8));
      expect(calculator.calculate(Operation.add, -1, 1), equals(0));
      expect(calculator.calculate(Operation.add, 0, 0), equals(0));
      expect(calculator.calculate(Operation.add, -5, -3), equals(-8));
    });

    test('Pengurangan', () {
      expect(calculator.calculate(Operation.subtract, 5, 3), equals(2));
      expect(calculator.calculate(Operation.subtract, -1, 1), equals(-2));
      expect(calculator.calculate(Operation.subtract, 0, 0), equals(0));
      expect(calculator.calculate(Operation.subtract, -5, -3), equals(-2));
    });

    test('Perkalian', () {
      expect(calculator.calculate(Operation.multiply, 5, 3), equals(15));
      expect(calculator.calculate(Operation.multiply, -1, 1), equals(-1));
      expect(calculator.calculate(Operation.multiply, 0, 5), equals(0));
      expect(calculator.calculate(Operation.multiply, -5, -3), equals(15));
    });

    test('Pembagian', () {
      expect(calculator.calculate(Operation.divide, 6, 2), equals(3));
      expect(calculator.calculate(Operation.divide, -6, 2), equals(-3));
      expect(calculator.calculate(Operation.divide, 0, 5), equals(0));
      expect(calculator.calculate(Operation.divide, 5, 2), equals(2));
    });
  });

  group('Hasil Formatting', () {
    test('getResult formats success cases correctly', () {
      expect(calculator.getResult(Operation.add, 5, 3), equals('Hasil: 8'));
      expect(calculator.getResult(Operation.subtract, 10, 4), equals('Hasil: 6'));
      expect(calculator.getResult(Operation.multiply, 3, 3), equals('Hasil: 9'));
      expect(calculator.getResult(Operation.divide, 10, 2), equals('Hasil: 5.0'));
    });

    test('getResult handles division by zero', () {
      expect(calculator.getResult(Operation.divide, 5, 0), equals('Error: Tidak dapat membagi dengan nol'));
    });
  });

  group('Konversi Enum', () {
    test('getOperation mengonversi pilihan string ke Operation yang benar', () {
      expect(getOperation('1'), equals(Operation.add));
      expect(getOperation('2'), equals(Operation.subtract));
      expect(getOperation('3'), equals(Operation.multiply));
      expect(getOperation('4'), equals(Operation.divide));
    });

    test('getOperation mengembalikan null untuk pilihan tidak valid', () {
      expect(getOperation('0'), isNull);
      expect(getOperation('6'), isNull);
      expect(getOperation(''), isNull);
      expect(getOperation('abc'), isNull);
    });
  });
} 