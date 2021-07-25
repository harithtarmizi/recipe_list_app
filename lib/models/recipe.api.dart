import 'dart:convert';
import 'package:recipe_list_app/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
//   var req = unirest("GET", "https://yummly2.p.rapidapi.com/feeds/list");

// req.query({
  // "start": "0",
  // "limit": "18",
  // "tag": "list.recipe.popular"
// });

// req.headers({
  // "x-rapidapi-key": "e0fe29785fmsh59ace42c5f4ddeap1dd1d3jsn4ca82a742c4d",
  // "x-rapidapi-host": "yummly2.p.rapidapi.com",
  // "useQueryString": true
// });

  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.http('yummly2.p.rapidapi.com', '/feeds/list', {
      "start": "0",
      "limit": "18",
      "tag": "list.recipe.popular",
    });

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "e0fe29785fmsh59ace42c5f4ddeap1dd1d3jsn4ca82a742c4d",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true",
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapShot(_temp);
  }
}
