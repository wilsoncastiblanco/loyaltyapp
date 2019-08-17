class Quake {
  final double mag;
  final String place;
  final String title;
  final int time;

  Quake(this.mag, this.place, this.title, this.time);

  factory Quake.fromJson(Map<String, dynamic> json) {
    return new Quake(json['mag'].toDouble(), json['place'], json['title'], json['time']);
  }
}