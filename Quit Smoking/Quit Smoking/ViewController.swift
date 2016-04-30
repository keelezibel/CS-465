//
//  ViewController.swift
//  Quit Smoking
//
//  Created by Le Tang Boon on 3/26/16.
//  Copyright © 2016 Le Tang Boon. All rights reserved.
//

import UIKit
import EventKit
import QuartzCore
var flag = 0

var accounts:[String:String] = [:]
class ViewController: ResponsiveTextFieldViewController{
    
    @IBAction func loginButton(sender: AnyObject) {
        
        let AccountFile=FileUtils(fileName: "AccountLog.csv")
        
        if(!AccountFile.fileExists()){
            
            let alertController = UIAlertController(title: "Error", message:
                "This username does not exist", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }else{
        let returnval = AccountFile.readFile()
        let returnvalArr = returnval.characters.split{$0 == ","}.map(String.init)
        print(returnvalArr[0])
        print(returnvalArr[1])  // BUGGGGG!!!!
        let newStringreturnval = returnvalArr[1].stringByReplacingOccurrencesOfString("\n", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        if(!(returnvalArr[0] == userNameLogin.text! && newStringreturnval == userPasswordLogin.text!)){
            let alertController = UIAlertController(title: "Error", message:
                    "Your username and password don't match!", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.Default,handler: nil))
                
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        }
    }
    @IBOutlet var userPasswordLogin: UITextField!
    @IBOutlet var userNameLogin: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.navigationController!.navigationBarHidden = true;
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.navigationController!.navigationBarHidden = false;
    }
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

class MainUI:UIViewController{
    
    var menuView: BTNavigationDropdownMenu!

    @IBOutlet weak var calendarView: CVCalendarView!
    @IBOutlet weak var menuCalView: CVCalendarMenuView!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var daysOutSwitch: UISwitch!
    
    @IBOutlet weak var progressBar: UIProgressView!
    // START OF TIMER CODE
    var seconds = 0
    var count = 0
    var timer = NSTimer()
    func starttimer()  {
        seconds = 5
        count = 0
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("subtractTime"), userInfo: nil, repeats: true)
    }
    func subtractTime() {
        seconds -= 1
        if(seconds == 0 && flag == 0)  {
            timer.invalidate()
            flag = 1
            let alert = UIAlertController(title: "Did you smoke today?",
                                          message: "Don't smoke!",
                                          preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Default, handler: {
                action in self.starttimer()
            }))
            presentViewController(alert, animated: true, completion:nil)
        }
    }
    // END OF TIMER CODE
    
    var shouldShowDaysOut = true
    var animationFinished = true
    var selectedDay:DayView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        monthLabel.text = CVDate(date: NSDate()).globalDescription
        
        starttimer()
        
        let nav_bar_header = "Settings"
        let items = ["Modify Profile", "Badges", "Change Quit 4 Money Plan", "Product Info"]
        self.navigationController?.navigationBar.translucent = true
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.0/255.0, green:180/255.0, blue:220/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        menuView = BTNavigationDropdownMenu(navigationController: self.navigationController, title: nav_bar_header, items: items)
        menuView.cellHeight = 50
        menuView.cellBackgroundColor = self.navigationController?.navigationBar.barTintColor
        menuView.cellSelectionColor = UIColor(red: 0.0/255.0, green:160.0/255.0, blue:195.0/255.0, alpha: 1.0)
        menuView.cellTextLabelColor = UIColor.whiteColor()
        menuView.cellTextLabelFont = UIFont(name: "Avenir-Heavy", size: 17)
        menuView.cellTextLabelAlignment = .Center
        menuView.arrowPadding = 15
        menuView.animationDuration = 0.5
        menuView.maskBackgroundColor = UIColor.blackColor()
        menuView.maskBackgroundOpacity = 0.3
        menuView.didSelectItemAtIndexHandler = {(indexPath: Int) -> () in
            if (indexPath == 0){
                let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("Profile")
                self.showViewController(vc as! UIViewController, sender: vc)
                
            }
            if (indexPath == 1){
                let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("Badges")
                self.showViewController(vc as! UIViewController, sender: vc)
            }
            if (indexPath == 2){
                let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("Q4M_main")
                self.showViewController(vc as! UIViewController, sender: vc)
            }
            if (indexPath == 3){
                let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("Product_Info")
                self.showViewController(vc as! UIViewController, sender: vc)
            }
            
        }
        self.navigationItem.titleView = menuView
        calendarView.changeDaysOutShowingState(true)
        shouldShowDaysOut = true
        
