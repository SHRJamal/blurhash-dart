class BlurHashDecodeException implements Exception {
  BlurHashDecodeException([
    String message,
  ]) : message = message ?? '';

  final String message;

  @override
  String toString() => 'BlurHashDecodeException: $message';
}

class BlurHashEncodeException implements Exception {
  BlurHashEncodeException([
    String message,
  ]) : message = message ?? '';

  final String message;

  @override
  String toString() => 'BlurHashDecodeException: $message';
}
