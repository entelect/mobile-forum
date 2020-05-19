package za.co.knuckles.avancedcoroutines.repositories.api.webservices

import retrofit2.Call
import retrofit2.http.GET
import retrofit2.http.Path
import retrofit2.http.Query
import za.co.knuckles.avancedcoroutines.repositories.api.responses.LoveCalculatorResponseModel

interface LoveApiService {
    @GET("getPercentage")
    fun calculateLovePercentage(
        @Query("fname") firstName: String,
        @Query("sname") secondName: String
    ): Call<LoveCalculatorResponseModel>
}