        /////////////////////////////////////progress bar/////////////////////
        
        //get start time
        let LogFileTime = FileUtils(fileName: "TimeLog.csv")
        let start_time = LogFileTime.readFile()
        
        //get current time
        let currentDate = NSDate()
        print(currentDate)
        let calendar = NSCalendar.currentCalendar()
        print(calendar)
        let dateComponents = calendar.components(NSCalendarUnit.Second, fromDate: currentDate)
        let currentTime = dateComponents.second //this is my current time in seconds
        
        //get the progress time
        print(start_time)
        print(currentTime)
        let progressTime = 1.0/(Float(start_time)! - Float(currentTime))
        print(progressTime)
        progressBar.setProgress(progressTime, animated: false)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        calendarView.commitCalendarViewUpdate()
        menuCalView.commitMenuViewUpdate()
    }
    
}

// MARK: - CVCalendarViewDelegate & CVCalendarMenuViewDelegate
extension MainUI: CVCalendarViewDelegate, CVCalendarMenuViewDelegate {
    
    /// Required method to implement!
    func presentationMode() -> CalendarMode {
        return .MonthView
    }
    
    /// Required method to implement!
    func firstWeekday() -> Weekday {
        return .Sunday
    }
    
    // MARK: Optional methods
    
    func shouldShowWeekdaysOut() -> Bool {
        return shouldShowDaysOut
    }
    
    func shouldAnimateResizing() -> Bool {
        return true // Default value is true
    }
    
    func didSelectDayView(dayView: CVCalendarDayView, animationDidFinish: Bool) {
        print("\(dayView.date.commonDescription) is selected!")
        selectedDay = dayView
    }
   
    func presentedDateUpdated(date: CVDate) {
        if monthLabel.text != date.globalDescription && self.animationFinished {
            let updatedMonthLabel = UILabel()
            updatedMonthLabel.textColor = monthLabel.textColor
            updatedMonthLabel.font = monthLabel.font
            updatedMonthLabel.textAlignment = .Center
            updatedMonthLabel.text = date.globalDescription
            updatedMonthLabel.sizeToFit()
            updatedMonthLabel.alpha = 0
            updatedMonthLabel.center = self.monthLabel.center
            
            let offset = CGFloat(48)
            updatedMonthLabel.transform = CGAffineTransformMakeTranslation(0, offset)
            updatedMonthLabel.transform = CGAffineTransformMakeScale(1, 0.1)
            
            UIView.animateWithDuration(0.35, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                self.animationFinished = false
                self.monthLabel.transform = CGAffineTransformMakeTranslation(0, -offset)
                self.monthLabel.transform = CGAffineTransformMakeScale(1, 0.1)
                self.monthLabel.alpha = 0
                
                updatedMonthLabel.alpha = 1
                updatedMonthLabel.transform = CGAffineTransformIdentity
                
            }) { _ in
                
                self.animationFinished = true
                self.monthLabel.frame = updatedMonthLabel.frame
                self.monthLabel.text = updatedMonthLabel.text
                self.monthLabel.transform = CGAffineTransformIdentity
                self.monthLabel.alpha = 1
                updatedMonthLabel.removeFromSuperview()
            }
            
            self.view.insertSubview(updatedMonthLabel, aboveSubview: self.monthLabel)
        }
    }
 
    func weekdaySymbolType() -> WeekdaySymbolType {
        return .Short
    }
    
    func selectionViewPath() -> ((CGRect) -> (UIBezierPath)) {
        return { UIBezierPath(rect: CGRectMake(0, 0, $0.width, $0.height)) }
    }
    
    func shouldShowCustomSingleSelection() -> Bool {
        return false
    }
    
    func supplementaryView(viewOnDayView dayView: DayView) -> UIView {
        let π = M_PI
        
        let ringSpacing: CGFloat = 3.0
        let ringInsetWidth: CGFloat = 1.0
        let ringVerticalOffset: CGFloat = 1.0
        var ringLayer: CAShapeLayer!
        let ringLineWidth: CGFloat = 4.0
        let ringLineColour: UIColor = .greenColor()
        
        let newView = UIView(frame: dayView.bounds)
        
        let diameter: CGFloat = (newView.bounds.width) - ringSpacing
        let radius: CGFloat = diameter / 2.0
        
        let rect = CGRectMake(newView.frame.midX-radius, newView.frame.midY-radius-ringVerticalOffset, diameter, diameter)
        
        ringLayer = CAShapeLayer()
        
        // START OF CODE FOR PUTTING COIN AT THE CORNER
        let imageSubLayer = CALayer()
        let image = UIImage(named: "coin_gold")
        let height = (image?.size.height)!/10 ?? 0
        let width = (image?.size.width)!/10 ?? 0
        let startFrame = CGRectMake(0, 0, width, height)
        imageSubLayer.frame = startFrame
        imageSubLayer.contentsScale = newView.contentScaleFactor
        imageSubLayer.contents = image?.CGImage
        // END OF CODE FOR PUTTING COIN AT THE CORNER
        
        newView.layer.addSublayer(ringLayer)
        newView.layer.addSublayer(imageSubLayer)
        
        ringLayer.fillColor = nil
        ringLayer.lineWidth = ringLineWidth
        ringLayer.strokeColor = ringLineColour.CGColor
        
        let ringLineWidthInset: CGFloat = CGFloat(ringLineWidth/2.0) + ringInsetWidth
        let ringRect: CGRect = CGRectInset(rect, ringLineWidthInset, ringLineWidthInset)
        let centrePoint: CGPoint = CGPointMake(ringRect.midX, ringRect.midY)
        let startAngle: CGFloat = CGFloat(-π/2.0)
        let endAngle: CGFloat = CGFloat(π * 2.0) + startAngle
        let ringPath: UIBezierPath = UIBezierPath(arcCenter: centrePoint, radius: ringRect.width/2.0, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        ringLayer.path = ringPath.CGPath
        ringLayer.frame = newView.layer.bounds
        
        return newView
    }
    
    func supplementaryView(shouldDisplayOnDayView dayView: DayView) -> Bool {
        let month = 4
        let day = 1...24
        if let date = dayView.date {
            if( day.contains(date.day) && date.month == month) {
                return true
            }
        } else {
            // date is nil :(
        }
        
        return false
    }
 
}

