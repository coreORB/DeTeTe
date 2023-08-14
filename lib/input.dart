import 'dart:io';
import 'dart:typed_data';

import 'package:detete/configure.dart';

class Input {
  /// Reads file at [filepath] as list of lines.
  ///
  /// Set [skipInCliArgs] to _true_ to disallow changing [filepath] set in code
  /// when script is run from command line.
  static String textFile(
      {String filepath = "inputs/input.txt", bool omitCliArgs = false}) {
    filepath = getInputPathFromArgs(filepath, omitCliArgs);
    return File(filepath).readAsStringSync();
  }

  /// Reads file at [filepath] as text.
  ///
  /// Set [skipInCliArgs] to _true_ to disallow changing [filepath] set in code
  /// when script is run from command line.
  static List<String> textFileLines(
      {String filepath = "inputs/input.txt", bool skipInCliArgs = false}) {
    filepath = getInputPathFromArgs(filepath, skipInCliArgs);
    return File(filepath).readAsLinesSync();
  }

  /// Reads file at [filepath] as bytes.
  ///
  /// Set [skipInCliArgs] to _true_ to disallow changing [filepath] set in code
  /// when script is run from command line.
  static Uint8List bytesFile(String filepath, {bool skipInCliArgs = false}) {
    filepath = getInputPathFromArgs(filepath, skipInCliArgs);
    return File(filepath).readAsBytesSync();
  }
}
