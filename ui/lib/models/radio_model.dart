
class HamRadio {
  String radioName;
  bool active;
  String? vfoaFrequency;
  String? vfoaModulationMode;
  String? vfoaOperatingMode;
  String? vfobFrequency;
  String? vfobModulationMode;
  String? vfobOperatingMode;
  String ipAddress;
  String portNumber;

  HamRadio(
      {
      required this.radioName,
      this.active = false,
      this.vfoaFrequency = '0.000.00',
      this.vfoaModulationMode = '---',
      this.vfoaOperatingMode = '----',
      this.vfobFrequency = '0.000.00',
      this.vfobModulationMode = '---',
      this.vfobOperatingMode = '----',
      required this.ipAddress,
      required this.portNumber
      }
      );

  HamRadio.edited(
      {
      required this.radioName,
      required this.active,
      this.vfoaFrequency = '0.000.00',
      this.vfoaModulationMode = '---',
      this.vfoaOperatingMode = '----',
      this.vfobFrequency = '0.000.00',
      this.vfobModulationMode = '---',
      this.vfobOperatingMode = '----',
      required this.ipAddress,
      required this.portNumber
      }
      );




}
