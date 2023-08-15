import 'dart:io';
import 'dart:typed_data';

import 'package:detete/configure.dart';

/// Reads file at [filepath] as list of lines.
///
/// Set [skipInCliArgs] to _true_ to disallow changing [filepath] set in code
/// when script is run from command line.
String readAsString({
  String filepath = "inputs/input.txt",
  bool skipInCliArgs = false,
}) {
  filepath = getInputPathFromArgs(filepath, skipInCliArgs);
  return File(filepath).readAsStringSync();
}

/// Reads file at [filepath] as text.
///
/// Set [skipInCliArgs] to _true_ to disallow changing [filepath] set in code
/// when script is run from command line.
List<String> readAsLines({
  String filepath = "inputs/input.txt",
  bool skipInCliArgs = false,
}) {
  filepath = getInputPathFromArgs(filepath, skipInCliArgs);
  return File(filepath).readAsLinesSync();
}

/// Reads file at [filepath] as bytes.
///
/// Set [skipInCliArgs] to _true_ to disallow changing [filepath] set in code
/// when script is run from command line.
Uint8List readAsBytes({
  String filepath = "inputs/input.txt",
  bool skipInCliArgs = false,
}) {
  filepath = getInputPathFromArgs(filepath, skipInCliArgs);
  return File(filepath).readAsBytesSync();
}
