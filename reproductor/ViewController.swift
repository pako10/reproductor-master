//
//  ViewController.swift
//  reproductor
//
//  Created by Francisco Humberto Andrade Gonzalez on 25-12-15.
//  Copyright © 2015 Francisco Andrade. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var volumenSet: Float = 50.0
    
        @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var pickerCanciones: UIPickerView!
    @IBOutlet weak var nombreCancion: UILabel!
    private var reproductor: AVAudioPlayer!
    
    @IBOutlet weak var imageView: UIImageView!
    
   
    var canciones = ["When the sun goes down", "Fuer frei","Die antwoord","Frijolero","Ich will"]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
        
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.canciones.count
        
        
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return canciones[row]
        
        
    
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.pickerCanciones.dataSource = self
        self.pickerCanciones.delegate = self
        
        
        let arcticUrl = NSBundle.mainBundle().URLForResource("Arctic", withExtension: "mp3")
        let willUrl = NSBundle.mainBundle().URLForResource("Ich Will", withExtension: "mp3")
        let DieUrl = NSBundle.mainBundle().URLForResource("Die", withExtension: "mp3")
        let FuerUrl = NSBundle.mainBundle().URLForResource("Fuer Frei", withExtension: "mp3")
        let FrijoUrl = NSBundle.mainBundle().URLForResource("Frijolero", withExtension: "mp3")
        
        
        
        
            if (row == 0){
                nombreCancion.text = canciones[0]
                image.image = UIImage(named: "arctic2.jpg")
                do{
                try reproductor = AVAudioPlayer(contentsOfURL: arcticUrl!)
                }
                catch{
                    print("error")
                }
                reproductor.play()
                
                
                
            }else if (row == 1){
                nombreCancion.text = canciones[1]
                image.image = UIImage(named: "mon.jpg")
                do{
                try reproductor = AVAudioPlayer(contentsOfURL: willUrl!)
                }catch{
                    print("error")
                }
                reproductor.play()
                
                
            }else if (row == 2){
                nombreCancion.text = canciones[2]
                image.image = UIImage(named: "monk.jpg")
                do{
                try reproductor = AVAudioPlayer(contentsOfURL: DieUrl!)
                }catch{
                print("error")
                }
                reproductor.play()
                
            }else if (row == 3){
                nombreCancion.text = canciones[3]
                image.image = UIImage(named: "art.jpg")
                do{
                    try reproductor = AVAudioPlayer(contentsOfURL: FrijoUrl!)
                }catch{
                    print("error")
                }
                reproductor.play()
                
            }else if (row == 4){
                nombreCancion.text = canciones[4]
                image.image = UIImage(named: "arc.jpg")
                do{
                    try reproductor = AVAudioPlayer(contentsOfURL: FuerUrl!)
                }catch{
                    print("error")
                }
                reproductor.play()
                
        }}
    
    
        
    
    @IBAction func volumen(sender: AnyObject) {
        volumenSet = sender.value
            reproductor.volume = volumenSet / 100
        
    }
    
    @IBAction func stop() {
        if reproductor.playing{
            reproductor.stop()
            reproductor.currentTime = 0.0
        }
        
    }
    
    @IBAction func play() {
        if !reproductor.playing{
            reproductor.play()
        }}

    @IBAction func pause() {
        if reproductor.playing{
            reproductor.pause()
        }
    }

}