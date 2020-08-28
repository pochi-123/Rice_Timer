//
//  MeasureViewController.swift
//  Timer
//
//  Created by akane.ota on 2019/03/12.
//  Copyright © 2019 akane.ota. All rights reserved.
//

import UIKit
import WebKit

class MeasureViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var riceWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // URL設定
        let urlString = "https://www.hakubaku.co.jp/omugi-lab/takikata/kyukyoku/"
        let encodedUrlString = urlString.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)
        
        let url = NSURL(string: encodedUrlString!)
        let request = NSURLRequest(url: url! as URL)
        
        riceWebView.load(request as URLRequest)
        
    }
    
    @IBAction func tappedMeasureButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
