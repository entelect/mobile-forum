package za.co.entelect.mobile.forum.kindlingapp.ui.profile;

import androidx.lifecycle.ViewModelProviders;

import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.viewpager2.widget.ViewPager2;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.google.android.material.tabs.TabLayout;
import com.google.android.material.tabs.TabLayoutMediator;

import java.util.ArrayList;
import java.util.List;

import za.co.entelect.mobile.forum.kindlingapp.R;

public class ProfileFragment extends Fragment {

    private ProfileViewModel mViewModel;
    private ViewPager2 imageViewPager;

    public static ProfileFragment newInstance() {
        return new ProfileFragment();
    }

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.profile_fragment, container, false);
        initView(view);
        return view;
    }

    private void initView(View view) {
        imageViewPager = view.findViewById(R.id.image_pager);
        TabLayout tabLayout = view.findViewById(R.id.tab_indicator);
        List<String> urls = new ArrayList<>();
        urls.add("https://i.imgur.com/SkiFvBY.jpg");
        urls.add("https://i.imgur.com/4JvHQZQ.jpg");

        imageViewPager.setAdapter(new MemberImagesPagerAdapter(urls));
        TabLayoutMediator tabLayoutMediator = new TabLayoutMediator(tabLayout, imageViewPager, new TabLayoutMediator.TabConfigurationStrategy() {
            @Override
            public void onConfigureTab(@NonNull TabLayout.Tab tab, int position) {

            }
        });
        tabLayoutMediator.attach();
    }

    @Override
    public void onActivityCreated(@Nullable Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        mViewModel = ViewModelProviders.of(this).get(ProfileViewModel.class);
        // TODO: Use the ViewModel
    }

}
