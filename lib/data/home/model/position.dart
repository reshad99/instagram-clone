class Position {
  dynamic dx;
  dynamic dy;

  Position({
    this.dx,
    this.dy,
  });

  Position copyWith({
    int? dx,
    int? dy,
  }) =>
      Position(
        dx: dx ?? this.dx,
        dy: dy ?? this.dy,
      );

  factory Position.fromJson(Map<String, dynamic> json) => Position(
        dx: json["dx"],
        dy: json["dy"],
      );

  Map<String, dynamic> toJson() => {
        "dx": dx,
        "dy": dy,
      };
}
