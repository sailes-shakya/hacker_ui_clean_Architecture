class ApiUtils {
  static String baseUrl = "https://hn.algolia.com/api/v1";
  static String frontPage(String pageNum) =>
      '/search?tags=front_page&page=$pageNum';
  static String searchNews(String tag) => '/search?query=$tag&tags=story';
}
