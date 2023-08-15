import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'configure.dart';

extension OutputTextFile on String {
  /// Writes file at [filepath] with [this] as text using the given [Encoding].
  ///
  /// Set [skipInCliArgs] to _true_ to disallow changing [filepath] set in code
  /// when script is run from command line.
  ///
  /// Example:
  /// ```dart
  /// 'foo'.writeAsString();
  /// ```
  void writeAsString({
    String filepath = "outputs/output.txt",
    bool skipInCliArgs = false,
    Encoding encoding = utf8,
  }) {
    filepath = getOutputPathFromArgs(filepath, skipInCliArgs);
    File(filepath).writeAsStringSync(this, encoding: encoding);
  }
}

/// Writes file at [filepath] with [content] as text using the given [Encoding].
///
/// Set [skipInCliArgs] to _true_ to disallow changing [filepath] set in code
/// when script is run from command line.
///
/// Example:
/// ```dart
/// output.writeAsString('foo');
/// ```
void writeAsString(
  String content, {
  String filepath = "outputs/output.txt",
  bool skipInCliArgs = false,
  Encoding encoding = utf8,
}) {
  content.writeAsString(
      filepath: filepath, skipInCliArgs: skipInCliArgs, encoding: encoding);
}

extension OutputTextFileLinesIterable<T> on Iterable<T> {
  /// Writes file at [filepath] with [this] joined to text using [separator]
  /// and using the given [Encoding].
  ///
  /// Set [skipInCliArgs] to _true_ to disallow changing [filepath] set in code
  /// when script is run from command line.
  ///
  /// Example:
  /// ```dart
  /// ['foo', 'bar'].writeIterableAsString();
  /// ```
  void writeIterableAsString({
    String filepath = "outputs/output.txt",
    bool skipInCliArgs = false,
    Encoding encoding = utf8,
    String separator = "\n",
  }) {
    filepath = getOutputPathFromArgs(filepath, skipInCliArgs);
    File(filepath).writeAsStringSync(join(separator), encoding: encoding);
  }
}

/// Writes file at [filepath] with [content] joined to text using [separator]
/// and using the given [Encoding].
///
/// Set [skipInCliArgs] to _true_ to disallow changing [filepath] set in code
/// when script is run from command line.
///
/// Example:
/// ```dart
/// output.writeIterableAsString(['foo', 'bar']);
/// ```
void writeIterableAsString<T>(
  Iterable<T> content, {
  String filepath = "outputs/output.txt",
  bool skipInCliArgs = false,
  Encoding encoding = utf8,
  String separator = "\n",
}) {
  content.writeIterableAsString(
    filepath: filepath,
    skipInCliArgs: skipInCliArgs,
    separator: separator,
    encoding: encoding,
  );
}

extension OutputBytesFile on Uint8List {
  /// Writes file at [filepath] with [this] as bytes.
  ///
  /// Set [skipInCliArgs] to _true_ to disallow changing [filepath] set in code
  /// when script is run from command line.
  ///
  /// Example:
  /// ```dart
  /// Uint8List.fromList([2, 5]).writeAsBytes();
  /// ```
  void writeAsBytes({
    String filepath = "outputs/output.txt",
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
///
/// Example:
/// ```dart
/// output.writeAsBytes(Uint8List.fromList([2, 5]));
/// ```
void writeAsBytes(
  Uint8List content, {
  String filepath = "outputs/output.txt",
  bool skipInCliArgs = false,
}) {
  content.writeAsBytes(filepath: filepath, skipInCliArgs: skipInCliArgs);
}
