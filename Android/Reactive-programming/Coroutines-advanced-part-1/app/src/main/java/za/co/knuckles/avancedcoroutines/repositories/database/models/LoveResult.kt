package za.co.knuckles.avancedcoroutines.repositories.database.models

import androidx.room.Entity
import androidx.room.PrimaryKey
import com.google.gson.annotations.SerializedName

@Entity(tableName = "loveresults")
class LoveResult(

    @PrimaryKey(autoGenerate = true) val id: Int = 0,
    val firstName: String,
    val secondName: String,
    val percentage: String
)