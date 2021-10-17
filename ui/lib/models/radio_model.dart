class HamRadio {
  String radioName;
  bool active;
  int vfoaFrequency;
  String vfoaModulationMode;
  String vfoaOperatingMode;
  int vfobFrequency;
  String vfobModulationMode;
  String vfobOperatingMode;
  String ipAddress;
  int portNumber;

  HamRadio(
      {required this.radioName,
      required this.active,
      required this.vfoaFrequency,
      required this.vfoaModulationMode,
      required this.vfoaOperatingMode,
      required this.vfobFrequency,
      required this.vfobModulationMode,
      required this.vfobOperatingMode,
      required this.ipAddress,
      required this.portNumber});
}
