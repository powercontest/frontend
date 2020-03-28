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


//below is the static data to be used in modeling the UI

List<Meter> meters = [
  Meter(id: 1234, reading: 356, rank: 1, consumption30day: 25),
  Meter(id: 3456, reading: 368, rank: 2, consumption30day: 25),
  Meter(id: 4563, reading: 877, rank: 3, consumption30day: 25),
  Meter(id: 7869, reading: 546, rank: 4, consumption30day: 25),
];