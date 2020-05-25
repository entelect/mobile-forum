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

    override suspend fun getPreviousLoveCalculations(): List<LoveResult> = withContext(Dispatchers.IO) {
        this@LoveCalculatorRepository.loveResultsDao.getPastResults()
    }

    override suspend fun calculateLovePercentage(
        firstName: String,
        secondName: String
    ): LoveCalculatorResponseModel = withContext(Dispatchers.IO) {

        //Call the sync calculate in a async block
        val responseDeferred = async{ this@LoveCalculatorRepository.loveApiService.calculateLovePercentage(firstName, secondName)
            .execute()}
        val response = responseDeferred.await()
        val result = response.body()?.let {
            this@LoveCalculatorRepository.loveResultsDao.saveResult(
                LoveResult(
                    firstName = it.firstName,
                    secondName = it.secondName,
                    percentage = it.percentage
                )
            )
            //Return
            it
        }
        result ?: LoveCalculatorResponseModel("","","", "") // Define own logic instead of returning this
    }
}