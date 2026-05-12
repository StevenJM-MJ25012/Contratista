// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'induction_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetInductionCollection on Isar {
  IsarCollection<Induction> get inductions => this.collection();
}

const InductionSchema = CollectionSchema(
  name: r'Induction',
  id: 5873458249029804021,
  properties: {
    r'actividad': PropertySchema(
      id: 0,
      name: r'actividad',
      type: IsarType.string,
    ),
    r'completada': PropertySchema(
      id: 1,
      name: r'completada',
      type: IsarType.bool,
    ),
    r'fechaCreacion': PropertySchema(
      id: 2,
      name: r'fechaCreacion',
      type: IsarType.dateTime,
    ),
    r'fechaInduccion': PropertySchema(
      id: 3,
      name: r'fechaInduccion',
      type: IsarType.dateTime,
    ),
    r'lugar': PropertySchema(
      id: 4,
      name: r'lugar',
      type: IsarType.string,
    ),
    r'nombreContratista': PropertySchema(
      id: 5,
      name: r'nombreContratista',
      type: IsarType.string,
    ),
    r'notas': PropertySchema(
      id: 6,
      name: r'notas',
      type: IsarType.string,
    )
  },
  estimateSize: _inductionEstimateSize,
  serialize: _inductionSerialize,
  deserialize: _inductionDeserialize,
  deserializeProp: _inductionDeserializeProp,
  idName: r'id',
  indexes: {
    r'nombreContratista': IndexSchema(
      id: -7683375739528026526,
      name: r'nombreContratista',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'nombreContratista',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'fechaInduccion': IndexSchema(
      id: 3699302455805736929,
      name: r'fechaInduccion',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'fechaInduccion',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'completada': IndexSchema(
      id: -335539268831112890,
      name: r'completada',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'completada',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _inductionGetId,
  getLinks: _inductionGetLinks,
  attach: _inductionAttach,
  version: '3.1.0+1',
);

int _inductionEstimateSize(
  Induction object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.actividad.length * 3;
  bytesCount += 3 + object.lugar.length * 3;
  bytesCount += 3 + object.nombreContratista.length * 3;
  bytesCount += 3 + object.notas.length * 3;
  return bytesCount;
}

void _inductionSerialize(
  Induction object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.actividad);
  writer.writeBool(offsets[1], object.completada);
  writer.writeDateTime(offsets[2], object.fechaCreacion);
  writer.writeDateTime(offsets[3], object.fechaInduccion);
  writer.writeString(offsets[4], object.lugar);
  writer.writeString(offsets[5], object.nombreContratista);
  writer.writeString(offsets[6], object.notas);
}

Induction _inductionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Induction(
    actividad: reader.readString(offsets[0]),
    completada: reader.readBoolOrNull(offsets[1]) ?? false,
    fechaInduccion: reader.readDateTime(offsets[3]),
    lugar: reader.readString(offsets[4]),
    nombreContratista: reader.readString(offsets[5]),
    notas: reader.readStringOrNull(offsets[6]) ?? '',
  );
  object.fechaCreacion = reader.readDateTime(offsets[2]);
  object.id = id;
  return object;
}

P _inductionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset) ?? '') as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _inductionGetId(Induction object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _inductionGetLinks(Induction object) {
  return [];
}

void _inductionAttach(IsarCollection<dynamic> col, Id id, Induction object) {
  object.id = id;
}

extension InductionQueryWhereSort
    on QueryBuilder<Induction, Induction, QWhere> {
  QueryBuilder<Induction, Induction, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Induction, Induction, QAfterWhere> anyFechaInduccion() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'fechaInduccion'),
      );
    });
  }

  QueryBuilder<Induction, Induction, QAfterWhere> anyCompletada() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'completada'),
      );
    });
  }
}

