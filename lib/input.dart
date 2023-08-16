import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:detete/configure.dart';

/// Reads file at [filepath] as string using the given [Encoding].
///
/// Set [skipInCliArgs] to _true_ to disallow changing [filepath] set in code
/// when script is run from command line.
///
/// Example:
/// ```dart
/// String content = input.readAsString();
/// ```
String readAsString({
  String filepath = "inputs/input.txt",
  bool skipInCliArgs = false,
  Encoding encoding = utf8,
}) {
  filepath = getInputPathFromArgs(filepath, skipInCliArgs);
  return File(filepath).readAsStringSync(encoding: encoding);
}

/// Reads file at [filepath] as list of lines using the given [Encoding].
///
/// Set [skipInCliArgs] to _true_ to disallow changing [filepath] set in code
/// when script is run from command line.
///
/// Example:
/// ```dart
/// List<String> content = input.readAsLines();
/// ```
List<String> readAsLines({
  String filepath = "inputs/input.txt",
  bool skipInCliArgs = false,
  Encoding encoding = utf8,
}) {
  filepath = getInputPathFromArgs(filepath, skipInCliArgs);
  return File(filepath).readAsLinesSync(encoding: encoding);
}

/// Reads file at [filepath] as bytes.
///
/// Set [skipInCliArgs] to _true_ to disallow changing [filepath] set in code
/// when script is run from command line.
///
/// Example:
/// ```dart
/// Uint8List content = input.readAsBytes();
/// ```
Uint8List readAsBytes({
  String filepath = "inputs/input.txt",
  bool skipInCliArgs = false,
}) {
  filepath = getInputPathFromArgs(filepath, skipInCliArgs);
  return File(filepath).readAsBytesSync();
}

/// Reads file at [filepath] as JSON.
///
/// Set [skipInCliArgs] to _true_ to disallow changing [filepath] set in code
/// when script is run from command line.
///
/// Example:
/// ```dart
/// var content = input.readAsJson();
/// ```
dynamic readAsJson({
  String filepath = "inputs/input.txt",
  bool skipInCliArgs = false,
}) {
  filepath = getInputPathFromArgs(filepath, skipInCliArgs);
  return jsonDecode(File(filepath).readAsStringSync());
}
