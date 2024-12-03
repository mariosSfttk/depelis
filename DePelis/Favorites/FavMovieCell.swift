//
//  FavMovieCell.swift
//  DePelis
//
//  Created by Mario Vargas on 13/11/24.
//

import UIKit
import CoreData

class FavMovieCell: UITableViewCell {
    class var identifier: String {return String(describing: self)}
    class var nib: UINib {return UINib(nibName: identifier, bundle: nil)}
    var managedObject: NSManagedObjectContext!
    var currentMovie: Movies?
    var delegate: FavoritesView?

    var generalView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.colorNavigation.cgColor
        view.backgroundColor = .colorCell
        return view
    }()
    
    var borderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.colorNavigation.cgColor
        return view
    }()
    
    lazy var posterView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: Strings.Icons.movieIcon)
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    var lblTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    var lblLanguage: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var btnRemove: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: Strings.Icons.trashIcon), for: .normal)
        btn.heightAnchor.constraint(equalToConstant: 43).isActive = true
        btn.addTarget(self, action: #selector(didPressRemove), for: .touchUpInside)
        btn.layer.cornerRadius = 5
        return btn
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .colorBackground
        self.selectionStyle = .none
        contentView.addSubview(generalView)
        generalView.addSubview(borderView)
        borderView.addSubview(posterView)
        generalView.addSubview(lblTitle)
        generalView.addSubview(lblLanguage)
        generalView.addSubview(btnRemove)
        
        setGeneralViewConstraints()
        setBorderViewConstraints()
        setPosterViewConstraints()
        stLblTitleConstraints()
        setLblLanguageConstraints()
        setBtnRemoveConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func setGeneralViewConstraints(){
        NSLayoutConstraint.activate([
            generalView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            generalView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            generalView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            generalView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
        ])
    }
    
    func setBorderViewConstraints(){
        NSLayoutConstraint.activate([
            borderView.topAnchor.constraint(equalTo: generalView.topAnchor, constant: 2),
            borderView.bottomAnchor.constraint(equalTo: generalView.bottomAnchor, constant: -2),
            borderView.leadingAnchor.constraint(equalTo: generalView.leadingAnchor, constant: 2),
        ])
    }
    
    func setPosterViewConstraints(){
        NSLayoutConstraint.activate([
            posterView.topAnchor.constraint(equalTo: borderView.topAnchor, constant: 1),
            posterView.bottomAnchor.constraint(equalTo: borderView.bottomAnchor, constant: -1),
            posterView.leadingAnchor.constraint(equalTo: borderView .leadingAnchor, constant: 1),
            posterView.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -1),
            posterView.widthAnchor.constraint(equalToConstant: 80),
            posterView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    func stLblTitleConstraints(){
        NSLayoutConstraint.activate([
            lblTitle.topAnchor.constraint(equalTo: generalView.topAnchor, constant: 8),
            lblTitle.leadingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: 12),
            lblTitle.trailingAnchor.constraint(equalTo: generalView.trailingAnchor, constant: -12),
        ])
    }
    
    func setLblLanguageConstraints(){
        NSLayoutConstraint.activate([
            lblLanguage.bottomAnchor.constraint(equalTo: generalView.bottomAnchor, constant: -8),
            lblLanguage.leadingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: 12),
        ])
    }
    
    func setBtnRemoveConstraints(){
        NSLayoutConstraint.activate([
            btnRemove.bottomAnchor.constraint(equalTo: generalView.bottomAnchor, constant: -8),
            btnRemove.trailingAnchor.constraint(equalTo: generalView.trailingAnchor, constant: -12),
        ])
    }
    
    func setData(data: Movies) {
        currentMovie = data
        lblTitle.text = data.title
        lblLanguage.text = data.language
        self.posterView.image = UIImage(data: data.poster!)
    }
    
    @objc
    func didPressRemove() {
        self.managedObject.delete(self.currentMovie!)
        do {
            try managedObject.save()
            delegate?.fetchMovies()
        }catch {
            print(Strings.General.wrongMessage + error.localizedDescription)
        }
    }
    

}
