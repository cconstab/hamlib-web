class HamRadio {
  String radioName;
  int vfoaFrequency;
  String vfoaModulationMode;
  String vfoaOperatingMode;
  int vfobFrequency;
  String vfobModulationMode;
  String vfobOperatingMode;
  String ipAddress;
  int portNumber;

  HamRadio(
      {this.radioName,
      this.vfoaFrequency,
      this.vfoaModulationMode,
      this.vfoaOperatingMode,
      this.vfobFrequency,
      this.vfobModulationMode,
      this.vfobOperatingMode,
      this.ipAddress,
      this.portNumber});
}
