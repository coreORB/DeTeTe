import 'package:collection/collection.dart';

extension StringRegex on String {
  /// It's just [RegExp.allMatches()] reverted.
  Iterable<RegExpMatch> matchesAll(RegExp regex, {int start = 0}) {
    return regex.allMatches(this, start);
  }

  /// It's just [RegExp.firstMatch()] reverted.
  RegExpMatch? matchesFirst(RegExp regex) {
    return regex.firstMatch(this);
  }
}

extension DevCaseConvert on String {
  /// Convert from one developer case to provided case [toCase].
  ///
  /// Throws [FormatException] when input string is not a supported case.
  /// Supported cases:
  /// * camelCase
  /// * PascalCase
  /// * kebab-case
  /// * snake_case
  /// * UPPER_CASE_SNAKE_CASE
  String toCase(Case toCase) {
    List<String> parts = [];
    if (matchesAll(RegExp(r'^[a-z][a-z-]*$')).isNotEmpty) {
      if (substring(length - 1, length)
              .matchesAll(RegExp('[a-z]'))
              .isNotEmpty &&
          !contains('--')) {
        parts = split('-');
      } else {
        throw FormatException("'$this' is not valid kebab case");
      }
    } else if (matchesAll(RegExp(r'^[A-Z][A-Z_]*$')).isNotEmpty) {
      if (substring(length - 1, length)
              .matchesAll(RegExp('[A-Z]'))
              .isNotEmpty &&
          !contains('__')) {
        parts = split('_');
        parts = parts.map((e) => e.toLowerCase()).toList();
      } else {
        throw FormatException("'$this' is not valid upper case snake case");
      }
    } else if (matchesAll(RegExp(r'^[a-z][a-z_]*$')).isNotEmpty) {
      if (substring(length - 1, length)
              .matchesAll(RegExp('[a-z]'))
              .isNotEmpty &&
          !contains('__')) {
        parts = split('_');
      } else {
        throw FormatException("'$this' is not valid snake case");
      }
    } else if (matchesAll(RegExp(r'^[a-zA-Z]+$')).isNotEmpty) {
      var lastCapitalLetterIndex = 0;
      for (var i = 1; i < length; i++) {
        if (codeUnitAt(i) >= 65 && codeUnitAt(i) <= 90) {
          parts.add(substring(lastCapitalLetterIndex, i).toLowerCase());
          lastCapitalLetterIndex = i;
        }
      }
      parts.add(substring(lastCapitalLetterIndex).toLowerCase());
    } else {
      throw FormatException("Case not recognised");
    }

    switch (toCase) {
      case Case.kebab:
        return parts.join('-');
      case Case.snake:
        return parts.join('_');
      case Case.upperSnake:
        return parts.map((e) => e.toUpperCase()).join('_');
      case Case.pascal:
        return parts.map((e) => e[0].toUpperCase() + e.substring(1)).join('');
      case Case.camel:
        return parts
            .mapIndexed(
                (i, e) => i != 0 ? e[0].toUpperCase() + e.substring(1) : e)
            .join('');
    }
  }
}

enum Case {
  camel,
  pascal,
  kebab,
  snake,
  upperSnake,
}
