package za.co.knuckles.kotlinflow.dependency_injection

import okhttp3.OkHttpClient
import org.koin.dsl.module
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import za.co.knuckles.kotlinflow.repositories.api.webservices.LoveApiService

//should be in the gradle
private const val BASE_URL = "https://love-calculator.p.rapidapi.com/"

private const val API_KEY_KEY = "x-rapidapi-key"
private const val API_KEY_VALUE =  "13b364c4ddmsh4b9c0de1b9c8ff0p1b6b4ajsn43015133f825"

private const val HOST_KEY = "x-rapidapi-host"
private const val HOST_VALUE = "love-calculator.p.rapidapi.com"


fun networkingModule() = module {
    single {
        val httpClientBuilder = OkHttpClient.Builder()
        httpClientBuilder.addInterceptor{chain ->
            val original = chain.request()

            // Request customization: add request headers
            val requestBuilder = original.newBuilder()
                .addHeader(HOST_KEY, HOST_VALUE)
                .addHeader(API_KEY_KEY, API_KEY_VALUE)

            val request = requestBuilder.build()
            chain.proceed(request)
        }
        httpClientBuilder.build()
    }

    single {GsonConverterFactory.create()}

    single {
        Retrofit.Builder()
            .addConverterFactory(get<GsonConverterFactory>())
            .client(get<OkHttpClient>())
            .baseUrl(BASE_URL)
            .build()
    }

    single { get<Retrofit>().create(LoveApiService::class.java) }

}