// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contratista.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetContratistaCollection on Isar {
  IsarCollection<Contratista> get contratistas => this.collection();
}

const ContratistaSchema = CollectionSchema(
  name: r'Contratista',
  id: 2784983318032468640,
  properties: {
    r'actividad': PropertySchema(
      id: 0,
      name: r'actividad',
      type: IsarType.string,
    ),
    r'empresa': PropertySchema(
      id: 1,
      name: r'empresa',
      type: IsarType.string,
    ),
    r'fechaInduccion': PropertySchema(
      id: 2,
      name: r'fechaInduccion',
      type: IsarType.dateTime,
    ),
    r'lugar': PropertySchema(
      id: 3,
      name: r'lugar',
      type: IsarType.string,
    ),
    r'nombre': PropertySchema(
      id: 4,
      name: r'nombre',
      type: IsarType.string,
    ),
    r'tieneInduccion': PropertySchema(
      id: 5,
      name: r'tieneInduccion',
      type: IsarType.bool,
    ),
    r'ubicacion': PropertySchema(
      id: 6,
      name: r'ubicacion',
      type: IsarType.string,
    )
  },
  estimateSize: _contratistaEstimateSize,
  serialize: _contratistaSerialize,
  deserialize: _contratistaDeserialize,
  deserializeProp: _contratistaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _contratistaGetId,
  getLinks: _contratistaGetLinks,
  attach: _contratistaAttach,
  version: '3.1.0+1',
);

int _contratistaEstimateSize(
  Contratista object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.actividad.length * 3;
  bytesCount += 3 + object.empresa.length * 3;
  bytesCount += 3 + object.lugar.length * 3;
  bytesCount += 3 + object.nombre.length * 3;
  bytesCount += 3 + object.ubicacion.length * 3;
  return bytesCount;
}

void _contratistaSerialize(
  Contratista object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.actividad);
  writer.writeString(offsets[1], object.empresa);
  writer.writeDateTime(offsets[2], object.fechaInduccion);
  writer.writeString(offsets[3], object.lugar);
  writer.writeString(offsets[4], object.nombre);
  writer.writeBool(offsets[5], object.tieneInduccion);
  writer.writeString(offsets[6], object.ubicacion);
}

Contratista _contratistaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Contratista();
  object.actividad = reader.readString(offsets[0]);
  object.empresa = reader.readString(offsets[1]);
  object.fechaInduccion = reader.readDateTime(offsets[2]);
  object.id = id;
  object.lugar = reader.readString(offsets[3]);
  object.nombre = reader.readString(offsets[4]);
  object.tieneInduccion = reader.readBool(offsets[5]);
  object.ubicacion = reader.readString(offsets[6]);
  return object;
}

P _contratistaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _contratistaGetId(Contratista object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _contratistaGetLinks(Contratista object) {
  return [];
}

void _contratistaAttach(
    IsarCollection<dynamic> col, Id id, Contratista object) {
  object.id = id;
}

extension ContratistaQueryWhereSort
    on QueryBuilder<Contratista, Contratista, QWhere> {
  QueryBuilder<Contratista, Contratista, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ContratistaQueryWhere
    on QueryBuilder<Contratista, Contratista, QWhereClause> {
  QueryBuilder<Contratista, Contratista, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<Contratista, Contratista, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterWhereClause> idBetween(
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
}

extension ContratistaQueryFilter
    on QueryBuilder<Contratista, Contratista, QFilterCondition> {
  QueryBuilder<Contratista, Contratista, QAfterFilterCondition>
      actividadEqualTo(
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

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition>
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

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition>
      actividadLessThan(
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

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition>
      actividadBetween(
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

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition>
      actividadStartsWith(
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

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition>
      actividadEndsWith(
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

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition>
      actividadContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'actividad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition>
      actividadMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'actividad',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition>
      actividadIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actividad',
        value: '',
      ));
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition>
      actividadIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'actividad',
        value: '',
      ));
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition> empresaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'empresa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition>
      empresaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'empresa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition> empresaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'empresa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition> empresaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'empresa',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition>
      empresaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'empresa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition> empresaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'empresa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition> empresaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'empresa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition> empresaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'empresa',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition>
      empresaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'empresa',
        value: '',
      ));
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition>
      empresaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'empresa',
        value: '',
      ));
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition>
      fechaInduccionEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaInduccion',
        value: value,
      ));
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition>
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

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition>
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

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition>
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

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition> lugarEqualTo(
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

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition>
      lugarGreaterThan(
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

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition> lugarLessThan(
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

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition> lugarBetween(
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

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition> lugarStartsWith(
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

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition> lugarEndsWith(
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

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition> lugarContains(
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

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition> lugarMatches(
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

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition> lugarIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lugar',
        value: '',
      ));
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition>
      lugarIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lugar',
        value: '',
      ));
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition> nombreEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition>
      nombreGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition> nombreLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition> nombreBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nombre',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition>
      nombreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition> nombreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition> nombreContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition> nombreMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition>
      nombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition>
      nombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition>
      tieneInduccionEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tieneInduccion',
        value: value,
      ));
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition>
      ubicacionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ubicacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition>
      ubicacionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ubicacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition>
      ubicacionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ubicacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition>
      ubicacionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ubicacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition>
      ubicacionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ubicacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition>
      ubicacionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ubicacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition>
      ubicacionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ubicacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition>
      ubicacionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ubicacion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition>
      ubicacionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ubicacion',
        value: '',
      ));
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterFilterCondition>
      ubicacionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ubicacion',
        value: '',
      ));
    });
  }
}

