import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_architecture/src/domain/entities/article.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/usecases/get_saved_articles_usecase.dart';
import '../../../domain/usecases/remove_article_usecase.dart';
import '../../../domain/usecases/save_article_usecase.dart';

part 'local_articles_event.dart';
part 'local_articles_state.dart';

class LocalArticlesBloc extends Bloc<LocalArticlesEvent, LocalArticlesState> {
  final GetSavedArticlesUseCase _getSavedArticlesUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveArticlesUseCase _removeArticlesUseCase;

  LocalArticlesBloc(this._getSavedArticlesUseCase, this._saveArticleUseCase,
      this._removeArticlesUseCase)
      : super(LocalArticlesLoading());
  @override
  Stream<LocalArticlesState> mapEventToState(LocalArticlesEvent event) async* {
    if (event is GetAllSavedArticles) {
      yield* _getAllSavedArticles();
    }
    if (event is RemoveArticle) {
      await _removeArticlesUseCase(params: event.article);
      yield* _getAllSavedArticles();
    }
    if (event is SaveArticle) {
      await _saveArticleUseCase(params: event.article);
      yield* _getAllSavedArticles();
    }
  }

  Stream<LocalArticlesState> _getAllSavedArticles() async* {
    final articles = await _getSavedArticlesUseCase();
    yield LocalArticlesDone(articles);
  }
}
