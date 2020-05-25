package za.co.knuckles.avancedcoroutines.repositories

import za.co.knuckles.avancedcoroutines.repositories.api.responses.LoveCalculatorResponseModel
import za.co.knuckles.avancedcoroutines.repositories.database.models.LoveResult

interface ILoveCalculatorRepository {

    suspend fun getPreviousLoveCalculations(): List<LoveResult>

    suspend fun calculateLovePercentage(
        firstName: String, secondName: String
    ): LoveCalculatorResponseModel
}