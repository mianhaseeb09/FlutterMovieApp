import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/movie.dart';
import 'package:movie_app/movie_ui/movie_ui.dart';

class MovieListView extends StatelessWidget {


  final List<Movie> movieList = Movie.getMovies();
  final List movies = [
    "Titanic",
    "Titanic",
    "Titanic",
    "Titanic",
    "Titanic",
    "Titanic",
    "Titanic",


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
                children:<Widget>[
                 movieCard(movieList[index], context),
                  Positioned(
                    top: 10.0,
                      child: movieImage(movieList[index].images[0])),

                ]);

            // return Card(
            //
            //   elevation: 4.5,
            //   color: Colors.white,
            //   child: ListTile(
            //     leading: CircleAvatar(
            //       child: Container(
            //         width: 200,
            //         height: 200,
            //         decoration: BoxDecoration(
            //           image: DecorationImage(
            //             image: NetworkImage(
            //               movieList[index].images[0]),
            //             fit:BoxFit.cover
            //           ),
            //           // color: Colors.blue,
            //           borderRadius: BorderRadius.circular(13.9)
            //         ),
            //         child: null,
            //       ),
            //     ),
            //     trailing: Text("..."),
            //     title: Text(movieList[index].title),
            //     subtitle: Text("${movieList[0].title}"),
            //     onTap: (){
            //
            //
            //
            //       Navigator.push(context, MaterialPageRoute(
            //         builder: (context)=>MovieListViewDetails(movieName: movieList.elementAt(index).title,
            //             movie: movieList[index])));
            //     },
            //     // onTap: ()=>debugPrint("Movie Name:${movies.elementAt(index)}"),
            //   ),
            // );
          }),
    );
  }


  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 60),
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: 120.0,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 54.0),
            child:Padding(
              padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      Text(movie.title,style:
                        TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                          color: Colors.white
                        ),),
                      Text("Rating:${movie.imdbRating} / 10",
                    style:
                    TextStyle(
                      fontSize:15.0,
                      color:Colors.grey

                    ),
                      )
                    ]

                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text("Released:${movie.released}"),

                    Text(movie.runtime,
                      style:
                      TextStyle(
                          fontSize:15.0,
                          color:Colors.grey

                      ),
                    ),
                    Text(movie.rated,
                      style:
                      TextStyle(
                          fontSize:15.0,
                          color:Colors.grey

                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          ),
        ),
      ),


      onTap: () =>
      {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) =>
                MovieListViewDetails(movieName: movie
                    .title,
                    movie: movie)))
      },
    );
  }
  Widget movieImage(String imageUrl) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            image: NetworkImage(imageUrl ??
                'https://www.bing.com/th?id=AMMS_25aafff96e582292821eaec05244b6d8&w=123&h=183&c=8&rs=1&o=5&pid=3.1&rm=2'),
            fit: BoxFit.cover
        ),
      ),
    );
  }
}
// new route or screen page
class MovieListViewDetails extends StatelessWidget {
  final String movieName;
  final Movie movie;

  const MovieListViewDetails({Key key, this.movieName, this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: ListView(
        children: <Widget>[
          MovieNameThumbnail(thumbnail: movie.images[0]),
          MovieDetailWithHeaderPoster(movie: movie),
          HorizontalLine(),
          MovieDetailsCast(movie: movie),
          HorizontalLine(),
          MovieDetailsExtraPoster(posters: movie.images,)
        ],
      ),


    );
  }
}







