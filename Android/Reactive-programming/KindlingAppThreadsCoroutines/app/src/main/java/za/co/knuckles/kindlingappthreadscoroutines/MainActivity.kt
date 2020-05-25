package za.co.knuckles.kindlingappthreadscoroutines

import android.graphics.BitmapFactory
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.util.Log
import kotlinx.android.synthetic.main.activity_main.*
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch
import java.net.URL

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val selfieUrl =
           // URL("https://raw.githubusercontent.com/sahilNaran/demos-hosting-images/master/cat_selfie.jpg?token=ABXDFPDPFW3EOFDF4THDL326ZODRA")
            URL("https://i.redd.it/vn48q55ev4i31.jpg")

        /*
        * 1. Doing background processing on the main(UI) thread
        * */

//        val connection = selfieUrl.openConnection()
//        connection.doInput = true // sets the connection to be used for input/download
//        connection.connect()
//
//        val inputSteam = connection.getInputStream()
//        val bitmap = BitmapFactory.decodeStream(inputSteam)
//
//        imageContainer.setImageBitmap(bitmap)

        /*
        * 2. The above throws android.os.NetworkOnMainThreadException
        * Android by default forbids you from using the main thread for networking or database calls
        *
        * 2.1 Background processing
        * Using threads to aid in downloading the picture
        * Avoid blocking the main thread
        * */

//        Thread(Runnable {
//            val connection = selfieUrl.openConnection()
//            connection.doInput = true
//            connection.connect()
//
//            val inputSteam = connection.getInputStream()
//            val bitmap = BitmapFactory.decodeStream(inputSteam)
//
//            imageContainer.setImageBitmap(bitmap)
//        }).start()

        /*
        * The above code fails because we are updating the UI in a different thread, and not the UI thread
        *
        * The only way to update the UI is through the main thread
        *
        * 2.2 Posting results to the main thread
        * There's two ways
        * */

       // Most simply way (needs access to the activity )
//        Thread(Runnable {
//            val connection = selfieUrl.openConnection()
//            connection.doInput = true
//            connection.connect()
//
//            val inputSteam = connection.getInputStream()
//            val bitmap = BitmapFactory.decodeStream(inputSteam)
//
//            runOnUiThread {
//                imageContainer.setImageBitmap(bitmap)
//            }
//        }).start()

        /*
        * 2.3
        * Second way - using handlers (used to send messages to the loopers) and
        * loopers (main looper, for the main thread)
        * */

//        val mainLooper = Looper.getMainLooper()
//        Thread(Runnable {
//            val connection = selfieUrl.openConnection()
//            connection.doInput = true
//            connection.connect()
//
//            val inputSteam = connection.getInputStream()
//            val bitmap = BitmapFactory.decodeStream(inputSteam)
//
//            Handler(mainLooper).post {
//                imageContainer.setImageBitmap(bitmap)
//            }
//        }).start()

        /*
        * 3. Coroutines basics
        * Globalscope most simple to use, lives according to the application
        *
        * Uses default coroutine scope
        * */

//        //Runs on defualt thread pool
//        Log.d("MainActivityThread", Thread.currentThread().name)
//        GlobalScope.launch {
//            Log.d("MainActivityThread", Thread.currentThread().name)
//            val connection = selfieUrl.openConnection()
//            connection.doInput = true
//            connection.connect()
//
//            val inputSteam = connection.getInputStream()
//            val bitmap = BitmapFactory.decodeStream(inputSteam)
//
//            Handler(mainLooper).post {
//                Log.d("MainActivityThread", Thread.currentThread().name)
//                imageContainer.setImageBitmap(bitmap)
//            }
//        }

        /*
        * 3.1 Coroutine scope basics
        * */

        Log.d("MainActivityThread", Thread.currentThread().name)
        //context = Dispatchers.IO -> GlobalScope.launch(context = Dispatchers.IO)
        GlobalScope.launch(Dispatchers.IO) {
            Log.d("MainActivityThread", Thread.currentThread().name)
            val connection = selfieUrl.openConnection()
            connection.doInput = true
            connection.connect()

            val inputSteam = connection.getInputStream()
            val bitmap = BitmapFactory.decodeStream(inputSteam)

            //the scope is a coroutine scope, so we can just use launch
            launch(Dispatchers.Main) {
                Log.d("MainActivityThread", Thread.currentThread().name)
                imageContainer.setImageBitmap(bitmap)
            }
        }
    }
}