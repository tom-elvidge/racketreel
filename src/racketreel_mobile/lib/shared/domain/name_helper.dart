class NameHelper {
  static String getInitials(String name) {
    // Split the name by spaces
    List<String> words = name.split(' ');

    // Filter out any empty strings (in case of multiple spaces)
    words = words.where((word) => word.isNotEmpty).toList();

    // Map each word to its first character, convert to uppercase, and join them
    String initials = words.map((word) => word[0].toUpperCase()).join('');

    return initials;
  }
}