// MARK: - CVCalendarViewAppearanceDelegate

extension MainUI: CVCalendarViewAppearanceDelegate {
    func dayLabelPresentWeekdayInitallyBold() -> Bool {
        return false
    }
    
    func spaceBetweenDayViews() -> CGFloat {
        return 2
    }
}

// MARK: - IB Actions

extension MainUI {
    
    @IBAction func todayMonthView() {
        calendarView.toggleCurrentDayView()
    }
    
    /// Switch to WeekView mode.
    @IBAction func toWeekView(sender: AnyObject) {
        calendarView.changeMode(.WeekView)
    }
    
    /// Switch to MonthView mode.
    @IBAction func toMonthView(sender: AnyObject) {
        calendarView.changeMode(.MonthView)
    }
    
    @IBAction func loadPrevious(sender: AnyObject) {
        calendarView.loadPreviousView()
    }
    
    
    @IBAction func loadNext(sender: AnyObject) {
        calendarView.loadNextView()
    }
}

// MARK: - Convenience API Demo
extension MainUI {
    func toggleMonthViewWithMonthOffset(offset: Int) {
        let calendar = NSCalendar.currentCalendar()
        //        let calendarManager = calendarView.manager
        let components = Manager.componentsForDate(NSDate()) // from today
        
        components.month += offset
        
        let resultDate = calendar.dateFromComponents(components)!
        
        self.calendarView.toggleViewWithDate(resultDate)
    }
    
    func didShowNextMonthView(date: NSDate)
    {
        //        let calendar = NSCalendar.currentCalendar()
        //        let calendarManager = calendarView.manager
        let components = Manager.componentsForDate(date) // from today
        
        print("Showing Month: \(components.month)")
    }
    
    
    func didShowPreviousMonthView(date: NSDate)
    {
        //        let calendar = NSCalendar.currentCalendar()
        //        let calendarManager = calendarView.manager
        let components = Manager.componentsForDate(date) // from today
        
        print("Showing Month: \(components.month)")
    }
    
}



