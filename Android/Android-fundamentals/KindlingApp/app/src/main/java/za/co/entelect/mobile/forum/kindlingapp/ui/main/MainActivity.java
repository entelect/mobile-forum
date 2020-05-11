package za.co.entelect.mobile.forum.kindlingapp.ui.main;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.MenuItem;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.ActionBarDrawerToggle;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.view.GravityCompat;
import androidx.drawerlayout.widget.DrawerLayout;

import com.google.android.material.navigation.NavigationView;
import com.squareup.picasso.Picasso;

import za.co.entelect.mobile.forum.kindlingapp.R;
import za.co.entelect.mobile.forum.kindlingapp.data.member.model.Member;
import za.co.entelect.mobile.forum.kindlingapp.ui.login.LoginActivity;
import za.co.entelect.mobile.forum.kindlingapp.ui.profile.ProfileActivity;

public class MainActivity extends AppCompatActivity {

    private static final String MEMBER_EXTRA_KEY = "member_extra_key";
    private ActionBarDrawerToggle actionBarDrawerToggle;
    private Member loggedInUser;
    private NavigationView navigationView;

    public static Intent getStartIntent(Context context, Member model) {
        Intent intent = new Intent(context, MainActivity.class);
        intent.putExtra(MEMBER_EXTRA_KEY, model);
        return intent;
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main_activity);
        if (savedInstanceState == null) {
            getSupportFragmentManager().beginTransaction()
                    .replace(R.id.container, MainFragment.newInstance())
                    .commitNow();
        }
        setLoggedInUser();
        setupNavigation();
    }

    private void setLoggedInUser() {
        if (getIntent().getExtras() != null) {
            loggedInUser = (Member) getIntent().getExtras().getSerializable(MEMBER_EXTRA_KEY);
        }
    }

    private void setupNavigation() {
        final DrawerLayout drawerLayout = findViewById(R.id.root);
        actionBarDrawerToggle = new ActionBarDrawerToggle(this, drawerLayout, R.string.open_drawer, R.string.close_drawer);
        drawerLayout.addDrawerListener(actionBarDrawerToggle);
        actionBarDrawerToggle.syncState();

        if (getSupportActionBar() != null) {
            getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        }
        navigationView = findViewById(R.id.navigation);
        LinearLayout layout = (LinearLayout) navigationView.getHeaderView(0);
        ImageView imageView = layout.findViewById(R.id.navigation_header_image0);
        Picasso.get().load(loggedInUser.getImageList().get(0)).into(imageView);
        navigationView.setNavigationItemSelectedListener(new NavigationView.OnNavigationItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem item) {
                drawerLayout.closeDrawer(GravityCompat.START);
                switch (item.getItemId()) {
                    case R.id.profile: {
                        onProfileSelected();
                        return true;
                    }
                    case R.id.settings: {
                        onSettingsSelected();
                        return true;
                    }
                    case R.id.logout: {
                        onLogoutSelected();
                        return true;
                    }
                }
                return false;
            }
        });
    }

    private void onSettingsSelected() {
        Toast.makeText(this, "This has not yet been implemented", Toast.LENGTH_SHORT).show();
    }

    private void onProfileSelected() {
        startActivity(ProfileActivity.getInstance(this, loggedInUser));
    }

    private void onLogoutSelected() {
        Intent intent = new Intent(MainActivity.this, LoginActivity.class);
        startActivity(intent);
        finish();
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        if (actionBarDrawerToggle.onOptionsItemSelected(item)) {
            return true;
        }
        return super.onOptionsItemSelected(item);
    }
}
