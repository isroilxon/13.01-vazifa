//
//  FirstViewController.swift
//  13.01 vazifa
//
//  Created by mac on 13/01/23.
//

import UIKit

class FirstViewController: UIViewController {
    
    let model = [
        Model(label: "YouTube, LLC — videomateriallar hostingini taqdim etuvchi vebsayt. YouTubedan foydalanish qulay va koʻrish osonligi tufayli juda ham mashhur va kirib koʻruvchilari soni koʻpligi boʻyicha jahonda uchinchi oʻrinda turadigan saytdir.", size: 35, color: .green),
        Model(label: "Instagramm", size: 15, color: .systemGray5),
        Model(label: "Telegram — tezkor xabar almashish vositasi. Oddiy foydalanuvchilar matn xabarlashuvdan tashqari bir-birlariga har birining hajmi 2 GB gacha boʻlgan tasvir, video, audio va har xil fayllar yuborishlari hamda ovozli va video qoʻngʻiroqlarni amalga oshirishlari, kanal va guruhlarda ovozli hamda video chatlarda qatnashishlari mumkin.Dastur Google, Android, Apple iOS, Microsoft Windows, Blackberry, MacOS, Linux va Windows Phone uchun mavjud.Telegram foydalanuvchilari oʻz mobil telefon raqamlari orqali roʻyxatdan oʻtadilar. „Telegram“ loyihasi Pavel Durov tomonidan oʻylab topilgan.Dunyodagi eng tezkor xabar almashish ilovasi. Bu bepul va xavfsiz.", size: 50, color: .yellow)
    ]
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 20
        stackView.axis = .vertical
        stackView.distribution = .fill
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        title = "Stack View"
        stack()
        

    }
    
    func stack() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 350).isActive = true
        
        for i in 0..<model.count {
            let label = UILabel()
            let button = UIButton()
            
            label.translatesAutoresizingMaskIntoConstraints = false
            button.addSubview(label)
            label.topAnchor.constraint(equalTo: button.topAnchor, constant: 10).isActive = true
            label.leftAnchor.constraint(equalTo: button.leftAnchor, constant: 10).isActive = true
            label.rightAnchor.constraint(equalTo: button.rightAnchor, constant: -10).isActive = true
            label.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: -10).isActive = true
            label.text = model[i].label
            label.font = .systemFont(ofSize: model[i].size)
            label.numberOfLines = 0
            
            if i == 0{
                button.addTarget(self, action: #selector(buttonTap1), for: .touchUpInside)
            }
            else if i == 1 {
                button.addTarget(self, action: #selector(buttonTap2), for: .touchUpInside)
            }
            else {
                button.addTarget(self, action: #selector(buttonTap3), for: .touchUpInside)
            }
            
            button.backgroundColor = model[i].color
            stackView.addArrangedSubview(button)
            
        }
    }
    @objc func buttonTap1(){
        guard let url = URL(string: "https://youtube.com") else { return  }
        UIApplication.shared.open(url)
    }
    
    @objc func buttonTap2(){
        guard let url = URL(string: "https://instagram.com") else { return  }
        UIApplication.shared.open(url)
    }
    
    @objc func buttonTap3(){
        guard let url = URL(string: "https://web.telegram.org/z/") else { return  }
        UIApplication.shared.open(url)
    }
}
