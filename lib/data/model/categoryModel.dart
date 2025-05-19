class CategoryModel{
static const String sport='sport';
static const String Movies = 'movies';
static const String Music = 'music';

  String? id;
  String? name;
  String? image;
  CategoryModel({required this.id,required this.name,required this.image});
  CategoryModel.fromdata(this.id){
  switch(id){
    case sport:
      name='sport';
      image='assets/sport.png';
      break;
    case Movies:
      name='Movies';
      image='assets/movies.png';
      break;
    case Music:
      name='Music';
      image='assets/music.png';
      break;
    default:
  }}
 static List<CategoryModel>getCategories(){
  return[
    CategoryModel(id: sport,name: 'sport',image: 'assets/sport.png'),
    CategoryModel(id: Movies,name: 'Movies',image: 'assets/movies.png'),
    CategoryModel(id: Music,name: 'Music',image: 'assets/music.png'),
  ];
}
  }


