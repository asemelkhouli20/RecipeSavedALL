//
//  CustomHalfSheet.swift
//  RecipeSaved
//
//  Created by Asem on 09/03/2022.
//

import SwiftUI

// Custom Half Sheet Modifier...
extension View {
     //Binding show variable
    func halfSheet<SheetView:View>(showSheet:Binding<Bool>,@ViewBuilder sheetView : @escaping ()->SheetView,onEnd:@escaping ()->())->some View{
        return self
            .background { HalfSheefHelper(sheetView: sheetView(),showSheet: showSheet,onEnd:onEnd ) }
    }
}

// UIKit Integration...
struct HalfSheefHelper<SheetView:View>:UIViewControllerRepresentable{
    var sheetView:SheetView
    
    @Binding var showSheet:Bool
    var onEnd:()->()
    
    let controller=UIViewController()
    
    func makeCoordinator() -> Coordinator { return Coordinator(parent: self) }
    
    func makeUIViewController(context: Context) ->  UIViewController {
        controller.view.backgroundColor = .clear
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if showSheet{
            let sheetController = CustomHostingContoller(rootView: sheetView)
            sheetController.presentationController?.delegate=context.coordinator
            //present model view
            uiViewController.present(sheetController, animated: true)
        }else{
            //closing view when showSheet toggled again
            uiViewController.dismiss(animated: true)
        }
        
    }
    
    class Coordinator:NSObject,UISheetPresentationControllerDelegate{
        var parent:HalfSheefHelper
        
        init(parent:HalfSheefHelper) { self.parent=parent }
        
        func presentationControllerDidDismiss(_ presentationController: UIPresentationController) { parent.showSheet=false; parent.onEnd() }
    }
    
}

// Custom UIHostingController for halfSheet ..
class CustomHostingContoller<Content:View>:UIHostingController<Content>{
    override func viewDidLoad() {
        
        view.backgroundColor = .clear
        
        if let presentController = presentationController as? UISheetPresentationController{
            presentController.detents=[.medium(),.large()]
            presentController.prefersGrabberVisible=true
        }
        
    }
}
