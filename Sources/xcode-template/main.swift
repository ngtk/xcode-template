import Commander

let initialize = command {
    print("initialized.")
}

let generate = command {
    print("generated.")
}

let link = command {
    print("linked.")
}

let main = Group {
    $0.addCommand("init", initialize)
    $0.addCommand("generate", generate)
    $0.addCommand("link", link)
}
main.run()
