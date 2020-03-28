class Meter {
  int id;
  double reading, consumption30day;
  int rank;
  String community, city, state;

  double convertToGas() {
    return this.reading * 0.031;
  }

  Meter({this.id, this.reading, this.consumption30day, this.city, this.community, this.rank, this.state});
}