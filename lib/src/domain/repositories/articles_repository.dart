import '../../core/params/article_request.dart';
import '../../core/resources/data_state.dart';
import '../entities/article.dart';

abstract class ArticlesRepository {
  Future<DataState<List<Article>>> getBreakingNewsArticles(
      ArticlesRequestParams params);

  Future<List<Article>> getSavedArticles();

  Future<void> saveArticle(Article article);

  Future<void> removedArticle(Article article);
}
