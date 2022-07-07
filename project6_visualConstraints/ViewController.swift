//
//  ViewController.swift
//  project6_visualConstraints
//
//  Created by Ilia Abrosimov on 06.07.2022.
//

import UIKit

class ViewController: UIViewController {
    let label1 = UILabel()
    let label2 = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.backgroundColor = .red
        label1.text = "LABEL1"
        label1.sizeToFit()
        
        
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.backgroundColor = .green
        label2.text = "LABEL2"
        label2.sizeToFit()
        
        view.addSubview(label1)
        view.addSubview(label2)
        
//        let views = [label1, label2]
        
        let viewDictionary = ["label1" : label1, "label2" : label2]
//
//        for label in viewDictionary.keys {
//            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[\(label)]|", metrics: nil, views: viewDictionary))
//        }
        var previous : UILabel?
//
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[label1]-[label2(label1)]-|", metrics: nil, views: viewDictionary))
//
        for label in [label1, label2] {
            
            label.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            label.heightAnchor.constraint(equalToConstant: view.bounds.height / 2).isActive = true
            if let previous = previous {
                label.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 15).isActive = true
                
            } else {
                label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            }
            previous = label
        }
        label2.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10).isActive = true
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "ChangeColor", style: .plain, target: self, action: #selector(changeColor))
        
    }
    @objc func changeColor() {
        let tempColor = label1.backgroundColor
        label1.backgroundColor = label2.backgroundColor
        label2.backgroundColor = tempColor
        
    }

}

