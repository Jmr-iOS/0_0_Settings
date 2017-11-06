/************************************************************************************************************************************/
/** @file		ViewController.swift
 *  @project    0_0 - Empty Template (Swift)
 * 	@brief		x
 * 	@details	x
 *
 * 	@author		Justin Reina, Firmware Engineer, Jaostech
 * 	@created	11/12/15
 * 	@last rev	x
 *
 *
 * 	@notes		x/Users/justin/Desktop/0_0 - Empty Template (Swift)/0_0 - Empty Template (Swift)/Resources/Settings.bundle/en.lproj
 *
 * 	@section	Opens
 * 			none current
 *
 *  @ref       https://happyteamlabs.com/blog/ios-how-to-create-an-ios-settings-entry-for-your-app-using-settings-bundle/
 *  @ref       http://stackoverflow.com/questions/6428353/best-way-to-add-license-section-to-ios-settings-bundle/6453507#6453507
 *
 *  @section   Process
 *              1. In Xcode, choose File->New->File…
 *              2. Select Settings Bundle
 *              3. Save it inside project, in /Resources
 *              4. Open Settings.bundle/Root.plist
 *              4. Delete all Preferences in Root.plist
 *              //------------------------------------------------------------------------------------------------------------------//
 *              5. Add a new Preference Item of type 'Group' with a Title of String "Tutorial"
 *              6. Add a Row to the Group (R.C. 'Item 0') of type 'Toggle Switch' with a Title of 'Show tutorial on launch' and
 *                 Identifier of 'SettingsShowTutorialOnLaunch'
 *              //------------------------------------------------------------------------------------------------------------------//
 *              7. Add a new Preference Item of type 'Group' with a Title of String "Acknowledgements"
 *              8. Add a Row to the Group of type 'Group' with Value 'Child Pane' and Title "Acknowledgements"
 *              9. Create a “Licenses” folder at /Resources/Licenses. The Settings.bundle file is in /Resources/, and the license
 *                 in /Licenses/. Place the script provided to the /Licenses/ folder as license_script.pl
 *             10. Run the script (ex - 'perl license_script.pl')
 *                  - this will generate a component in the Settings.bundle titled 'Acknowledgements.strings'
 *             11. Change the Filename in Roots.plist to 'Acknowledgements.plist'
 *
 * 	@section	Legal Disclaimer
 * 			All contents of this source file and/or any other Jaostech related source files are the explicit property on Jaostech
 * 			Corporation. Do not distribute. Do not copy.
 */
/************************************************************************************************************************************/
import UIKit


class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad();

        self.view.translatesAutoresizingMaskIntoConstraints = false;

//        optDemo_addButton(self.view);
//        makeAMonsterousLabel(self.view);

        //<todo>read settings value for welcome message ('someID3')
/*
        let settingVal : String? = UserDefaults.standard.string(forKey: "someID3");
        
        print(" ");
        
        if(settingVal != nil) {
            print(settingVal);
        } else {
            print("setting not found and nil");
        }
*/
//        print("The Settings value retrieved was \(settingVal)");
        
        //<todo>disp message
        
//        print("ViewController.viewDidLoad():       viewDidLoad() complete");

        //listen to 'Home' press
/*        NotificationCenter.default.addObserver(self,
                                               selector: #selector(UIApplicationDelegate.applicationWillResignActive(_:)),
                                               name: NSNotification.Name.UIApplicationWillResignActive,
                                               object: nil
                                              );
*/

        return;
    }


    @objc func applicationWillResignActive(_ notification: Notification) {
        print("I'm out of focus, home was pressed!");
        return;
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();

        return;
    }

    
    @objc func optDemo_addButton(_ view:UIView) {
        
        let button      : UIButton  = UIButton(type: UIButtonType.system) as UIButton;
        let buttonWidth : CGFloat   = 300;
        
        button.frame = CGRect(x: self.view.center.x-(buttonWidth/2), y: 100, width: buttonWidth, height: 50);

        
        button.backgroundColor = UIColor.green
        
        button.setTitle("Test Button", for: UIControlState());
  
        button.addTarget(self, action: #selector(ViewController.myButton_response(_:)), for:  .touchUpInside);

        view.addSubview(button);
        
        print("ViewController.optDemo_addButton(): Button added");
        
        return;
    }
    

    @objc func makeAMonsterousLabel(_ view:UIView) {
        
        let myFirstLabel  = UILabel();

        myFirstLabel.text          = "I made a label on the screen #toogood4you";
        myFirstLabel.font          = UIFont(name: "MarkerFelt-Thin", size: 45);
        myFirstLabel.textColor     = UIColor.red;
        myFirstLabel.textAlignment = .center;

        //text-wrap
        myFirstLabel.numberOfLines = 0;
        myFirstLabel.lineBreakMode = .byWordWrapping;
        
        myFirstLabel.frame = CGRect(x: (self.view.center.x - 150), y: 200, width: 300, height: 500);
        
        myFirstLabel.backgroundColor = UIColor.gray;
        
        view.addSubview(myFirstLabel);

        return;
    }
    
    
/*    func pressed(sender: UIButton!) {
        let alertView = UIAlertView();
        alertView.addButtonWithTitle("Ok");
        alertView.title = "title";
        alertView.message = "message";
        alertView.show();
        
        return;
    }
*/
    
    @objc func myButton_response(_ sender: UIButton!) {

        print("Button Response fired. Game on!");
        
        return;
    }
}



