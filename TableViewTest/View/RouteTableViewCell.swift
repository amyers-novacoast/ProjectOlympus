//
//  RouteTableViewCell.swift
//  TableViewTest
//
//  Created by Emily Thomas on 9/20/18.
//  Copyright © 2018 TS Myers. All rights reserved.
//

import UIKit

class RouteTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

//        self.contentView.addSubview(profileImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(jobTitleDetailedLabel)
        self.contentView.addSubview(containerView)
        self.contentView.addSubview(routeColorImageView)
//        self.contentView.addSubview(routeColorUIView)
        
//        profileImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
//        profileImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
//        profileImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
//        profileImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        containerView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor).isActive = true
        
        jobTitleDetailedLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor).isActive = true
        jobTitleDetailedLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
        //are the next two correct? Why are they the same as ^^
        jobTitleDetailedLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor).isActive = true
        jobTitleDetailedLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
        
        routeColorImageView.widthAnchor.constraint(equalToConstant: 26).isActive = true
        routeColorImageView.heightAnchor.constraint(equalToConstant: 26).isActive = true
        routeColorImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20).isActive = true
        routeColorImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
//        routeColorUIView.widthAnchor.constraint(equalToConstant: 26).isActive = true
//        routeColorUIView.heightAnchor.constraint(equalToConstant: 26).isActive = true
//        routeColorUIView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20).isActive = true
//        routeColorUIView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        
        //auto layout constraints
    }
    
    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        //this was the default suggestion
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    let profileImageView: UIImageView = {
//        let img = UIImageView()
//        img.contentMode = .scaleAspectFill
//        img.translatesAutoresizingMaskIntoConstraints = false
//        img.layer.cornerRadius = 35
//        img.clipsToBounds = true
//        return img
//    } ()
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()

    let jobTitleDetailedLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 1, green: 0.08132122972, blue: 0, alpha: 1)
        label.backgroundColor = .yellow
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let containerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    } ()
    
    let routeColorUIView : UIView = {
        let color = UIView()
        color.contentMode = .scaleAspectFill
        color.translatesAutoresizingMaskIntoConstraints = false
        color.layer.cornerRadius = 13
        color.clipsToBounds = true
        return color
    } ()
    
    let routeColorImageView : UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 13
        img.clipsToBounds = true
        return img
    } ()

    var route: Route? {
        didSet {
            guard let routeItem = route else {return}
            if let name = routeItem.name {
//                profileImageView.image = UIImage(named: name)
                nameLabel.text = name
            }
            if let routeRating = routeItem.routeRating {
                jobTitleDetailedLabel.text = " \(routeRating) "
            }
            if let routeColor = routeItem.routeColor {
                routeColorImageView.image = UIImage(named: routeColor)

//                nameLabel.backgroundColor = UIColor(named: routeColor)
//                routeColorUIView.tintColor = UIColor(named: routeColor)
            }
        }
    }
    
    //soft author.com uitable view 100% programatically

}

