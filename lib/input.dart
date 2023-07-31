import 'dart:io';
import 'dart:typed_data';

import 'package:detete/configure.dart';

class Input {
  static String textFile(
      {String filepath = "inputs/input.txt", bool omitCliArgs = false}) {
    filepath = getInputPathFromArgs(filepath, omitCliArgs);
    return File(filepath).readAsStringSync();
  }

  static List<String> textFileLines(
      {String filepath = "inputs/input.txt", bool omitCliArgs = false}) {
    filepath = getInputPathFromArgs(filepath, omitCliArgs);
    return File(filepath).readAsLinesSync();
  }

  static Uint8List bytesFile(String filepath, {bool omitCliArgs = false}) {
    filepath = getInputPathFromArgs(filepath, omitCliArgs);
    return File(filepath).readAsBytesSync();
  }
}
