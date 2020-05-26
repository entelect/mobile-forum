package za.co.knuckles.kotlinflow.repositories.database

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import kotlinx.coroutines.flow.Flow
import za.co.knuckles.kotlinflow.repositories.database.models.LoveResult

@Dao
interface LoveResultsDao {
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun saveResult(loveResult: LoveResult)

    @Query("SELECT * FROM loveresults ORDER BY id DESC")
    fun getPastResults(): Flow<List<LoveResult>>
}