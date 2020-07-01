package za.co.entelect.kindling

import android.content.Intent
import android.os.Bundle
import android.view.View
import androidx.appcompat.app.AppCompatActivity
import za.co.entelect.kindling.animate.AnimateExampleActivity
import za.co.entelect.kindling.motionlayout.MotionLayoutExampleActivity
import za.co.entelect.kindling.sharedelement.SharedElementExampleActivity
import za.co.entelect.kindling.transition.TransitionExampleActivity

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

    fun onSharedElementExampleTapped(view: View) {
        startActivity(Intent(this, SharedElementExampleActivity::class.java))
    }

    fun onMotionLayoutExampleTapped(view: View) {
        startActivity(Intent(this, MotionLayoutExampleActivity::class.java))
    }

    fun onAnimateExampleTapped(view: View) {
        startActivity(Intent(this, AnimateExampleActivity::class.java))
    }

    fun onTransitionExampleTapped(view: View) {
        startActivity(Intent(this, TransitionExampleActivity::class.java))
    }
}