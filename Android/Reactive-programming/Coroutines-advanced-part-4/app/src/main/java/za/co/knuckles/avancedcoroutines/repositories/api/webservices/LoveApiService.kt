package za.co.knuckles.avancedcoroutines.repositories.api.webservices

import retrofit2.http.GET
import retrofit2.http.Query
import za.co.knuckles.avancedcoroutines.repositories.api.responses.LoveCalculatorResponseModel

interface LoveApiService {
    @GET("getPercentage")
    suspend fun calculateLovePercentage(
        @Query("fname") firstName: String,
        @Query("sname") secondName: String
    ): LoveCalculatorResponseModel
}