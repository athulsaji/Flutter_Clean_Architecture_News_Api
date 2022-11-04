import 'package:floor/floor.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/utils/constants.dart';
import '../../../../domain/entities/article.dart';

abstract class ArticleDao {
  @Query('SELECT * FROM $kArticlesTableName')
  Future<List<Article>> getAllArticles();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertArticle(Article article);

  @delete
  Future<void> deleteArticle(Article article);
}
