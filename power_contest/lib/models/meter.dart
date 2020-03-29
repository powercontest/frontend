class Meter {
  int id;
  double reading;
  int rank;
  String community, city, state, owner;

  Meter({this.id, this.reading, this.city, this.community, this.rank, this.state, this.owner});
}


//below is the static data to be used in modeling the UI

List<Meter> meters = [
  Meter(id: 9846, reading: 532, rank: 1, owner: "Yoseph"),
  Meter(id: 3456, reading: 469, rank: 2, owner: "Luis"),
  Meter(id: 4563, reading: 297, rank: 3, owner: "Dhruv"),
  Meter(id: 2345, reading: 157, rank: 4, owner: "Jojo"),
  Meter(id: 2345, reading: 98, rank: 5, owner: "Abcd"),
  Meter(id: 245234, reading: 76, rank: 6, owner: "Abebe"),
  Meter(id: 456243, reading: 54, rank: 7, owner: "Kebede"),
  Meter(id: 2435, reading: 43, rank: 8, owner: "Chala"),
];