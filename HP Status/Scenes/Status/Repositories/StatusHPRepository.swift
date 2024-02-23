//
//  StatusHPRepository.swift
//  HP Status
//
//  Created by Javier on 23/02/24.
//

protocol StatusHPRepository {
  func getStatus(closure: @escaping ([StatusHP]) -> Void)
}

struct StatusHPRepositoryDummy: StatusHPRepository {
  func getStatus(closure: @escaping ([StatusHP]) -> Void) {
    let statusHP: [StatusHP] = [
      StatusHP(title: "All Characters", statusCode: 200),
      StatusHP(title: "Specific Character by ID", statusCode: 200),
      StatusHP(title: "Characters in a House", statusCode: 200),
      StatusHP(title: "Hogwarts Students", statusCode: 200),
      StatusHP(title: "Hogwarts Staff", statusCode: 200),
      StatusHP(title: "All Spells", statusCode: 200)
    ]
    closure(statusHP)
  }
}


struct StatusHPRepository2Dummy: StatusHPRepository {
  func getStatus(closure: @escaping ([StatusHP]) -> Void) {
    let statusHP: [StatusHP] = [
      StatusHP(title: "All Characters", statusCode: 200),
      StatusHP(title: "Specific Character by ID", statusCode: 200),
      StatusHP(title: "Characters in a House", statusCode: 200),
      StatusHP(title: "Hogwarts Students", statusCode: 500),
      StatusHP(title: "Hogwarts Staff", statusCode: 200),
      StatusHP(title: "All Spells", statusCode: 200)]
    closure(statusHP)
  }
}
