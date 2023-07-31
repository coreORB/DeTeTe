import 'dart:io';
import 'dart:typed_data';

import 'configure.dart';

class Output {
  static void textFile(String content,
      {String filepath = "outputs/output.txt", bool omitCliArgs = false}) {
    content.toOutputTextFile(filepath: filepath, omitCliArgs: omitCliArgs);
  }

  static void textFileLines(List<String> content,
      {String filepath = "outputs/output.txt", bool omitCliArgs = false}) {
    content.toOutputTextFileLines(filepath: filepath, omitCliArgs: omitCliArgs);
  }

  static void bytesFile(Uint8List content,
      {String filepath = "outputs/output.txt", bool omitCliArgs = false}) {
    content.toOutputBytesFile(filepath, omitCliArgs: omitCliArgs);
  }
}

extension OutputTextFile on String {
  void toOutputTextFile(
      {String filepath = "outputs/output.txt", bool omitCliArgs = false}) {
    filepath = getOutputPathFromArgs(filepath, omitCliArgs);
    File(filepath).writeAsStringSync(this);
  }
}

extension OutputTextFileLines on List<String> {
  void toOutputTextFileLines(
      {String filepath = "outputs/output.txt", bool omitCliArgs = false}) {
    filepath = getOutputPathFromArgs(filepath, omitCliArgs);
    File(filepath).writeAsStringSync(join("\n"));
  }
}

extension OutputBytesFile on Uint8List {
  void toOutputBytesFile(String filepath, {bool omitCliArgs = false}) {
    filepath = getOutputPathFromArgs(filepath, omitCliArgs);
    File(filepath).writeAsBytesSync(this);
  }
}
