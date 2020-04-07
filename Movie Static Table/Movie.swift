import UIKit
import Foundation

class Movie {
    
    var image: UIImage?
    var title: String?
    var rating: Double?
    var releaseDate: Int?
    var genre: String?
    
    init() {
    }
    
    init(_ image: UIImage, _ title: String, _ rating: Double, _ releaseDate: Int, _ genre: String) {
        self.image = image
        self.title = title
        self.rating = rating
        self.releaseDate = releaseDate
        self.genre = genre
    }
}
