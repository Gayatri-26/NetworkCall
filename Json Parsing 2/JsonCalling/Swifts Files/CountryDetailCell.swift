
import UIKit

class CountryDetailCell: UITableViewCell {

        let contryName = UILabel()
       let countryCapital = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
   
        super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            contryName.translatesAutoresizingMaskIntoConstraints = false
            contryName.font = UIFont.systemFont(ofSize: 20)
            contryName.textAlignment = .center
            contryName.textColor = .blue
            self.contentView.addSubview(contryName)
        
            NSLayoutConstraint.activate([
                
        contryName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
        contryName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
           //     contryName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        contryName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        contryName.heightAnchor.constraint(equalToConstant: 50)
            ])
            countryCapital.translatesAutoresizingMaskIntoConstraints = false
            countryCapital.font = UIFont.systemFont(ofSize: 20)
            countryCapital.textColor = .red
            countryCapital.textAlignment = .center
           self.contentView.addSubview(countryCapital)
            NSLayoutConstraint.activate([
                
        countryCapital.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
        countryCapital.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
        countryCapital.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 20),
        countryCapital.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        countryCapital.heightAnchor.constraint(equalToConstant: 50)
                 ])
        }
        
       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
        }
}
