//
//  ViewController.swift
//  AppleWatch
//
//  Created by Vikram Kunwar on 28/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var watchimg: UIImageView!
    
    @IBOutlet weak var redBtn: UIButton!
    
    @IBOutlet weak var blueBtn: UIButton!

    @IBOutlet weak var blackBtn: UIButton!

    @IBOutlet weak var whiteBtn: UIButton!
    
    @IBOutlet weak var watchView: UIView!
    
    @IBOutlet weak var chevron: UIImageView!
    
    @IBOutlet weak var hearfillImg: UIImageView!
    
    
    
    
    var isHeartRed = false
    

    var isFrontVisible = true

        
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
                
                watchimg.layer.shadowColor = UIColor.black.cgColor
                watchimg.layer.shadowOpacity = 0.8 // Increased shadow opacity
                watchimg.layer.shadowOffset = CGSize(width: 0, height: 5) // Enhanced shadow offset
                watchimg.layer.shadowRadius = 8 // Increased shadow radius
                watchimg.layer.cornerRadius = 15 // Rounded corners
                watchimg.layer.masksToBounds = false // Allow shadow to be shown
        
               watchView.transform = CGAffineTransform(translationX: 0, y: self.watchView.frame.height)

                watchView.layer.cornerRadius = 30

                watchView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
                watchView.transform = CGAffineTransform.identity
        
                chevron.alpha = 0 // Make the image invisible initially
                animateChevron()

        
        redBtn.layer.cornerRadius = 10
        
        blueBtn.layer.cornerRadius = 10
        
        blackBtn.layer.cornerRadius = 10
        
        whiteBtn.layer.cornerRadius = 10
        
       let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(_:)))
        watchimg.isUserInteractionEnabled = true
        watchimg.addGestureRecognizer(tapGesture)
        
        let tapGesturee = UITapGestureRecognizer(target: self, action: #selector(handleHeartTap))
        hearfillImg.isUserInteractionEnabled = true
        hearfillImg.addGestureRecognizer(tapGesturee)
                
                // Set the initial tint color to white
        hearfillImg.tintColor = .white
        hearfillImg.image = UIImage(systemName: "heart.fill")
        

    }
    
    func animateChevron() {
            UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseOut, .repeat, .autoreverse], animations: {
                self.chevron.alpha = 1 // Make the image visible
            }, completion: nil)
        }
    
    @objc func handleHeartTap() {
            isHeartRed.toggle() // Toggle the state
            
            // Update the tint color and image based on the current state
            if isHeartRed {
                hearfillImg.tintColor = .red
            } else {
                hearfillImg.tintColor = .white
            }
        }
    
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            
            // Animate the view's translation to bring it up
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                self.watchView.transform = .identity
            }, completion: nil)
        }
    
    @objc func handleTapGesture(_ gesture: UITapGestureRecognizer) {
            if isFrontVisible {
                flipImageView(to: UIImage(named: "backside"))
            } else {
                flipImageView(to: UIImage(named: "frontside"))
            }
            isFrontVisible.toggle()
        }
        
        private func flipImageView(to newImage: UIImage?) {
            guard let newImage = newImage else { return }
            UIView.transition(with: watchimg, duration: 0.5, options: .transitionFlipFromRight, animations: {
                self.watchimg.image = newImage
            }, completion: nil)
        }
    
        @IBAction func redButtonTapped(_ sender: UIButton) {
            flipImageView(to: UIImage(named: "red"))
        }
        
        @IBAction func blueButtonTapped(_ sender: UIButton) {
            flipImageView(to: UIImage(named: "blue"))
        }
        
        @IBAction func blackButtonTapped(_ sender: UIButton) {
            flipImageView(to: UIImage(named: "black"))
        }
        
        @IBAction func whiteButtonTapped(_ sender: UIButton) {
            flipImageView(to: UIImage(named: "white"))
        }
    
    
//    private func changeImageWithEaseInOutAnimation(imageName: String) {
//            UIView.transition(with: watchimg, duration: 0.5, options: .transitionCrossDissolve, animations: {
//                self.watchimg.image = UIImage(named: imageName)
//            }, completion: nil)
//        }
}

