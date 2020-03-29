class JsonMeter {
  int end;
  int endConsumption;
  String owner;
  int start;
  int startConsumption;
  double reading;
  String id;
  String city = "Herndon";
  String state = "VA";

  JsonMeter(
      {this.end,
      this.endConsumption,
      this.owner,
      this.start,
      this.startConsumption,
      this.reading,
      this.id,
      this.city,
      this.state});

  JsonMeter.fromJson(Map json) : 
    end = json['end'],
    endConsumption = json['endConsumption'],
    owner = json['name'],
    start = json['start'],
    startConsumption = json['startConsumption'],
    reading = json['adjusted'],
    id = json['meterID'];
  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['end'] = this.end;
    data['endConsumption'] = this.endConsumption;
    data['name'] = this.owner;
    data['start'] = this.start;
    data['startConsumption'] = this.startConsumption;
    data['adjusted'] = this.reading;
    data['meterID'] = this.id;
    return data;
  }
}