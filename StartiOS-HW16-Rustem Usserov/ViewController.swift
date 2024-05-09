//
//  ViewController.swift
//  StartiOS-HW16-Rustem Usserov
//
//  Created by Rustem on 10.05.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.getData(urlRequest: "https://api.magicthegathering.io/v1/cards?name=Black%20Lotus")
    }


}

