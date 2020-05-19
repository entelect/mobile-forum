package za.co.knuckles.avancedcoroutines.repositories.api.responses

import com.google.gson.annotations.SerializedName

data class LoveCalculatorResponseModel (
    @SerializedName("fname") val firstName: String,
    @SerializedName("sname") val secondName: String,
    @SerializedName("percentage") val percentage: String, //api docs define this as a string
    @SerializedName("result") val result: String
)