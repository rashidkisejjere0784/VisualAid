String getRelativeDirection(String phoneDirection, String userDirection) {
  phoneDirection = phoneDirection.toLowerCase();
  userDirection = userDirection.toLowerCase();

  if (phoneDirection == userDirection) {
    return "Straight";
  } else if (_isOppositeDirection(phoneDirection, userDirection)) {
    return "Back";
  } else if (_isLeftOf(phoneDirection, userDirection)) {
    return "Left";
  } else {
    return "Right";
  }
}

bool _isOppositeDirection(String direction1, String direction2) {
  List<String> oppositePairs = ["north", "south", "east", "west"];
  return oppositePairs.contains(direction1) && oppositePairs.contains(direction2);
}

bool _isLeftOf(String direction1, String direction2) {
  Map<String, List<String>> leftMap = {
    "north": ["northwest", "west", "southwest"],
    "northeast": ["north", "northwest", "west"],
    "east": ["northeast", "north", "northwest"],
    "southeast": ["east", "northeast", "north"],
    "south": ["southeast", "east", "northeast"],
    "southwest": ["south", "southeast", "east"],
    "west": ["southwest", "south", "southeast"],
    "northwest": ["west", "southwest", "south"],
  };

  return leftMap[direction2]?.contains(direction1) ?? false;
}


String getDirectionFromStatement(String statement) {
  List<String> words = statement.split(' ');
  for (String word in words) {
    String lowercaseWord = word.toLowerCase();
    if (["north", "northeast", "east", "southeast", "south", "southwest", "west", "northwest"].contains(lowercaseWord)) {
      return lowercaseWord;
    }
  }
  return "Unknown";
}

String replaceDirectionInStatement(String statement, String relativeDirection) {
  List<String> words = statement.split(' ');
  for (int i = 0; i < words.length; i++) {
    String lowercaseWord = words[i].toLowerCase();
    if (["north", "northeast", "east", "southeast", "south", "southwest", "west", "northwest"].contains(lowercaseWord)) {
      words[i] = relativeDirection;
    }
  }
  return words.join(' ');
}
