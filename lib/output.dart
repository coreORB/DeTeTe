import 'dart:io';
import 'dart:typed_data';

import 'configure.dart';

extension OutputTextFile on String {
  void toOutputTextFile(
      {String filepath = "outputs/output.txt", bool omitCliArgs = false}) {
    filepath = getOutputPathFromArgs(filepath, omitCliArgs);
    File(filepath).writeAsStringSync(this);
  }
}

extension OutputTextFileLines on List<String> {
  void toOutputTextFile(
      {String filepath = "outputs/output.txt", bool omitCliArgs = false}) {
    filepath = getOutputPathFromArgs(filepath, omitCliArgs);
    File(filepath).writeAsStringSync(join("\n"));
  }
}

extension OutputBytesFile on Uint8List {
  void toOutputTextFile(String filepath, {bool omitCliArgs = false}) {
    filepath = getOutputPathFromArgs(filepath, omitCliArgs);
    File(filepath).writeAsBytesSync(this);
  }
}
