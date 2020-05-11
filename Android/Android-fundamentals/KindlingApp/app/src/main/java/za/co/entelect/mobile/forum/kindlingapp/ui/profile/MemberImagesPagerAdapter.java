package za.co.entelect.mobile.forum.kindlingapp.ui.profile;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.appcompat.widget.AppCompatImageView;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.recyclerview.widget.AsyncDifferConfig;
import androidx.recyclerview.widget.DiffUtil;
import androidx.recyclerview.widget.ListAdapter;
import androidx.recyclerview.widget.RecyclerView;
import androidx.viewpager.widget.PagerAdapter;

import com.squareup.picasso.Picasso;

import java.util.List;

import za.co.entelect.mobile.forum.kindlingapp.R;

public class MemberImagesPagerAdapter extends RecyclerView.Adapter<ImageCarouselViewHolder> {

    public List<String> imageUrls;

    public MemberImagesPagerAdapter(List<String> imageUrls) {
        this.imageUrls = imageUrls;
    }

    @NonNull
    @Override
    public ImageCarouselViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        LayoutInflater inflater = (LayoutInflater) parent.getContext().getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        View imageViewContainer = inflater.inflate(R.layout.profile_image_carousel_item, parent, false);
        return new ImageCarouselViewHolder(imageViewContainer);
    }

    @Override
    public void onBindViewHolder(@NonNull ImageCarouselViewHolder holder, int position) {
        holder.bind(imageUrls.get(position));
    }

    @Override
    public int getItemCount() {
        return imageUrls.size();
    }
}
