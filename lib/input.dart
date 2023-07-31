import 'dart:io';
import 'dart:typed_data';

class Input {
  static String textFile({String filepath = "inputs/input.txt"}) {
    return File(filepath).readAsStringSync();
  }

  static List<String> textFileLines({String filepath = "inputs/input.txt"}) {
    return File(filepath).readAsLinesSync();
  }

  static Uint8List bytesFile({String filepath = "inputs/input.txt"}) {
    return File(filepath).readAsBytesSync();
  }
}