extension InductionQueryWhere
    on QueryBuilder<Induction, Induction, QWhereClause> {
  QueryBuilder<Induction, Induction, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Induction, Induction, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Induction, Induction, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Induction, Induction, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterWhereClause>
      nombreContratistaEqualTo(String nombreContratista) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'nombreContratista',
        value: [nombreContratista],
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterWhereClause>
      nombreContratistaNotEqualTo(String nombreContratista) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nombreContratista',
              lower: [],
              upper: [nombreContratista],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nombreContratista',
              lower: [nombreContratista],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nombreContratista',
              lower: [nombreContratista],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nombreContratista',
              lower: [],
              upper: [nombreContratista],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Induction, Induction, QAfterWhereClause> fechaInduccionEqualTo(
      DateTime fechaInduccion) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'fechaInduccion',
        value: [fechaInduccion],
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterWhereClause>
      fechaInduccionNotEqualTo(DateTime fechaInduccion) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fechaInduccion',
              lower: [],
              upper: [fechaInduccion],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fechaInduccion',
              lower: [fechaInduccion],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fechaInduccion',
              lower: [fechaInduccion],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fechaInduccion',
              lower: [],
              upper: [fechaInduccion],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Induction, Induction, QAfterWhereClause>
      fechaInduccionGreaterThan(
    DateTime fechaInduccion, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'fechaInduccion',
        lower: [fechaInduccion],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterWhereClause> fechaInduccionLessThan(
    DateTime fechaInduccion, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'fechaInduccion',
        lower: [],
        upper: [fechaInduccion],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterWhereClause> fechaInduccionBetween(
    DateTime lowerFechaInduccion,
    DateTime upperFechaInduccion, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'fechaInduccion',
        lower: [lowerFechaInduccion],
        includeLower: includeLower,
        upper: [upperFechaInduccion],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterWhereClause> completadaEqualTo(
      bool completada) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'completada',
        value: [completada],
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterWhereClause> completadaNotEqualTo(
      bool completada) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'completada',
              lower: [],
              upper: [completada],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'completada',
              lower: [completada],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'completada',
              lower: [completada],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'completada',
              lower: [],
              upper: [completada],
              includeUpper: false,
            ));
      }
    });
  }
}

extension InductionQueryFilter
    on QueryBuilder<Induction, Induction, QFilterCondition> {
  QueryBuilder<Induction, Induction, QAfterFilterCondition> actividadEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actividad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition>
      actividadGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actividad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition> actividadLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actividad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition> actividadBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actividad',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition> actividadStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'actividad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition> actividadEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'actividad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition> actividadContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'actividad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition> actividadMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'actividad',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition> actividadIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actividad',
        value: '',
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition>
      actividadIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'actividad',
        value: '',
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition> completadaEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completada',
        value: value,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition>
      fechaCreacionEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition>
      fechaCreacionGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition>
      fechaCreacionLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition>
      fechaCreacionBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaCreacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition>
      fechaInduccionEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaInduccion',
        value: value,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition>
      fechaInduccionGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaInduccion',
        value: value,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition>
      fechaInduccionLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaInduccion',
        value: value,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition>
      fechaInduccionBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaInduccion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition> lugarEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lugar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition> lugarGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lugar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition> lugarLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lugar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition> lugarBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lugar',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition> lugarStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lugar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition> lugarEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lugar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition> lugarContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lugar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition> lugarMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lugar',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition> lugarIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lugar',
        value: '',
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition> lugarIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lugar',
        value: '',
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition>
      nombreContratistaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombreContratista',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition>
      nombreContratistaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nombreContratista',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition>
      nombreContratistaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nombreContratista',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition>
      nombreContratistaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nombreContratista',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition>
      nombreContratistaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nombreContratista',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition>
      nombreContratistaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nombreContratista',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition>
      nombreContratistaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombreContratista',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition>
      nombreContratistaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombreContratista',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition>
      nombreContratistaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombreContratista',
        value: '',
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition>
      nombreContratistaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombreContratista',
        value: '',
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition> notasEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition> notasGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition> notasLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition> notasBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notas',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition> notasStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition> notasEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition> notasContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition> notasMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notas',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition> notasIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notas',
        value: '',
      ));
    });
  }

  QueryBuilder<Induction, Induction, QAfterFilterCondition> notasIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notas',
        value: '',
      ));
    });
  }
}

extension InductionQueryObject
    on QueryBuilder<Induction, Induction, QFilterCondition> {}

extension InductionQueryLinks
    on QueryBuilder<Induction, Induction, QFilterCondition> {}

