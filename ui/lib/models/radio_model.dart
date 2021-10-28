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
      {required this.radioName,
      this.active = false,
      this.vfoaFrequency = '',
      this.vfoaModulationMode = '---',
      this.vfoaOperatingMode = '---',
      this.vfobFrequency = '',
      this.vfobModulationMode = '---',
      this.vfobOperatingMode = '---',
      required this.ipAddress,
      required this.portNumber});

  HamRadio.edited(
      {required this.radioName,
      required this.active,
      this.vfoaFrequency = '',
      this.vfoaModulationMode = '---',
      this.vfoaOperatingMode = '---',
      this.vfobFrequency = '',
      this.vfobModulationMode = '---',
      this.vfobOperatingMode = '---',
      required this.ipAddress,
      required this.portNumber});

  Map<String, dynamic> toJson() => {
        'radioName': radioName,
        'active': active,
        'vfoaFrequency': vfoaFrequency,
        'vfoaModulationMode': vfoaModulationMode,
        'vfoaOperatingMode': vfoaOperatingMode,
        'vfobFrequency': vfobFrequency,
        'vfobModulationMode': vfobModulationMode,
        'vfobOperatingMode': vfobOperatingMode,
        'ipAddress': ipAddress,
        'portNumber': portNumber,
      };

  factory HamRadio.fromJson(Map<String, dynamic> json) {
    return HamRadio(
      radioName: json['radioName'] as String,
      active: json['active'] as bool,
      vfoaFrequency: json['vfoaFrequency'] as String,
      vfoaModulationMode: json['vfoaModulationMode'] as String,
      vfoaOperatingMode: json['vfoaOperatingMode'] as String,
      vfobFrequency: json['vfobFrequency'] as String,
      vfobModulationMode: json['vfobModulationMode'] as String,
      vfobOperatingMode: json['vfobOperatingMode'] as String,
      ipAddress: json['ipAddress'] as String,
      portNumber: json['PortNumber'] as String,
    );
  }

  void vfoaSet(String frequency, String mmode) {
    vfoaFrequency = frequency;
    vfoaModulationMode = mmode;
  }

    void vfobSet(String frequency, String mmode) {
    vfobFrequency = frequency;
    vfobModulationMode = mmode;
  }


}
