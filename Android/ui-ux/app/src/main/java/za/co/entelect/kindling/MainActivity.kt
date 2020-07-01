package za.co.entelect.kindling

import android.content.Intent
import android.os.Bundle
import android.view.View
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

    fun onSharedElementExampleTapped(view: View) {

    }

    fun onMotionLayoutExampleTapped(view: View) {

    }

    fun onAnimateOptionTapped(view: View) {
        startActivity(Intent(this, AnimateExampleActivity::class.java))
    }
}