package za.co.entelect.kindling.transition

import android.app.ActivityOptions
import android.content.Intent
import android.os.Bundle
import android.view.View
import androidx.appcompat.app.AppCompatActivity
import za.co.entelect.kindling.R

class TransitionExampleActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_transition_example)
    }

    fun onNextScreenTapped(view: View) {
        val intent = Intent(this, TransitionExampleSecondScreenActivity::class.java)
        val options = ActivityOptions.makeSceneTransitionAnimation(this).toBundle()
        startActivity(intent, options)
    }





}