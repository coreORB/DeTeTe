import 'dart:io';
import 'dart:typed_data';

import 'configure.dart';

extension OutputTextFile on String {
  /// Writes file at [filepath] with [this] as text.
  ///
  /// Set [skipInCliArgs] to _true_ to disallow changing [filepath] set in code
  /// when script is run from command line.
  void writeAsString({
    String filepath = "outputs/output.txt",
    bool skipInCliArgs = false,
  }) {
    filepath = getOutputPathFromArgs(filepath, skipInCliArgs);
    File(filepath).writeAsStringSync(this);
  }
}

/// Writes file at [filepath] with [content] as text.
///
/// Set [skipInCliArgs] to _true_ to disallow changing [filepath] set in code
/// when script is run from command line.
void writeAsString(
  String content, {
  String filepath = "outputs/output.txt",
  bool skipInCliArgs = false,
}) {
  content.writeAsString(filepath: filepath, skipInCliArgs: skipInCliArgs);
}

extension OutputTextFileLinesIterable<T> on Iterable<T> {
  /// Writes file at [filepath] with [this] as text.
  ///
  /// Set [skipInCliArgs] to _true_ to disallow changing [filepath] set in code
  /// when script is run from command line.
  void writeListAsString({
    String filepath = "outputs/output.txt",
    bool skipInCliArgs = false,
    String separator = "\n",
  }) {
    filepath = getOutputPathFromArgs(filepath, skipInCliArgs);
    File(filepath).writeAsStringSync(join(separator));
  }
}

/// Writes file at [filepath] with [content] as text.
///
/// Set [skipInCliArgs] to _true_ to disallow changing [filepath] set in code
/// when script is run from command line.
void writeListAsString<T>(
  Iterable<T> content, {
  String filepath = "outputs/output.txt",
  bool skipInCliArgs = false,
  String separator = "\n",
}) {
  content.writeListAsString(
      filepath: filepath, skipInCliArgs: skipInCliArgs, separator: separator);
}

extension OutputBytesFile on Uint8List {
  /// Writes file at [filepath] with [this] as bytes.
  ///
  /// Set [skipInCliArgs] to _true_ to disallow changing [filepath] set in code
  /// when script is run from command line.
  void writeAsBytes(
    String filepath, {
    bool skipInCliArgs = false,
  }) {
    filepath = getOutputPathFromArgs(filepath, skipInCliArgs);
    File(filepath).writeAsBytesSync(this);
  }
}

/// Writes file at [filepath] with [content] as bytes.
///
/// Set [skipInCliArgs] to _true_ to disallow changing [filepath] set in code
/// when script is run from command line.
void writeAsBytes(
  Uint8List content, {
  String filepath = "outputs/output.txt",
  bool skipInCliArgs = false,
}) {
  content.writeAsBytes(filepath, skipInCliArgs: skipInCliArgs);
}
