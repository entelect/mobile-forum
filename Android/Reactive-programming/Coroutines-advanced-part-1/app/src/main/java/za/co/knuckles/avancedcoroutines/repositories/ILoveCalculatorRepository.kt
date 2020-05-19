package za.co.knuckles.avancedcoroutines.repositories

import za.co.knuckles.avancedcoroutines.repositories.api.responses.LoveCalculatorResponseModel
import za.co.knuckles.avancedcoroutines.repositories.database.models.LoveResult

interface ILoveCalculatorRepository {

    fun getPreviousLoveCalculations(onSuccess: (List<LoveResult>) -> Unit)

    fun calculateLovePercentage(
        firstName: String, secondName: String,
        onSuccess: (LoveCalculatorResponseModel) -> Unit,
        onError: (Throwable) -> Unit
    )
}