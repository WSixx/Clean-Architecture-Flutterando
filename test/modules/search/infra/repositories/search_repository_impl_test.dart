import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arch_flutterando/modules/search/domain/entities/result_search.dart';
import 'package:flutter_clean_arch_flutterando/modules/search/domain/errors/errors.dart';
import 'package:flutter_clean_arch_flutterando/modules/search/infra/datasource/search_datasource.dart';
import 'package:flutter_clean_arch_flutterando/modules/search/infra/models/result_search_model.dart';
import 'package:flutter_clean_arch_flutterando/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchDatasourceMock extends Mock implements SearchDatasource {}

main() {
  final datasoruce = SearchDatasourceMock();
  final repository = SearchRepositoryImpl(datasoruce);
  test('deve retornar uma Lista de ResultSearch', () async {
    when(datasoruce.getSearch(any))
        .thenAnswer((_) async => <ResultSearchModel>[]);
    final result = await repository.search('searchText');

    expect(result | null, isA<List<ResultSearch>>());
  });

  test('deve retornar um DataSourceError se o datasource falhar', () async {
    when(datasoruce.getSearch(any)).thenThrow(Exception());
    final result = await repository.search('searchText');

    expect(result.fold(id, id), isA<DataSourceError>());
  });
}
