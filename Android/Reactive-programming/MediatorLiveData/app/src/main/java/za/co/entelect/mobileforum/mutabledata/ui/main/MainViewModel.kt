package za.co.entelect.mobileforum.mutabledata.ui.main

import androidx.lifecycle.*
import za.co.entelect.mobileforum.mutabledata.utils.NameUtil
import java.util.*
import kotlin.concurrent.schedule

class MainViewModel : ViewModel() {
    private val dateNameEmitter = MutableLiveData<String>()
    private val datePlaceEmitter = MutableLiveData<String>()
    val isEmittingDateName = MutableLiveData<Boolean>()

    //Also has switchMap and DistinctUntilChanged
    val friendlyNameEmitted = Transformations.map(combineNameAndPlaceEmitter()) { name ->
        "Your new date and place is: $name"
    }

    private var DATE_TIMER_NAME = "DateNames";
    private var dateTimer = Timer(DATE_TIMER_NAME, false)

    private var PLACE_TIMER_NAME = "PlaceNames";
    private var placeTimer = Timer(PLACE_TIMER_NAME, false)

    private var rand = Random();

    fun combineNameAndPlaceEmitter(): LiveData<String> {
        val result = MediatorLiveData<String>()

        result.addSource(dateNameEmitter) { value ->
            result.postValue(combineData(dateNameEmitter, datePlaceEmitter))
        }
        result.addSource(datePlaceEmitter) { value ->
            result.postValue(combineData(dateNameEmitter, datePlaceEmitter))
        }
        return result
    }

    private fun combineData(dateName: LiveData<String>, placeName: LiveData<String>): String {
        return "${dateName.value} at ${placeName.value}"
    }

    fun startEmittingNames() {
        isEmittingDateName.postValue(true)

        dateTimer.schedule(20, rand.nextInt(1000).toLong()) {
            dateNameEmitter.postValue(NameUtil.GetRandomDateName());
        }
    }

    fun startEmittingPlaces() {
        isEmittingDateName.postValue(true)

        placeTimer.schedule(0, rand.nextInt(1000).toLong()) {
            datePlaceEmitter.postValue(NameUtil.GetRandomDatePlaceName());
        }
    }

    fun stopEmittingNames() {
        isEmittingDateName.postValue(false)
        dateTimer.cancel()
        dateTimer = Timer(DATE_TIMER_NAME, false)
    }

    fun stopEmittingPlaces() {
        isEmittingDateName.postValue(false)
        placeTimer.cancel()
        placeTimer = Timer(PLACE_TIMER_NAME, false)
    }
}
