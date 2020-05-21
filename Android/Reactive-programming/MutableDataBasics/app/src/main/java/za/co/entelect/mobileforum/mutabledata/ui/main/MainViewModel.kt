package za.co.entelect.mobileforum.mutabledata.ui.main

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel

class MainViewModel : ViewModel() {
    val dateName: MutableLiveData<String> by lazy {
        MutableLiveData<String>()
    }
}
