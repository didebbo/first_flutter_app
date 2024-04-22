import 'package:logger/logger.dart';

class LogManager {
  static final Logger _logger = Logger();

  static debug(String message) => _logger.d("[DEBUG] $message");
  static trace(String message) => _logger.t("[TRACE] $message");
  static info(String message) => _logger.i("[INFO] $message");
  static warning(String message) => _logger.w("[WARNING] $message");
  static error(String message) => _logger.e("[ERROR] $message");
  static fatal(String message) => _logger.f("[FATAL] $message");
}
