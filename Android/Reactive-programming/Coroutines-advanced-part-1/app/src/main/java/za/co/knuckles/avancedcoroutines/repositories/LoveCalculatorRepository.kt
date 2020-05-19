package za.co.knuckles.avancedcoroutines.repositories

import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response
import za.co.knuckles.avancedcoroutines.repositories.api.responses.LoveCalculatorResponseModel
import za.co.knuckles.avancedcoroutines.repositories.api.webservices.LoveApiService
import za.co.knuckles.avancedcoroutines.repositories.database.LoveResultsDao
import za.co.knuckles.avancedcoroutines.repositories.database.models.LoveResult

class LoveCalculatorRepository(
    private val loveApiService: LoveApiService,
    private val loveResultsDao: LoveResultsDao
) : ILoveCalculatorRepository {

    override fun getPreviousLoveCalculations(onSuccess: (List<LoveResult>) -> Unit) {
        onSuccess(loveResultsDao.getPastResults())
    }

    override fun calculateLovePercentage(
        firstName: String,
        secondName: String,
        onSuccess: (LoveCalculatorResponseModel) -> Unit,
        onError: (Throwable) -> Unit
    ) {
        this.loveApiService.calculateLovePercentage(firstName, secondName)
            .enqueue(object : Callback<LoveCalculatorResponseModel> {
                override fun onFailure(call: Call<LoveCalculatorResponseModel>, t: Throwable) {
                    //should check for ioexception (no internet)
                    onError(t)
                }

                override fun onResponse(
                    call: Call<LoveCalculatorResponseModel>,
                    response: Response<LoveCalculatorResponseModel>
                ) {
                    response.body()?.let {
                        this@LoveCalculatorRepository.loveResultsDao.saveResult(
                            LoveResult(
                                firstName = it.firstName,
                                secondName = it.secondName,
                                percentage = it.percentage
                            )
                        )
                        onSuccess(it)
                    }
                }

            })
    }
}