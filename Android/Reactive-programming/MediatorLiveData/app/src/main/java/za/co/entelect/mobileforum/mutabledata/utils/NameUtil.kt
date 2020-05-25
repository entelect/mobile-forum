package za.co.entelect.mobileforum.mutabledata.utils

import java.util.*

class NameUtil {

    companion object {
        fun GetRandomDateName(): String {
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

        fun GetRandomDatePlaceName(): String {
            val randomPlaceNames = listOf(
                "La Colombe",
                "The Test Kitchen",
                "The Restaurant at Waterkloof",
                "Wolfgat",
                "FYN Restaurant",
                "La Petite Colombe",
                "Eike",
                "Salsify",
                "Mosaic at The Orient",
                "Chefs Warehouse",
                "Overture",
                "Tjing Tjing Momiji"
            )
            val rand = Random()
            return randomPlaceNames[rand.nextInt(randomPlaceNames.size)]
        }
    }


}