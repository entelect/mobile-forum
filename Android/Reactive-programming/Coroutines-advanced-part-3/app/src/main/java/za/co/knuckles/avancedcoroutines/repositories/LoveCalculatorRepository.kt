package za.co.knuckles.avancedcoroutines.repositories

import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.async
import kotlinx.coroutines.withContext
import za.co.knuckles.avancedcoroutines.common.Result
import za.co.knuckles.avancedcoroutines.repositories.api.responses.LoveCalculatorResponseModel
import za.co.knuckles.avancedcoroutines.repositories.api.webservices.LoveApiService
import za.co.knuckles.avancedcoroutines.repositories.database.LoveResultsDao
import za.co.knuckles.avancedcoroutines.repositories.database.models.LoveResult

class LoveCalculatorRepository(
    private val loveApiService: LoveApiService,
    private val loveResultsDao: LoveResultsDao
) : ILoveCalculatorRepository {

    override suspend fun getPreviousLoveCalculations(): List<LoveResult>{
        return this@LoveCalculatorRepository.loveResultsDao.getPastResults()
    }

    override suspend fun calculateLovePercentage(
        firstName: String,
        secondName: String
    ): LoveCalculatorResponseModel {

        // If the network call fails. it will throw an exception
        val result = try {
            val response = this@LoveCalculatorRepository.loveApiService.calculateLovePercentage(firstName, secondName)
            this@LoveCalculatorRepository.loveResultsDao.saveResult(
                LoveResult(
                    firstName = response.firstName,
                    secondName = response.secondName,
                    percentage = response.percentage
                )
            )

            response
        }catch (throwable: Throwable) {
            null
        }
        return result ?: LoveCalculatorResponseModel("","","","")
    }
}