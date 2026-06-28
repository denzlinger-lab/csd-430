package movieList;

import java.io.Serializable;

/**
 * Represents a single movie entry.
 * Implements Serializable to be compliant with JavaBean standards.
 */
public class Movie implements Serializable {
    private String title;
    private String year;
    private String studio;
    private String director; // Added to meet 5-field minimum
    private String genre;    // Added to meet 5-field minimum

    public Movie(String title, String year, String studio, String director, String genre) {
        this.title = title;
        this.year = year;
        this.studio = studio;
        this.director = director;
        this.genre = genre;
    }

    // Getters
    public String getTitle() { return title; }
    public String getYear() { return year; }
    public String getStudio() { return studio; }
    public String getDirector() { return director; }
    public String getGenre() { return genre; }
}