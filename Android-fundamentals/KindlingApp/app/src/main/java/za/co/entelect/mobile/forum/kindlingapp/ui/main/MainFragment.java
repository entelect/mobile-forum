package za.co.entelect.mobile.forum.kindlingapp.ui.main;

import androidx.appcompat.widget.AppCompatImageView;
import androidx.lifecycle.Observer;
import androidx.lifecycle.ViewModelProvider;

import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.squareup.picasso.Picasso;

import za.co.entelect.mobile.forum.kindlingapp.R;
import za.co.entelect.mobile.forum.kindlingapp.data.member.model.Member;

public class MainFragment extends Fragment {

    private AppCompatImageView mainImageView;
    private TextView nameText;
    private TextView ageText;
    private TextView distanceText;

    private MainViewModel mainViewModel;
    private Member currentMember;

    public static MainFragment newInstance() {
        return new MainFragment();
    }

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.main_fragment, container, false);
        initView(view);
        return view;
    }

    private void initView(View view) {
        FloatingActionButton fabLike = view.findViewById(R.id.fab_like);
        fabLike.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                onLike();
            }
        });
        FloatingActionButton fabLightFire = view.findViewById(R.id.fab_light_fire);
        fabLightFire.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                onLightFire();
            }
        });
        FloatingActionButton fabNope = view.findViewById(R.id.fab_nope);
        fabNope.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                onNope();
            }
        });

        mainImageView = view.findViewById(R.id.imageContainer);
        nameText = view.findViewById(R.id.name_text);
        ageText = view.findViewById(R.id.age_text);
        distanceText = view.findViewById(R.id.distance_text);
    }

    private void onNope() {
        showToast("Person noped");
        mainViewModel.nopeMember(getCurrentMember());
    }

    private void onLightFire() {
        showToast("You lit a fire");
        mainViewModel.lightAFire(getCurrentMember());
    }

    private void onLike() {
        showToast("Person liked");
        //TODO add loader
        mainViewModel.likeMember(getCurrentMember());
    }

    private void showToast(String toastMessage) {
        Toast.makeText(getContext(), toastMessage, Toast.LENGTH_SHORT).show();
    }

    @Override
    public void onActivityCreated(@Nullable Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        ViewModelProvider viewModelProvider = new ViewModelProvider(this);
        mainViewModel = viewModelProvider.get(MainViewModel.class);
        observeCurrentMember();
    }

    @Override
    public void onResume() {
        super.onResume();
        mainViewModel.getFilteredProspect();
    }

    private void observeCurrentMember() {
        mainViewModel.getCurrentMember().observe(getViewLifecycleOwner(), new Observer<Member>() {
            @Override
            public void onChanged(Member member) {
                setCurrentMember(member);
                showCurrentMemberDetails();
            }
        });
    }

    private void showCurrentMemberDetails() {
        Member member = getCurrentMember();
        if(mainImageView != null && member.getImageList().size() > 0) {
            String imageUrl = member.getImageList().get(0);
            if(imageUrl != null) {
                Picasso picasso = Picasso.get();
                picasso.load(imageUrl).placeholder(R.drawable.ic_whatshot_white_24dp).into(mainImageView);
            }
        }
        nameText.setText(String.format("%s %s", member.getName(), member.getSurname()));
        ageText.setText(String.valueOf(member.getAge()));
        distanceText.setText(String.format("%s km", Math.random()));
    }

    private Member getCurrentMember() {
        return currentMember;
    }

    private void setCurrentMember(Member currentMember) {
        this.currentMember = currentMember;
    }
}