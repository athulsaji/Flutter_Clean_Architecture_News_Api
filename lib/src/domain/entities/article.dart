import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import '../../core/utils/constants.dart';
import 'source.dart';

@Entity(tableName: kArticlesTableName)
class Article extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final int id;

  final Source source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  const Article(
      {this.id,
      this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});
  List<Object> get props {
    return [
      id,
      source,
      author,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      content
    ];
  }

  bool get stringify => true;
}
