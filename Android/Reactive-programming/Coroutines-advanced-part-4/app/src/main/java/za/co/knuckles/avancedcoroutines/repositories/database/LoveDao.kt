package za.co.knuckles.avancedcoroutines.repositories.database

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import za.co.knuckles.avancedcoroutines.repositories.database.models.LoveResult

@Dao
interface LoveResultsDao {
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun saveResult(loveResult: LoveResult)

    @Query("SELECT * FROM loveresults ORDER BY id DESC")
    suspend fun getPastResults(): List<LoveResult>
}