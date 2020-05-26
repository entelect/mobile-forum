package za.co.knuckles.kotlinflow.repositories

import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.conflate
import kotlinx.coroutines.flow.flowOn
import za.co.knuckles.kotlinflow.repositories.api.responses.LoveCalculatorResponseModel
import za.co.knuckles.kotlinflow.repositories.api.webservices.LoveApiService
import za.co.knuckles.kotlinflow.repositories.database.LoveResultsDao
import za.co.knuckles.kotlinflow.repositories.database.models.LoveResult

class LoveCalculatorRepository(
    private val loveApiService: LoveApiService,
    private val loveResultsDao: LoveResultsDao
) : ILoveCalculatorRepository {

    //Convert to a flow
    private val getPreviousLoveCalculationsFlow: Flow<List<LoveResult>>
        get() = loveResultsDao.getPastResults()
            .flowOn(Dispatchers.IO)
            .conflate()

    override fun getPreviousLoveCalculations(): Flow<List<LoveResult>> {
        return getPreviousLoveCalculationsFlow;
    }

    override suspend fun calculateLovePercentage(
        firstName: String,
        secondName: String
    ): LoveCalculatorResponseModel {

        // If the network call fails. it will throw an exception
        val result = try {
            val response = this@LoveCalculatorRepository.loveApiService.calculateLovePercentage(
                firstName,
                secondName
            )
            this@LoveCalculatorRepository.loveResultsDao.saveResult(
                LoveResult(
                    firstName = response.firstName,
                    secondName = response.secondName,
                    percentage = response.percentage
                )
            )

            response
        } catch (throwable: Throwable) {
            null
        }
        return result ?: LoveCalculatorResponseModel("", "", "", "")
    }
}