extension InductionQuerySortBy on QueryBuilder<Induction, Induction, QSortBy> {
  QueryBuilder<Induction, Induction, QAfterSortBy> sortByActividad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actividad', Sort.asc);
    });
  }

  QueryBuilder<Induction, Induction, QAfterSortBy> sortByActividadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actividad', Sort.desc);
    });
  }

  QueryBuilder<Induction, Induction, QAfterSortBy> sortByCompletada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completada', Sort.asc);
    });
  }

  QueryBuilder<Induction, Induction, QAfterSortBy> sortByCompletadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completada', Sort.desc);
    });
  }

  QueryBuilder<Induction, Induction, QAfterSortBy> sortByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<Induction, Induction, QAfterSortBy> sortByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<Induction, Induction, QAfterSortBy> sortByFechaInduccion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaInduccion', Sort.asc);
    });
  }

  QueryBuilder<Induction, Induction, QAfterSortBy> sortByFechaInduccionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaInduccion', Sort.desc);
    });
  }

  QueryBuilder<Induction, Induction, QAfterSortBy> sortByLugar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lugar', Sort.asc);
    });
  }

  QueryBuilder<Induction, Induction, QAfterSortBy> sortByLugarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lugar', Sort.desc);
    });
  }

  QueryBuilder<Induction, Induction, QAfterSortBy> sortByNombreContratista() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreContratista', Sort.asc);
    });
  }

  QueryBuilder<Induction, Induction, QAfterSortBy>
      sortByNombreContratistaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreContratista', Sort.desc);
    });
  }

  QueryBuilder<Induction, Induction, QAfterSortBy> sortByNotas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.asc);
    });
  }

  QueryBuilder<Induction, Induction, QAfterSortBy> sortByNotasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.desc);
    });
  }
}

extension InductionQuerySortThenBy
    on QueryBuilder<Induction, Induction, QSortThenBy> {
  QueryBuilder<Induction, Induction, QAfterSortBy> thenByActividad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actividad', Sort.asc);
    });
  }

  QueryBuilder<Induction, Induction, QAfterSortBy> thenByActividadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actividad', Sort.desc);
    });
  }

  QueryBuilder<Induction, Induction, QAfterSortBy> thenByCompletada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completada', Sort.asc);
    });
  }

  QueryBuilder<Induction, Induction, QAfterSortBy> thenByCompletadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completada', Sort.desc);
    });
  }

  QueryBuilder<Induction, Induction, QAfterSortBy> thenByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<Induction, Induction, QAfterSortBy> thenByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<Induction, Induction, QAfterSortBy> thenByFechaInduccion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaInduccion', Sort.asc);
    });
  }

  QueryBuilder<Induction, Induction, QAfterSortBy> thenByFechaInduccionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaInduccion', Sort.desc);
    });
  }

  QueryBuilder<Induction, Induction, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Induction, Induction, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Induction, Induction, QAfterSortBy> thenByLugar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lugar', Sort.asc);
    });
  }

  QueryBuilder<Induction, Induction, QAfterSortBy> thenByLugarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lugar', Sort.desc);
    });
  }

  QueryBuilder<Induction, Induction, QAfterSortBy> thenByNombreContratista() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreContratista', Sort.asc);
    });
  }

  QueryBuilder<Induction, Induction, QAfterSortBy>
      thenByNombreContratistaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreContratista', Sort.desc);
    });
  }

  QueryBuilder<Induction, Induction, QAfterSortBy> thenByNotas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.asc);
    });
  }

  QueryBuilder<Induction, Induction, QAfterSortBy> thenByNotasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.desc);
    });
  }
}

extension InductionQueryWhereDistinct
    on QueryBuilder<Induction, Induction, QDistinct> {
  QueryBuilder<Induction, Induction, QDistinct> distinctByActividad(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actividad', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Induction, Induction, QDistinct> distinctByCompletada() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completada');
    });
  }

  QueryBuilder<Induction, Induction, QDistinct> distinctByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCreacion');
    });
  }

  QueryBuilder<Induction, Induction, QDistinct> distinctByFechaInduccion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaInduccion');
    });
  }

  QueryBuilder<Induction, Induction, QDistinct> distinctByLugar(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lugar', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Induction, Induction, QDistinct> distinctByNombreContratista(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombreContratista',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Induction, Induction, QDistinct> distinctByNotas(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notas', caseSensitive: caseSensitive);
    });
  }
}

extension InductionQueryProperty
    on QueryBuilder<Induction, Induction, QQueryProperty> {
  QueryBuilder<Induction, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Induction, String, QQueryOperations> actividadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actividad');
    });
  }

  QueryBuilder<Induction, bool, QQueryOperations> completadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completada');
    });
  }

  QueryBuilder<Induction, DateTime, QQueryOperations> fechaCreacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCreacion');
    });
  }

  QueryBuilder<Induction, DateTime, QQueryOperations> fechaInduccionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaInduccion');
    });
  }

  QueryBuilder<Induction, String, QQueryOperations> lugarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lugar');
    });
  }

  QueryBuilder<Induction, String, QQueryOperations>
      nombreContratistaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombreContratista');
    });
  }

  QueryBuilder<Induction, String, QQueryOperations> notasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notas');
    });
  }
}
