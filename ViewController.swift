/************************************************************************************************************************************/
/** @file		ViewController.swift
 *  @project    0_0 - Settings
 * 	@brief		x
 * 	@details	x
 *
 * 	@author		Justin Reina, Firmware Engineer, Jaostech
 * 	@created	11/12/15
 * 	@last rev	1/1/18
 *
 *
 * 	@notes		/Users/justin/Desktop/0_0 - Empty Template (Swift)/0_0 - Empty Template (Swift)/Resources/Settings.bundle/en.lproj
 *
 * 	@section	Opens
 *          Restore someID3 (see Base/Resources/Settings.bundle/Root.plist:85)
 * 			https://medium.com/@abhimuralidharan/adding-settings-to-your-ios-app-cecef8c5497
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


    /********************************************************************************************************************************/
    /** @fcn        override func viewDidLoad()
     *  @brief      x
     *  @details    x
     *
     *  @section    Dimensions
     *      Sim:8-std    (W:375.0, H:667.0, N:2.0, S:2.0)
     *      Phone:8-std  (W:375.0, H:667.0, N:2.0, S:2.0
     *      Phone:8-zoom (W:320.0, H:568.0, N:2.34375, S:2.0
     *      Sim:8-plus   (W:414.0, H:736.0, N:3.0, S:3.0)
     *  @section    Opens
     *      none listed
     */
    /********************************************************************************************************************************/
    override func viewDidLoad() {
        super.viewDidLoad();

        self.view.translatesAutoresizingMaskIntoConstraints = false;

        //@todo     read settings value for welcome message ('someID3')

        let settingVal : String? = UserDefaults.standard.string(forKey: "someID3");
        
        print(" ");
        
        if(settingVal != nil) {
            print("ViewController.viewDidLoad():      the Settings value retrieved was \(String(describing: settingVal))");

        } else {
            print("ViewController.viewDidLoad():       setting not found and nil");
        }
        
        //@todo     disp message
        
        //Check Display State
        let rslt = self.checkZoom();
        
        print("ViewController.viewDidLoad():       zoom status is \(rslt)");
        
        print("ViewController.viewDidLoad():       viewDidLoad() complete");

        //listen to 'Home' press
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(UIApplicationDelegate.applicationWillResignActive(_:)),
                                               name: NSNotification.Name.UIApplicationWillResignActive,
                                               object: nil
                                              );
        return;
    }


    /********************************************************************************************************************************/
    /** @fcn        func checkZoom()
     *  @brief      x
     *  @details    x
     *
     *  @section Vars
     *      var nativeScale : CGFloat - The native  scale factor for the physical screen        <- selected config (e.g. zoomed)
     *      var scale       : CGFloat - The natural scale factor associated with the screen     <- physical
     *
     *  @ref    https://stackoverflow.com/questions/25871858/what-is-the-difference-between-nativescale-and-scale-on-uiscreen-in-ios8
     */
    /********************************************************************************************************************************/
    func checkZoom() -> Bool {
        
        let w = UIScreen.main.bounds.size.width;
        let h = UIScreen.main.bounds.size.height;
        
        let n = UIScreen.main.nativeScale;
        let s = UIScreen.main.scale;
        
        //Print
        print("ViewController.checkZoom():         W:\(w  ) H:\(h)");
        print("ViewController.checkZoom():         N:\(n) S:\(s)");
        
        let isZoomed : Bool = (n != s);                                     /* is zoomed when native != config                      */
     
        return isZoomed;
    }
    
    
    /********************************************************************************************************************************/
    /** @fcn        func applicationWillResignActive(_ notification: Notification)
     *  @brief        x
     *  @details    x
     */
    /********************************************************************************************************************************/
    func applicationWillResignActive(_ notification: Notification) {
        print("I'm out of focus, home was pressed!");
        return;
    }

    
    /********************************************************************************************************************************/
    /** @fcn        override func didReceiveMemoryWarning()
     *  @brief       x
     *  @details    x
     */
    /********************************************************************************************************************************/
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        return;
    }
}

