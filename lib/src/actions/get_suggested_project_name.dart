String getSuggestedProjectName(String projectName) {
  final buffer = StringBuffer();

  for (int i = 0; i < projectName.length; i++) {
    final char = projectName[i];
    if (i == 0) {
      if (RegExp(r'[a-z_]').hasMatch(char)) {
        buffer.write(char);
      } else if (RegExp(r'[A-Z]').hasMatch(char)) {
        buffer.write(char.toLowerCase());
      }
    }
    if (i != 0) {
      if (RegExp(r'[a-z0-9_]').hasMatch(char)) {
        buffer.write(char);
      } else if (RegExp(r'[A-Z]').hasMatch(char)) {
        buffer.write(char.toLowerCase());
      }
    }
  }

  return buffer.toString();
}
