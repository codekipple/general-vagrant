/*
    The second stage just ensures a apt-get update has
    happened after any PPA's have been added.
*/

class second_stage {

    exec { "final-apt-update":
        command => "sudo apt-get update",
    }

}