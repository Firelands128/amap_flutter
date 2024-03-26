part of '../amap_flutter.dart';

/// The error for provided unknown map id
class UnknownMapIDError extends Error {
  /// Creates an assertion error with the provided [mapId] and optional [message].
  UnknownMapIDError(this.mapId, [this.message]);

  /// The unknown ID.
  final int mapId;

  /// Message describing the assertion error.
  final Object? message;

  @override
  String toString() {
    if (message != null) {
      return "Unknown map ID $mapId: ${Error.safeToString(message)}";
    }
    return "Unknown map ID $mapId";
  }
}