extension ContratistaQueryObject
    on QueryBuilder<Contratista, Contratista, QFilterCondition> {}

extension ContratistaQueryLinks
    on QueryBuilder<Contratista, Contratista, QFilterCondition> {}

extension ContratistaQuerySortBy
    on QueryBuilder<Contratista, Contratista, QSortBy> {
  QueryBuilder<Contratista, Contratista, QAfterSortBy> sortByActividad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actividad', Sort.asc);
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterSortBy> sortByActividadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actividad', Sort.desc);
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterSortBy> sortByEmpresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'empresa', Sort.asc);
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterSortBy> sortByEmpresaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'empresa', Sort.desc);
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterSortBy> sortByFechaInduccion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaInduccion', Sort.asc);
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterSortBy>
      sortByFechaInduccionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaInduccion', Sort.desc);
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterSortBy> sortByLugar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lugar', Sort.asc);
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterSortBy> sortByLugarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lugar', Sort.desc);
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterSortBy> sortByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterSortBy> sortByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterSortBy> sortByTieneInduccion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tieneInduccion', Sort.asc);
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterSortBy>
      sortByTieneInduccionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tieneInduccion', Sort.desc);
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterSortBy> sortByUbicacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ubicacion', Sort.asc);
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterSortBy> sortByUbicacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ubicacion', Sort.desc);
    });
  }
}

extension ContratistaQuerySortThenBy
    on QueryBuilder<Contratista, Contratista, QSortThenBy> {
  QueryBuilder<Contratista, Contratista, QAfterSortBy> thenByActividad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actividad', Sort.asc);
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterSortBy> thenByActividadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actividad', Sort.desc);
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterSortBy> thenByEmpresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'empresa', Sort.asc);
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterSortBy> thenByEmpresaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'empresa', Sort.desc);
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterSortBy> thenByFechaInduccion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaInduccion', Sort.asc);
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterSortBy>
      thenByFechaInduccionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaInduccion', Sort.desc);
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterSortBy> thenByLugar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lugar', Sort.asc);
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterSortBy> thenByLugarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lugar', Sort.desc);
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterSortBy> thenByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterSortBy> thenByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterSortBy> thenByTieneInduccion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tieneInduccion', Sort.asc);
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterSortBy>
      thenByTieneInduccionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tieneInduccion', Sort.desc);
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterSortBy> thenByUbicacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ubicacion', Sort.asc);
    });
  }

  QueryBuilder<Contratista, Contratista, QAfterSortBy> thenByUbicacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ubicacion', Sort.desc);
    });
  }
}

extension ContratistaQueryWhereDistinct
    on QueryBuilder<Contratista, Contratista, QDistinct> {
  QueryBuilder<Contratista, Contratista, QDistinct> distinctByActividad(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actividad', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Contratista, Contratista, QDistinct> distinctByEmpresa(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'empresa', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Contratista, Contratista, QDistinct> distinctByFechaInduccion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaInduccion');
    });
  }

  QueryBuilder<Contratista, Contratista, QDistinct> distinctByLugar(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lugar', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Contratista, Contratista, QDistinct> distinctByNombre(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Contratista, Contratista, QDistinct> distinctByTieneInduccion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tieneInduccion');
    });
  }

  QueryBuilder<Contratista, Contratista, QDistinct> distinctByUbicacion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ubicacion', caseSensitive: caseSensitive);
    });
  }
}

extension ContratistaQueryProperty
    on QueryBuilder<Contratista, Contratista, QQueryProperty> {
  QueryBuilder<Contratista, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Contratista, String, QQueryOperations> actividadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actividad');
    });
  }

  QueryBuilder<Contratista, String, QQueryOperations> empresaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'empresa');
    });
  }

  QueryBuilder<Contratista, DateTime, QQueryOperations>
      fechaInduccionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaInduccion');
    });
  }

  QueryBuilder<Contratista, String, QQueryOperations> lugarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lugar');
    });
  }

  QueryBuilder<Contratista, String, QQueryOperations> nombreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombre');
    });
  }

  QueryBuilder<Contratista, bool, QQueryOperations> tieneInduccionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tieneInduccion');
    });
  }

  QueryBuilder<Contratista, String, QQueryOperations> ubicacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ubicacion');
    });
  }
}
