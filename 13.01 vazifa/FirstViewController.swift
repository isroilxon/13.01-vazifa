//
//  FirstViewController.swift
//  13.01 vazifa
//
//  Created by mac on 13/01/23.
//

import UIKit
import SafariServices

class FirstViewController: UIViewController {
    
    let model = [
        Model(label: "YouTube, LLC — videomateriallar hostingini taqdim etuvchi vebsayt. YouTubedan foydalanish qulay va koʻrish osonligi tufayli juda ham mashhur va kirib koʻruvchilari soni koʻpligi boʻyicha jahonda uchinchi oʻrinda turadigan saytdir.", size: 25, color: .green),
        Model(label: "Instagramm", size: 15, color: .systemGray5),
        Model(label: "Telegram — tezkor xabar almashish vositasi. Oddiy foydalanuvchilar matn xabarlashuvdan tashqari bir-birlariga har birining hajmi 2 GB gacha boʻlgan tasvir, video, audio va har xil fayllar yuborishlari hamda ovozli va video qoʻngʻiroqlarni amalga oshirishlari, kanal va guruhlarda ovozli hamda video chatlarda qatnashishlari mumkin.Dastur Google, Android, Apple iOS, Microsoft Windows, Blackberry, MacOS, Linux va Windows Phone uchun mavjud.Telegram foydalanuvchilari oʻz mobil telefon raqamlari orqali roʻyxatdan oʻtadilar. „Telegram“ loyihasi Pavel Durov tomonidan oʻylab topilgan.Dunyodagi eng tezkor xabar almashish ilovasi. Bu bepul va xavfsiz.", size: 25, color: .yellow)
    ]
    
    let scroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.panGestureRecognizer.delaysTouchesBegan = scroll.delaysContentTouches
        return scroll
    }()
    
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
        
        scroll.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scroll)
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scroll.leftAnchor.constraint(equalTo: view.leftAnchor),
            scroll.rightAnchor.constraint(equalTo: view.rightAnchor),
            scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        stack()
        
    }
    
    func stack() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scroll.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: scroll.topAnchor, constant: 20).isActive = true
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scroll.bottomAnchor, constant: -20).isActive = true
        
        for i in 0..<model.count {
            let label = UILabel()
            let button = UIButton()
            
            label.translatesAutoresizingMaskIntoConstraints = false
            button.addSubview(label)
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: button.topAnchor, constant: 10),
                label.leftAnchor.constraint(equalTo: button.leftAnchor, constant: 10),
                label.rightAnchor.constraint(equalTo: button.rightAnchor, constant: -10),
                label.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: -10)
            ])
            
            label.text = model[i].label
            label.font = .systemFont(ofSize: model[i].size)
            label.numberOfLines = 0
            button.tag = i
            button.addTarget(self, action: #selector(buttonTap(_:)), for: .touchUpInside)
            
            
            button.backgroundColor = model[i].color
            stackView.addArrangedSubview(button)
            
        }
    }
    @objc func buttonTap(_ button: UIButton){
        let link = button.tag == 0 ? "https://youtube.com" : (button.tag == 1 ? "https://instagram.com" : "https://web.telegram.org/z/")
        guard let url = URL(string: link) else { return  }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true, completion: nil)
    }
}
