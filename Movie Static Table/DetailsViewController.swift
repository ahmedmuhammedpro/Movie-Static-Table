import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var mimage: UIImageView!
    @IBOutlet weak var mtitle: UILabel!
    @IBOutlet weak var mrating: UILabel!
    @IBOutlet weak var mrelease: UILabel!
    @IBOutlet weak var mgenre: UILabel!
    
    var moive: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mimage.image = moive?.image
        mtitle.text = moive?.title
        mrating.text = "Rating: \(moive?.rating ?? 0)"
        mrelease.text = "Release date: \(moive?.releaseDate ?? 0)"
        mgenre.text = "Genre: " + (moive?.genre ?? "")
    }

}
