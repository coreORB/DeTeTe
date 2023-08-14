import 'dart:io';
import 'dart:typed_data';

import 'configure.dart';

class Output {
  /// Writes file at [filepath] with [content] as text.
  ///
  /// Set [skipInCliArgs] to _true_ to disallow changing [filepath] set in code
  /// when script is run from command line.
  static void textFile(String content,
      {String filepath = "outputs/output.txt", bool skipInCliArgs = false}) {
    content.toOutputTextFile(filepath: filepath, skipInCliArgs: skipInCliArgs);
  }

  /// Writes file at [filepath] with [content] as text.
  ///
  /// Set [skipInCliArgs] to _true_ to disallow changing [filepath] set in code
  /// when script is run from command line.
  static void textFileLines(List<String> content,
      {String filepath = "outputs/output.txt", bool skipInCliArgs = false}) {
    content.toOutputTextFileLines(
        filepath: filepath, skipInCliArgs: skipInCliArgs);
  }

  /// Writes file at [filepath] with [content] as bytes.
  ///
  /// Set [skipInCliArgs] to _true_ to disallow changing [filepath] set in code
  /// when script is run from command line.
  static void bytesFile(Uint8List content,
      {String filepath = "outputs/output.txt", bool skipInCliArgs = false}) {
    content.toOutputBytesFile(filepath, skipInCliArgs: skipInCliArgs);
  }
}

extension OutputTextFile on String {
  /// Writes file at [filepath] with [this] as text.
  ///
  /// Set [skipInCliArgs] to _true_ to disallow changing [filepath] set in code
  /// when script is run from command line.
  void toOutputTextFile(
      {String filepath = "outputs/output.txt", bool skipInCliArgs = false}) {
    filepath = getOutputPathFromArgs(filepath, skipInCliArgs);
    File(filepath).writeAsStringSync(this);
  }
}

extension OutputTextFileLines on List<String> {
  /// Writes file at [filepath] with [this] as text.
  ///
  /// Set [skipInCliArgs] to _true_ to disallow changing [filepath] set in code
  /// when script is run from command line.
  void toOutputTextFileLines(
      {String filepath = "outputs/output.txt", bool skipInCliArgs = false}) {
    filepath = getOutputPathFromArgs(filepath, skipInCliArgs);
    File(filepath).writeAsStringSync(join("\n"));
  }
}

extension OutputTextFileLinesIterable on Iterable<String> {
  /// Writes file at [filepath] with [this] as text.
  ///
  /// Set [skipInCliArgs] to _true_ to disallow changing [filepath] set in code
  /// when script is run from command line.
  void toOutputTextFileLines(
      {String filepath = "outputs/output.txt", bool skipInCliArgs = false}) {
    filepath = getOutputPathFromArgs(filepath, skipInCliArgs);
    File(filepath).writeAsStringSync(join("\n"));
  }
}

extension OutputBytesFile on Uint8List {
  /// Writes file at [filepath] with [this] as bytes.
  ///
  /// Set [skipInCliArgs] to _true_ to disallow changing [filepath] set in code
  /// when script is run from command line.
  void toOutputBytesFile(String filepath, {bool skipInCliArgs = false}) {
    filepath = getOutputPathFromArgs(filepath, skipInCliArgs);
    File(filepath).writeAsBytesSync(this);
  }
}
