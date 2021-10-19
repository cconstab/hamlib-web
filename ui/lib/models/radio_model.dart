class HamRadio {
  String? radioName;
  bool? active;
  int? vfoaFrequency;
  String? vfoaModulationMode;
  String? vfoaOperatingMode;
  int? vfobFrequency;
  String? vfobModulationMode;
  String? vfobOperatingMode;
  String? ipAddress;
  int? portNumber;

  HamRadio(
      {required this.radioName,
       this.active = false,
       this.vfoaFrequency,
       this.vfoaModulationMode,
       this.vfoaOperatingMode,
       this.vfobFrequency,
       this.vfobModulationMode,
       this.vfobOperatingMode,
      required this.ipAddress,
      required this.portNumber});
}
