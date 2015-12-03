//
//  OMDBClient.swift
//  OMDB Demo
//
//  Created by Schubert David Rodríguez on 03/12/15.
//  Copyright © 2015 Schubert David Rodríguez. All rights reserved.
//

import Foundation

class OMDBClient {
    
    static func searchMovieBy(query:String, completionHandler: ([Movie]?, NSError?) -> Void) -> Void {

        guard let url = NSURL(string: "http://www.omdbapi.com/?s=" + query) else{
            return;
        }
        
        let session = NSURLSession.sharedSession();
        let sessionTask = session.dataTaskWithURL(url) { (data, response, error) -> Void in
            let movies = parseMovies(data);
            completionHandler(movies, error);
        }
        sessionTask.resume();
    }
    
    static func parseMovies(data:NSData?) -> [Movie]?{
        
        do{
            
            guard let dta = data else {
                return nil;
            }
            
            if let searchDictionary = try NSJSONSerialization.JSONObjectWithData(dta, options: NSJSONReadingOptions.AllowFragments) as? NSDictionary{
                
                var movies = [Movie]();
                
                if let moviesJsonArray = searchDictionary.objectForKey("Search"){
                    for(var i = 0; i < moviesJsonArray.count; i++){
                        if let movieJson = moviesJsonArray.objectAtIndex(i) as? NSDictionary{
                            let title = movieJson.objectForKey("Title") as! String;
                            let year = movieJson.objectForKey("Year") as! String;
                            let type = movieJson.objectForKey("Type") as! String;
                            let poster = movieJson.objectForKey("Poster") as? String;
                            movies.append(Movie(title:title, year:  year, type:  type, poster:  poster));
                        }
                    }
                }
                
                return movies;
            }
        }catch{
            
        }
        return nil;
        
    }
}