//
//  BSBNavi.swift
//  OffDuty
//
//  Created by 黄志刚 on 2016/11/17.
//  Copyright © 2016年 Huangzhigang. All rights reserved.
//

import UIKit

class BSBNavi: UINavigationController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        delegate = self

    }


    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        viewController.hidesBottomBarWhenPushed = true
        super.pushViewController(viewController, animated: animated)
        
        print(viewControllers.count)
        
    }
    
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        interactivePopGestureRecognizer?.isEnabled = viewControllers.count>1
        
        print(viewControllers.count)
    }
   
    
}

/*
extension BSBNavi: UIGestureRecognizerDelegate {
    
    
    
    
    // called when a gesture recognizer attempts to transition out of UIGestureRecognizerStatePossible. returning NO causes it to transition to UIGestureRecognizerStateFailed
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool{
        return true
    }
    
    
    // called when the recognition of one of gestureRecognizer or otherGestureRecognizer would be blocked by the other
    // return YES to allow both to recognize simultaneously. the default implementation returns NO (by default no two gestures can be recognized simultaneously)
    //
    // note: returning YES is guaranteed to allow simultaneous recognition. returning NO is not guaranteed to prevent simultaneous recognition, as the other gesture's delegate may return YES
   func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool{
        
        return true
        
    }
    
    
    // called once per attempt to recognize, so failure requirements can be determined lazily and may be set up between recognizers across view hierarchies
    // return YES to set up a dynamic failure requirement between gestureRecognizer and otherGestureRecognizer
    //
    // note: returning YES is guaranteed to set up the failure requirement. returning NO does not guarantee that there will not be a failure requirement as the other gesture's counterpart delegate or subclass methods may return YES
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRequireFailureOf otherGestureRecognizer: UIGestureRecognizer) -> Bool{
        return true
    }
    
//   func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool
    
    
    // called before touchesBegan:withEvent: is called on the gesture recognizer for a new touch. return NO to prevent the gesture recognizer from seeing this touch
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool{
        return true
    }
    
    
    // called before pressesBegan:withEvent: is called on the gesture recognizer for a new press. return NO to prevent the gesture recognizer from seeing this press
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive press: UIPress) -> Bool{
        return true
    }
    
    
}
 */

// MARK: - delegate
extension BSBNavi {
    
    

    
    
}
