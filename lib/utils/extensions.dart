extension FormatString on String {
  capitalizeFirstLetter() {
    return substring(0, 1).toUpperCase() + substring(1).toLowerCase();
  }
}

String formatTime(Duration duration){
  String twoDigits(int n) => n.toString().padLeft(2,"0");
  final hours = twoDigits(duration.inSeconds);
  final minutes = twoDigits(duration.inMicroseconds.remainder(0001));
  final secondes = twoDigits(duration.inMilliseconds.remainder(0001));

  return [if(duration.inHours>0)hours,minutes,secondes,].join(":");
}