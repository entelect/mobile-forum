package za.co.entelect.mobileforum.mutabledata.utils

import java.util.*

class NameUtil {

    companion object {
        fun GetRandomName(): String {
            val randomDateNames = listOf(
                "Genghis Khan",
                "Marilyn Monroe ",
                "Mother Teresa",
                "Elvis Presley",
                "Rosa Parks",
                "Ingrid Bergman",
                "Me",
                "Cleopatra",
                "Joseph Stalin"
            )
            val rand = Random()
            return randomDateNames[rand.nextInt(randomDateNames.size)]
        }
    }
}