import '../../core/usecases/usecase.dart';
import '../entities/article.dart';
import '../repositories/articles_repository.dart';

class RemoveArticlesUseCase implements UseCase<void, Article> {
  final ArticlesRepository _articlesRepository;

  RemoveArticlesUseCase(this._articlesRepository);

  @override
  Future<void> call({Article params}) {
    return _articlesRepository.removedArticle(params);
  }
}
