class WorkingDirectory {
  WorkingDirectory._();

  static String _dir = '';
  static String get dir => _dir;

  static String get libDir => '$_dir/lib';
  static String get webDir => '$_dir/web';

  static void setDir(String value) {
    _dir = value;
  }
}
