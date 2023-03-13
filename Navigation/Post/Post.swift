//
//  Post.swift
//  Navigation
//
//  Created by Егор Ермолицкий on 07.02.2023.
//

import UIKit

struct Post {
    let author: String
    let discription: String
    let image: UIImage
    var likes: Int
    var views: Int
    
    static func makeMockPost() -> [Post] {
        return [
            Post(author: "empress.official", discription: "Пираты настало время поднять паруса! \"Hogwarts legacy\" уже на торренте ", image: UIImage(named: "hogwarts")!, likes: 3800, views: 4000),
            Post(author: "elon", discription: "Свершилось не возможное! Мы стали на шаг ближе к колонизации Марса. Я со своей командой смог вырастить цветок! Но пока только на земле.", image: UIImage(named: "Flower")!, likes: 1000, views: 1050),
            Post(author: "VinDiesel.official", discription: "Фарсаж последняя гонка. По крайней мере более последняя чем в прошлом году. Вы увидите: Семью, перстрелки, взрывы, падения и совсем чуть-чуть гонок", image: UIImage(named: "Fast")!, likes: 590, views: 600),
            Post(author: "atomic.heart", discription: "Близняшки просили передать, что лучшим подарком на 8 марта это купить PREMIUM EDITION", image: UIImage(named: "Atomic")!, likes: 2000, views: 2120)]
    }
}

