package za.co.knuckles.kotlinflow.repositories.database

import android.content.Context
import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase
import za.co.knuckles.kotlinflow.repositories.database.models.LoveResult

@Database (entities = [LoveResult::class], version = 1)
abstract class LoveCalculatorDatabase : RoomDatabase() {

    abstract fun loveDao(): LoveResultsDao

    companion object {
        fun create (context: Context) : LoveCalculatorDatabase {
            val builder = Room.databaseBuilder(context, LoveCalculatorDatabase::class.java, "LoveCalculatorResults")
            //builder.allowMainThreadQueries() // BAD can cause ANR messages and crash the app
            return  builder.build()
        }
    }

}