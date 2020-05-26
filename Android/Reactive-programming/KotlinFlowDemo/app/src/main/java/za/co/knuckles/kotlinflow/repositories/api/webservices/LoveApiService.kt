package za.co.knuckles.kotlinflow.repositories.api.webservices

import retrofit2.http.GET
import retrofit2.http.Query
import za.co.knuckles.kotlinflow.repositories.api.responses.LoveCalculatorResponseModel

interface LoveApiService {
    @GET("getPercentage")
    suspend fun calculateLovePercentage(
        @Query("fname") firstName: String,
        @Query("sname") secondName: String
    ): LoveCalculatorResponseModel
}