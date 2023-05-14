//
//  ViewController.swift
//  調色大師
//
//  Created by 溫皓 on 2023/5/4.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var hotdogImageView: UIImageView!
    @IBOutlet weak var patternImageView: UIImageView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var cornerRadiusSlider: UISlider!
    @IBOutlet weak var dogPattern: UISegmentedControl!
    
    //pattern紋路
    let pattern = ["pattern0","pattern1","pattern2"]
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //設置起始圓角
        hotdogImageView.layer.cornerRadius = 50
        patternImageView.layer.cornerRadius = 50
        //自訂slider圖案
        redSlider.setThumbImage(UIImage(named: "sliderImage"), for: .normal)
        greenSlider.setThumbImage(UIImage(named: "sliderImage"), for: .normal)
        blueSlider.setThumbImage(UIImage(named: "sliderImage"), for: .normal)
        alphaSlider.setThumbImage(UIImage(named: "sliderImage"), for: .normal)
        cornerRadiusSlider.setThumbImage(UIImage(named: "sliderImage"), for: .normal)
    }
    
    //設置亂數Button
    @IBAction func random(_ sender: Any) {
        redSlider.setValue(Float.random(in: 0...1), animated: true)
        greenSlider.setValue(Float.random(in: 0...1), animated: true)
        blueSlider.setValue(Float.random(in: 0...1), animated: true)
        alphaSlider.setValue(Float.random(in: 0...1), animated: true)
        hotdogImageView.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0...1))
    }
    //重置Button
    @IBAction func resetButton(_ sender: Any) {
        redSlider.setValue(1, animated: true)
        greenSlider.setValue(1, animated: true)
        blueSlider.setValue(1, animated: true)
        alphaSlider.setValue(1, animated: true)
        hotdogImageView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    }
    //換熱狗顏色
    @IBAction func changeColor(_ sender: Any) {
        hotdogImageView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
    }
    
    //segment設置切換pattern
    @IBAction func changeDogPattern(_ sender: UISegmentedControl) {
        index = sender.selectedSegmentIndex
        let patternName = pattern[index]
    
        patternImageView.image = UIImage(named: patternName)
        
    }
    //調整圓角弧度
    @IBAction func cornerRadiusChanged(_ sender: Any) {
        hotdogImageView.layer.cornerRadius = CGFloat(cornerRadiusSlider.value)
        patternImageView.layer.cornerRadius = CGFloat(cornerRadiusSlider.value)
       
    }
    
    
}

