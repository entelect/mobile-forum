package za.co.entelect.mobileforum.mutabledata.ui.main

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.Transformations
import androidx.lifecycle.ViewModel
import za.co.entelect.mobileforum.mutabledata.utils.NameUtil
import java.util.*
import kotlin.concurrent.schedule

class MainViewModel : ViewModel() {
    private val dateNameEmitter = MutableLiveData<String>()
    val isEmittingDateName = MutableLiveData<Boolean>()

    //Also has switchMap and DistinctUntilChanged
    val friendlyNameEmitted = Transformations.map(dateNameEmitter) { name ->
        "Your new date is: " + name
    }

    private var TIMER_NAME = "DateNames";
    private var timer = Timer(TIMER_NAME, false)
    private var rand = Random();

    fun startEmittingNames() {
        isEmittingDateName.postValue(true)

        timer.schedule(20, rand.nextInt(1000).toLong()) {
            dateNameEmitter.postValue(NameUtil.GetRandomName());
        }
    }

    fun stopEmittingNames() {
        isEmittingDateName.postValue(false)
        timer.cancel()
        timer = Timer(TIMER_NAME, false)
    }
}
