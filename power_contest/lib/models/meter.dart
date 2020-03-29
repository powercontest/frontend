class Meter {
  int id;
  double reading, consumption30day;
  int rank;
  String community, city, state, owner;

  Meter({this.id, this.reading, this.consumption30day, this.city, this.community, this.rank, this.state, this.owner});
}


//below is the static data to be used in modeling the UI

List<Meter> meters = [
  Meter(id: 9846, reading: 532, rank: 1, consumption30day: 25),
  Meter(id: 3456, reading: 469, rank: 2, consumption30day: 25),
  Meter(id: 4563, reading: 297, rank: 3, consumption30day: 25),
  Meter(id: 2345, reading: 157, rank: 4, consumption30day: 25),
  Meter(id: 2345, reading: 98, rank: 5, consumption30day: 25),
  Meter(id: 245234, reading: 76, rank: 6, consumption30day: 25),
  Meter(id: 456243, reading: 54, rank: 7, consumption30day: 25),
  Meter(id: 2435, reading: 43, rank: 8, consumption30day: 25),
];