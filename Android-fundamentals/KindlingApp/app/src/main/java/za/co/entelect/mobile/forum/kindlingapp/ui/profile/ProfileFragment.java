package za.co.entelect.mobile.forum.kindlingapp.ui.profile;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.lifecycle.ViewModelProviders;
import androidx.viewpager2.widget.ViewPager2;

import com.google.android.material.tabs.TabLayout;
import com.google.android.material.tabs.TabLayoutMediator;

import za.co.entelect.mobile.forum.kindlingapp.R;
import za.co.entelect.mobile.forum.kindlingapp.data.member.model.Member;

public class ProfileFragment extends Fragment {

    private static final String MEMBER_EXTRA = "MEMBER_EXTRA";
    private ProfileViewModel mViewModel;
    private ViewPager2 imageViewPager;
    private TextView nameText;
    private TextView ageText;
    private TabLayout tabLayout;

    public static ProfileFragment newInstance(Member member) {
        ProfileFragment fragment = new ProfileFragment();
        Bundle bundle = new Bundle();
        bundle.putSerializable(MEMBER_EXTRA, member);
        fragment.setArguments(bundle);
        return fragment;
    }

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.profile_fragment, container, false);
        initView(view);
        if (getArguments() != null) {
            Member member = (Member) getArguments().getSerializable(MEMBER_EXTRA);
            if (member != null) {
                setData(member);
            }
        }
        return view;
    }

    private void setData(@NonNull Member member) {
        imageViewPager.setAdapter(new MemberImagesPagerAdapter(member.getImageList()));
        TabLayoutMediator tabLayoutMediator = new TabLayoutMediator(tabLayout, imageViewPager, new TabLayoutMediator.TabConfigurationStrategy() {
            @Override
            public void onConfigureTab(@NonNull TabLayout.Tab tab, int position) {
            }
        });
        tabLayoutMediator.attach();
        nameText.setText(member.getFullName());
        ageText.setText(String.valueOf(member.getAge()));
    }

    private void initView(View view) {
        nameText = view.findViewById(R.id.name_text);
        ageText = view.findViewById(R.id.age_text);
        imageViewPager = view.findViewById(R.id.image_pager);
        tabLayout = view.findViewById(R.id.tab_indicator);
    }

    @Override
    public void onActivityCreated(@Nullable Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        mViewModel = ViewModelProviders.of(this).get(ProfileViewModel.class);
        // TODO: Use the ViewModel
    }

}
