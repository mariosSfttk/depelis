//
//  DetailViewController.swift
//  DePelis
//
//  Created by Mario Vargas on 09/11/24.
//

import UIKit
import CoreData


protocol ProtocolDetailView {
    var presenter: ProtocolDetailViewPresenter? { get set }
    var managedObject: NSManagedObjectContext! { get set }
    
    var results: Results? { get set }
}

class DetailViewController: UIViewController, ProtocolDetailView {
    var managedObject: NSManagedObjectContext!
    var results: Results?
    var presenter: (any ProtocolDetailViewPresenter)?
    
    var safeView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .colorNavigation
        return view
    }()
    
    lazy var btnBack: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didPressBack), for: .touchUpInside)
        btn.setImage(UIImage(systemName: Strings.Icons.backArrow)?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        return btn
    }()
    
    var scrollView: UIScrollView = {
       let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .clear
        return scroll
    }()
    
    var contentView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var lblTitleMovie: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 24)
        lbl.numberOfLines = 0
        return lbl
    }()
    
    lazy var posterView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: Strings.Icons.movieIcon)
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    var blurView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        view.backgroundColor = .colorBlur
        view.alpha = 0.6
        return view
    }()
    
    var lblDescription: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.text = Strings.WelcomeScreen.titleHeader
        lbl.numberOfLines = 0
        lbl.textAlignment = .justified
        return lbl
    }()
    
    var lblDate: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.text = Strings.WelcomeScreen.titleHeader
        lbl.textColor = .textColorBlur
        lbl.shadowColor = .shadowColorBlur
        lbl.shadowOffset = CGSize(width: 2, height: 1)
        return lbl
    }()
    
    var lblRate: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.text = Strings.WelcomeScreen.titleHeader
        lbl.textColor = .textColorBlur
        lbl.shadowColor = .shadowColorBlur
        lbl.shadowOffset = CGSize(width: 2, height: 1)
        return lbl
    }()
    
    lazy var btnFavs: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didPressAddFav), for: .touchUpInside)
        btn.setImage(UIImage(systemName: Strings.Icons.heartIcon )?.withTintColor(.red, renderingMode: .alwaysOriginal), for: .normal)
        btn.setTitle(Strings.DetailScreen.btnFavs, for: .normal)
        btn.layer.cornerRadius = 5
        return btn
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addingSubViews()
        setupComponentsView()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = .colorBackground
        setInfo()
    }
    
    @objc func didPressBack() {
        navigationController?.popViewController(animated: true)
    }
    
    
    func setInfo() {
        if let info = results {
            lblTitleMovie.text = info.title
            getImage(forUrl: info.poster_path) { image in
                self.posterView.image = image as UIImage
            }
            lblDescription.text = info.overview
            lblDate.text = info.release_date
            lblRate.text = String(format: "⭐️ %.1f", info.vote_average)
        }
    }
    
    @objc
    func didPressAddFav() {
        
        if !validateIfProductIsStored() {
            let newMovie = Movies(context: managedObject)
            let dataImg = posterView.image?.jpegData(compressionQuality: 0.5)
            newMovie.backdrop = NSData(data: dataImg!) as Data
            newMovie.date = results?.release_date
            newMovie.language = results?.original_language
            newMovie.overview = results?.overview
            newMovie.poster = NSData(data: dataImg!) as Data
            newMovie.rate = results!.vote_average
            newMovie.title = results?.title
            
            do {
                try managedObject.save()
            }catch {
                print(Strings.General.wrongMessage)
            }
        }
    }
    
    func validateIfProductIsStored() -> Bool {
        var movieFound = false
        
        let title = results?.original_title
        let movieFetch: NSFetchRequest<Movies> = Movies.fetchRequest()
        movieFetch.predicate = NSPredicate(format: "title == %@", title!)
        
        do {
            let result = try managedObject.fetch(movieFetch)
            if result.count > 0 {
                movieFound = true
            }
        }catch let error as NSError {
            print(Strings.General.wrongMessage + error.localizedDescription)
        }
        return movieFound
    }

}
