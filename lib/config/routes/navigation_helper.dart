import 'package:flutter/material.dart';

/// Extension providing navigation helper methods on BuildContext.
extension Navigation on BuildContext {
  /// Pushes a named route onto the navigator stack.
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  /// Replaces the current route with a named route on the navigator stack.
  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);
  }

  /// Pushes a named route onto the navigator stack and removes all previous routes until a specified predicate is true.
  Future<dynamic> pushNamedAndRemoveUntil(String routeName, {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  /// Pushes a route onto the navigator stack and removes all previous routes until a specified predicate is true.
  Future<dynamic> push(newRoute) {
    return Navigator.push(this, newRoute);
  }

  /// Pushes a route onto the navigator stack and removes all previous routes until a specified predicate is true.
  Future<dynamic> pushAndRemoveUntil(newRoute, predicate) {
    return Navigator.pushAndRemoveUntil(this, newRoute, predicate);
  }

  /// Pops the current route off the navigator stack.
  void pop() => Navigator.of(this).pop();
}
