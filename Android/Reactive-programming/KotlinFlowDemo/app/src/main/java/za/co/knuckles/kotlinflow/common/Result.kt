package za.co.knuckles.kotlinflow.common

class Result<out T>(val value:T?, val throwable: Throwable?)