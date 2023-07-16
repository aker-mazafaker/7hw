//
//  ViewController.swift
//  7hw
//
//  Created by Akerke on 15.07.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(progressView)
        progressView.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.left.right.equalToSuperview().inset(25)
        }
        progressView.progress = 1
    }
    

    let progressView: CustomProgressView = {
        let progressView = CustomProgressView()
        progressView.backgroundColor = .systemPink
        progressView.progressColor = .black
//        progressView.height = 50
        return progressView
    }()

}

class CustomProgressView: UIView {
    
    var progress: CGFloat = 0.0
    var height: CGFloat = 10
    var progressColor: UIColor = .blue
    private var progressLayer = CALayer()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
        growProgress()
        
    }
    
    func setup() {
        if backgroundColor == nil{
            backgroundColor = .systemGray5
        }
            
        self.snp.makeConstraints{
            $0.height.equalTo(height)
        }
        progressLayer.position = CGPoint(x: 0, y: 0)
        progressLayer.anchorPoint = CGPoint(x: 0, y: 0)
        progressLayer.backgroundColor = progressColor.cgColor
        clipsToBounds = true
        layer.addSublayer(progressLayer)
        layer.cornerRadius = height / 2
    }
    
    func growProgress() {
        
        UIView.animate(withDuration: 0.25, delay: 0){
            self.progressLayer.bounds = CGRect(x: 0, y: 0, width: self.frame.width * self.progress, height: self.height)
        }
    }
}
