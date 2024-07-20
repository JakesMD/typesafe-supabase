/// Represents the possible ways in which two tables can be joined.
enum SupaJoinType {
  /// A one-to-one join
  oneToOne,

  /// A one-to-many join
  oneToMany,

  /// A many-to-many join
  manyToMany,
}
