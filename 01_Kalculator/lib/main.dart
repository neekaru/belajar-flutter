import 'dart:io';

class Calculator {
  int calculate(Operation operation, int a, int b) {
    switch (operation) {
      case Operation.add:
        return _add(a, b);
      case Operation.subtract:
        return _subtract(a, b);
      case Operation.multiply:
        return _multiply(a, b);
      case Operation.divide:
        return _divide(a, b).toInt();
    }
  }

  int _add(int a, int b) {
    return a + b;
  }

  int _subtract(int a, int b) {
    return a - b;
  }

  int _multiply(int a, int b) {
    return a * b;
  }

  double _divide(int a, int b) {
    if (b == 0) {
      throw 'Tidak dapat membagi dengan nol';
    }
    return a / b;
  }

  String getResult(Operation operation, int a, int b) {
    try {
      final result = operation == Operation.divide 
          ? _divide(a, b) 
          : calculate(operation, a, b);
      return 'Hasil: $result';
    } catch (e) {
      return 'Error: $e';
    }
  }
}

enum Operation {
  add,
  subtract,
  multiply,
  divide
}

void clearScreen() {
  if (Platform.isWindows) {
    print(Process.runSync('cls', [], runInShell: true).stdout);
  } else {
    print(Process.runSync('clear', [], runInShell: true).stdout);
  }
}

void showMenu() {
  print('\n=== Menu Kalkulator ===');
  print('1. Pertambahan');
  print('2. Pengurangan');
  print('3. Perkalian');
  print('4. Pembagian');
  print('5. Keluar');
  print('====================');
  print('Masukkan pilihan anda (1-5): ');
}

String? readInput() {
  return stdin.readLineSync()?.trim();
}

int? readNumber(String prompt) {
  while (true) {
    print(prompt);
    String? input = readInput();
    if (input == null) return null;
    
    int? number = int.tryParse(input);
    if (number != null) return number;
    
    print('Nomor tidak valid! Silakan coba lagi.');
  }
}

Operation? getOperation(String choice) {
  return switch (choice) {
    '1' => Operation.add,
    '2' => Operation.subtract,
    '3' => Operation.multiply,
    '4' => Operation.divide,
    _ => null
  };
}

void main() {
  final calculator = Calculator();
  
  while (true) {
    clearScreen();
    showMenu();
    
    String? choice = readInput();
    
    if (choice == '5') {
      print('Selamat tinggal!');
      break;
    }
    
    final operation = getOperation(choice ?? '');
    if (operation == null) {
      print('Pilihan tidak valid! Tekan Enter untuk melanjutkan...');
      readInput();
      continue;
    }
    
    int? num1 = readNumber('\nMasukkan angka pertama: ');
    if (num1 == null) {
      print('Input tidak valid! Tekan Enter untuk melanjutkan...');
      readInput();
      continue;
    }
    
    int? num2 = readNumber('Masukkan angka kedua: ');
    if (num2 == null) {
      print('Input tidak valid! Tekan Enter untuk melanjutkan...');
      readInput();
      continue;
    }
    
    print('\n${calculator.getResult(operation, num1, num2)}');
    print('\nTekan Enter untuk melanjutkan...');
    readInput();
  }
}
