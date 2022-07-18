class Approver {
  
  final String name;
  final int approved;
  final int notApproved;

  Approver({
    required this.name,
    required this.approved,
    required this.notApproved,
  });

  Approver copyWith({
    String? name,
    int? approved,
    int? notApproved,
  }) {
    return Approver(
      name: name ?? this.name,
      approved: approved ?? this.approved,
      notApproved: notApproved ?? this.notApproved,
    );
  }

  @override
  String toString() => 'Approver(name: $name, approved: $approved, notApproved: $notApproved)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Approver &&
      other.name == name &&
      other.approved == approved &&
      other.notApproved == notApproved;
  }

  @override
  int get hashCode => name.hashCode ^ approved.hashCode ^ notApproved.hashCode;
}
