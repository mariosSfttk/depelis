//
//  MovieCell.swift
//  DePelis
//
//  Created by Mario Vargas on 09/11/24.
//

import UIKit

class MovieCell: UITableViewCell {
    
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
    
    var lblRate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .colorBackground
        self.selectionStyle = .none
        addSubview(generalView)
        generalView.addSubview(borderView)
        borderView.addSubview(posterView)
        generalView.addSubview(lblTitle)
        generalView.addSubview(lblLanguage)
        generalView.addSubview(lblRate)
        
        generalViewConstraints()
        borderViewConstraints()
        posterViewConstraints()
        lblTitleConstraints()
        lblLanguageConstraints()
        lblRateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func generalViewConstraints() {
        NSLayoutConstraint.activate([
            generalView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            generalView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            generalView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            generalView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
        ])
    }
    
    func borderViewConstraints() {
        NSLayoutConstraint.activate([
            borderView.topAnchor.constraint(equalTo: generalView.topAnchor, constant: 2),
            borderView.bottomAnchor.constraint(equalTo: generalView.bottomAnchor, constant: -2),
            borderView.leadingAnchor.constraint(equalTo: generalView.leadingAnchor, constant: 2),
        ])
    }
    
    func posterViewConstraints() {
        NSLayoutConstraint.activate([
            posterView.topAnchor.constraint(equalTo: borderView.topAnchor, constant: 1),
            posterView.bottomAnchor.constraint(equalTo: borderView.bottomAnchor, constant: -1),
            posterView.leadingAnchor.constraint(equalTo: borderView .leadingAnchor, constant: 1),
            posterView.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -1),
            posterView.widthAnchor.constraint(equalToConstant: 80),
            posterView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    func lblTitleConstraints() {
        NSLayoutConstraint.activate([
            lblTitle.topAnchor.constraint(equalTo: generalView.topAnchor, constant: 8),
            lblTitle.leadingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: 12),
            lblTitle.trailingAnchor.constraint(equalTo: generalView.trailingAnchor, constant: -12),
        ])
    }
    
    func lblLanguageConstraints() {
        NSLayoutConstraint.activate([
            lblLanguage.bottomAnchor.constraint(equalTo: generalView.bottomAnchor, constant: -8),
            lblLanguage.leadingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: 12),
        ])
    }
    
    func lblRateConstraints() {
        NSLayoutConstraint.activate([
            lblRate.bottomAnchor.constraint(equalTo: generalView.bottomAnchor, constant: -8),
            lblRate.trailingAnchor.constraint(equalTo: generalView.trailingAnchor, constant: -12),
        ])
    }
    
    func setData(data: Results) {
        lblTitle.text = data.title
        lblRate.text = data.release_date
        lblLanguage.text = data.original_language.uppercased()
        getImage(forUrl: data.backdrop_path) { image in
            self.posterView.image = image as UIImage
        }
    }
    
}
