import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddProtocol {
    
    var movies = Array<Movie>()

    @IBOutlet weak var myTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.delegate = self
        myTable.dataSource = self
        
        movies.append(Movie(UIImage(named: "img1.jpeg")!, "movie1", 5.5, 2016, "Drama, Action"))
        movies.append(Movie(UIImage(named: "img2.jpeg")!, "movie2", 6.5, 2017, "Drama, Action"))
        movies.append(Movie(UIImage(named: "img3.jpeg")!, "movie3", 7.5, 2018, "Drama, Action"))
        movies.append(Movie(UIImage(named: "img4.jpeg")!, "movie4", 8.5, 2019, "Drama, Action"))
        movies.append(Movie(UIImage(named: "img5.jpeg")!, "movie5", 9.5, 2020, "Drama, Action"))
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTable.dequeueReusableCell(withIdentifier: "cell")
        let imageView = cell?.viewWithTag(1) as! UIImageView
        let movieTitle = cell?.viewWithTag(2) as! UILabel
        let rating = cell?.viewWithTag(3) as! UILabel
        
        imageView.image = movies[indexPath.row].image
        movieTitle.text = movies[indexPath.row].title
        rating.text = "\(movies[indexPath.row].rating!)"
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsView = storyboard?.instantiateViewController(identifier: "detailsView") as! DetailsViewController
        detailsView.moive = movies[indexPath.row]
        navigationController?.pushViewController(detailsView, animated: true)
    }
    
    @IBAction func addMovie(_ sender: UIBarButtonItem) {
        let addView = storyboard?.instantiateViewController(identifier: "addView") as! AddViewController
        addView.addProtocol = self
        navigationController?.pushViewController(addView, animated: true)
    }
    
    func movieAdded(_ movie: Movie) {
        movies.append(movie)
        myTable.reloadData()
    }
    
}

