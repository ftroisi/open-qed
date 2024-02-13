"This module prints information at the beginning of the execution of the code."
module logo

    "This method prints the OpenQED logo"
    function print_welcome()
        println(" Welcome to OpenQED!")
        println("|                   |")
        println("| |e> ----x----     |")
        println("|         |  ~~~~-> |")
        println("| ~~~~->  |         |")
        println("|         v  ~~~~-> |")
        println("| |g> ----o----     |")
        println("|                   |")
        println("")
    end

end # module logo