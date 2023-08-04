///**

/**

PhotosFlickerDemo

Created by: apple on 8/4/23

Copyright (c) 2023 Rowaad


**/


import Foundation

class Moderator {
    private var commands: [Command] = []
    
    init(commands: [Command]) {
        self.commands = commands
    }
    func executeAll(){
        commands.forEach { command in
            DispatchQueue.main.async {
                command.execute()
            }
        }
    }
}
