package za.co.entelect.mobileforum.mutabledata.ui.main

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProvider
import kotlinx.android.synthetic.main.main_fragment.*
import za.co.entelect.mobileforum.mutabledata.R


class MainFragment : Fragment() {

    companion object {
        fun newInstance() = MainFragment()
    }

    private lateinit var viewModel: MainViewModel

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        return inflater.inflate(R.layout.main_fragment, container, false)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        viewModel = ViewModelProvider(this).get(MainViewModel::class.java)

        viewModel.friendlyNameEmitted.observe(this, Observer { dateName ->
            new_date_name.text = dateName
        })

        viewModel.isEmittingDateName.observe(this, Observer { isEmitting ->
            button_date_stop.isEnabled = isEmitting ?: false
            button_date_change_name_start.isEnabled = !button_date_stop.isEnabled
        })
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        button_date_change_name_start.setOnClickListener {
            viewModel.startEmittingNames()
            viewModel.startEmittingPlaces()
        }

        button_date_stop.setOnClickListener {
            viewModel.stopEmittingNames()
            viewModel.stopEmittingPlaces()
        }
    }
}
