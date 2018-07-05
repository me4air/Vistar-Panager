//
//  BusStopTableViewCell.swift
//  VistarPassenger
//
//  Created by Всеволод on 04.07.2018.
//  Copyright © 2018 me4air. All rights reserved.
//

import UIKit

class BusStopTableViewCell: UITableViewCell {
    
    var busStopName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    var busStopDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = #colorLiteral(red: 0.4690135237, green: 0.4487698434, blue: 0.5037079632, alpha: 1)
        label.textAlignment = .left
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    func setupCellLayout(){
        
        self.contentView.addSubview(busStopName)
        busStopName.translatesAutoresizingMaskIntoConstraints = false
        busStopName.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        busStopName.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 15).isActive = true
        
        self.contentView.addSubview(busStopDescription)
        busStopDescription.translatesAutoresizingMaskIntoConstraints = false
        busStopDescription.topAnchor.constraint(equalTo: busStopName.bottomAnchor, constant: 7).isActive = true
        busStopDescription.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 15).isActive = true
        
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
