import 'package:logger/logger.dart';

class Log {
  static final Logger _logger = Logger();

  static d(String arg) => _logger.d("[DEBUG] $arg");
}
