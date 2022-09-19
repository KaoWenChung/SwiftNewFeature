
func evaluate(good: String, vsEvil evil: String) -> String {
  let goods: [String: Int] = ["Hobbits":1,
                             "Men":2,
                             "Elves":3,
                             "Dwarves":3,
                             "Eagles":4,
                             "Wizards":10]
  
  let evils: [String: Int] = ["Orcs":1,
                             "Men":2,
                             "Wargs":2,
                             "Goblins":2,
                             "Urul Hai":3,
                             "Trolls":5,
                             "Wizards":10]
  
  
  let inputGoods = good.split(separator: " ")
  let inputEvils = evil.split(separator: " ")
//   print("inputGoods:", inputGoods, "inputEvils", inputEvils)
  var result: Int = 0
    
  for (index, _good) in goods.enumerated() {
      result += (Int(inputGoods[index]) ?? 0) * _good.value
  }
  
    for (index, _evil) in evils.enumerated() {
        result -= (Int(inputEvils[index]) ?? 0) * _evil.value
    }
  print(result)
  return ""
}

//print(evaluate(good: "1 1 1 1 1 1", vsEvil: "1 1 1 1 1 1 1"))
evaluate(good: "1 1 1 1 1 1", vsEvil: "1 1 1 1 1 1 1")
