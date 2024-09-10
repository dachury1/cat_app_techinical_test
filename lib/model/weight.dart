// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Weight {
  final String imperial;
  final String metric;
  Weight({
    required this.imperial,
    required this.metric,
  });



  Weight copyWith({
    String? imperial,
    String? metric,
  }) {
    return Weight(
      imperial: imperial ?? this.imperial,
      metric: metric ?? this.metric,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imperial': imperial,
      'metric': metric,
    };
  }

  factory Weight.fromMap(Map<String, dynamic> map) {
    return Weight(
      imperial: map['imperial'] as String,
      metric: map['metric'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Weight.fromJson(String source) => Weight.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Weight(imperial: $imperial, metric: $metric)';

  @override
  bool operator ==(covariant Weight other) {
    if (identical(this, other)) return true;
  
    return 
      other.imperial == imperial &&
      other.metric == metric;
  }

  @override
  int get hashCode => imperial.hashCode ^ metric.hashCode;
}
