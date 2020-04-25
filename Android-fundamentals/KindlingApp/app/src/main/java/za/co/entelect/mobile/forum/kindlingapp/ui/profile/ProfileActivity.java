package za.co.entelect.mobile.forum.kindlingapp.ui.profile;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;

import androidx.appcompat.app.AppCompatActivity;

import java.io.Serializable;

import za.co.entelect.mobile.forum.kindlingapp.R;
import za.co.entelect.mobile.forum.kindlingapp.data.member.model.Member;

public class ProfileActivity extends AppCompatActivity {

    private static final String MEMBER_EXTRA = "MEMBER_EXTRA";
    private Member member;

    public static Intent getInstance(Context context, Member member) {
        Intent intent = new Intent(context, ProfileActivity.class);
        intent.putExtra(MEMBER_EXTRA, member);
        return intent;
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        if(getIntent().getExtras() != null) {
            this.member = (Member) getIntent().getExtras().getSerializable(MEMBER_EXTRA);
        }

        setContentView(R.layout.profile_activity);
        if (savedInstanceState == null) {
            getSupportFragmentManager().beginTransaction()
                    .replace(R.id.container, ProfileFragment.newInstance(member))
                    .commitNow();
        }
    }
}
