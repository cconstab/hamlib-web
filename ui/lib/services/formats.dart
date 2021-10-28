String frequencyFormat(String frequency) {
  frequency = frequency.padLeft(9, '0');
  String formatFrequency = frequency;
  var len = frequency.length;
  String first = '';
  String second = '';
  String third = '';
  if (len > 0) {
    print(frequency);
    third = frequency.substring(len - 3, len);
  }
  if (len > 3) {
    second = frequency.substring(len - 6, len - 3);
  }
  if (len > 6) {
    first = frequency.substring(0, len - 6);
  }
  formatFrequency = first + '.' + second + '.' + third;
  return formatFrequency;
}
