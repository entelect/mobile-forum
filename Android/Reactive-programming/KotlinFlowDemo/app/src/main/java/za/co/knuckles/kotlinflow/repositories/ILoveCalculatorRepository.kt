package za.co.knuckles.kotlinflow.repositories

import kotlinx.coroutines.flow.Flow
import za.co.knuckles.kotlinflow.repositories.api.responses.LoveCalculatorResponseModel
import za.co.knuckles.kotlinflow.repositories.database.models.LoveResult

interface ILoveCalculatorRepository {
    fun getPreviousLoveCalculations(): Flow<List<LoveResult>>

    suspend fun calculateLovePercentage(
        firstName: String, secondName: String
    ): LoveCalculatorResponseModel
}