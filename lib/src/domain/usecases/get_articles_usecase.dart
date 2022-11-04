import 'package:clean_architecture/src/domain/entities/article.dart';
import 'package:clean_architecture/src/domain/repositories/articles_repository.dart';

import '../../core/params/article_request.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecase.dart';

class GetArticlesUseCase
    implements UseCase<DataState<List<Article>>, ArticlesRequestParams> {
  final ArticlesRepository _articlesRepository;
  GetArticlesUseCase(this._articlesRepository);
  @override
  Future<DataState<List<Article>>> call({ArticlesRequestParams params}) {
    return _articlesRepository.getBreakingNewsArticles(params);
  }
}
