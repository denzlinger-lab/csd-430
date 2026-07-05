package movieList;

// package movieList;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Holds the list of movies for display.
 */
public class MovieCatalogBean implements Serializable {
    private List<Movie> movieList = new ArrayList<>();

    public MovieCatalogBean() {
    	// movie titles from module 2
        movieList.add(new Movie("Reservoir Dogs", "1992", "Miramax", "Quentin Tarantino", "Crime"));
        movieList.add(new Movie("Pulp Fiction", "1994", "Miramax", "Quentin Tarantino", "Crime"));
        movieList.add(new Movie("Jackie Brown", "1997", "Miramax Films", "Quentin Tarantino", "Crime"));
        movieList.add(new Movie("Kill Bill: Volume 1", "2003", "Miramax Films", "Quentin Tarantino", "Crime"));
        movieList.add(new Movie("Kill Bill: Volume 2", "2004", "Miramax Films", "Quentin Tarantino", "Crime"));
        movieList.add(new Movie("Death Proof", "2007", "The Weinstein Company", "Quentin Tarantino", "Crime"));
        movieList.add(new Movie("Inglourious Basterds", "2009", "The Weinstein Company / Universal Pictures", "Quentin Tarantino", "Crime"));
        movieList.add(new Movie("Django Unchained", "2012", "The Weinstein Company / Sony Pictures Releasing", "Quentin Tarantino", "Crime"));
        movieList.add(new Movie("The Hateful Eight", "2015", "The Weinstein Company", "Quentin Tarantino", "Crime"));
        movieList.add(new Movie("Once Upon a Time... in Hollywood", "2019", "Sony Pictures Releasing", "Quentin Tarantino", "Crime"));

    }

    public List<Movie> getMovieList() { return movieList; }
}