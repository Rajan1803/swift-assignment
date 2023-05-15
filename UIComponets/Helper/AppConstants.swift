//
//  AppConstants.swift
//  UIComponets
//
//  Created by Rajan Patel on 09/05/23.
//

import Foundation

struct Constants {
    
    struct Img {
        static let circle = "circle"
        static let checkmarkCircle = "checkmark.circle"
        static let squareAndArrowUp = "square.and.arrow.up"
        static let squareAndArrowDown = "square.and.arrow.down"
        static let pencil = "pencil"
        static let ractangePrortraitArrowRight = "rectangle.portrait.and.arrow.right"
        static let pencilSlash = "pencil.slash"
        static let userName = "usernameLogo2"
        static let password = "passLogo"
        static let location = "locationLogo"
        static let pincode = "pinlogo"
        static let email = "emailLogo"
        static let solidEye = "eye-solid"
        static let hidePassword = "hidePass"
    }
    
    struct ViewController {
        static let redViewController = "redViewController"
        static let blueViewController = "blueViewController"
    }
    struct String {
        static let address = "address"
        static let cancel = "cancel"
        static let normal = "normal"
        static let highlighed = "highlighed"
        static let disabled = "disabled"
        static let focused = "focused"
        static let addedProgrammatically = "added Programmatically"
        
    }
    
    struct Regex {
        static let postalVarificationRegex = "^[0-9]{6}(-[0-9]{4})?$"
        static let emailVarificationRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        static let passwordVarificationRegex = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$"
        
    }
    
    struct Nib {
        static let customButton = "CustomButton"
        
    }
    
    struct MediaTypes {
        static let imageType = "public.image"
        static let movieType = "public.movie"
    }
    static let standardBorderWidth: CGFloat = 2
}
