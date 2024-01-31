
String getCardinalDirection(double heading) {
  if (heading >= 337.5 || heading < 22.5) {
    return "North";
  } else if (heading >= 22.5 && heading < 67.5) {
    return "NorthEast";
  } else if (heading >= 67.5 && heading < 112.5) {
    return "East";
  } else if (heading >= 112.5 && heading < 157.5) {
    return "SouthEast";
  } else if (heading >= 157.5 && heading < 202.5) {
    return "South";
  } else if (heading >= 202.5 && heading < 247.5) {
    return "SouthWest";
  } else if (heading >= 247.5 && heading < 292.5) {
    return "West";
  } else {
    return "NorthWest";
  }
}
