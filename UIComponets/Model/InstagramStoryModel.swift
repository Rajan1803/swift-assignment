//
//  InstagramStoryModel.swift
//  UIComponets
//
//  Created by Rajan Patel on 03/06/23.
//

import UIKit

struct InstaStory {
    
    var storyTitle: String
    var image: UIImage?
    
    static let stories = [InstaStory(storyTitle: "Holidays",image: UIImage(named: Constants.Img.natureOne)), InstaStory(storyTitle: "Birthdays",image: UIImage(named: Constants.Img.natureTwo)), InstaStory(storyTitle: "Party",image: UIImage(named: Constants.Img.natureThree)), InstaStory(storyTitle: "Friends",image: UIImage(named: Constants.Img.natureFour)), InstaStory(storyTitle: "Food",image: UIImage(named: Constants.Img.natureFive)), InstaStory(storyTitle: "Office",image: UIImage(named: Constants.Img.natureSix)),InstaStory(storyTitle: "Goa",image: UIImage(named: Constants.Img.natureOne)), InstaStory(storyTitle: "Nightouts",image: UIImage(named: Constants.Img.natureTwo)), InstaStory(storyTitle: "Funny",image: UIImage(named: Constants.Img.natureThree)), InstaStory(storyTitle: "Memories",image: UIImage(named: Constants.Img.natureFour)), InstaStory(storyTitle: "Movie",image: UIImage(named: Constants.Img.natureFive)), InstaStory(storyTitle: "Me",image: UIImage(named: Constants.Img.natureSix))]
    
    static let uploadedPost = [UIImage(named: Constants.Img.natureOne),UIImage(named: Constants.Img.natureTwo),UIImage(named: Constants.Img.natureFour),UIImage(named: Constants.Img.natureThree),UIImage(named: Constants.Img.natureFive),UIImage(named: Constants.Img.natureSix),]

    static let tagedPosts = [UIImage(named: Constants.Img.natureSeven), UIImage(named: Constants.Img.natureEight)]

    static let reels = [UIImage(named: Constants.Img.natureNine), UIImage(named: Constants.Img.natureTen)]

}
