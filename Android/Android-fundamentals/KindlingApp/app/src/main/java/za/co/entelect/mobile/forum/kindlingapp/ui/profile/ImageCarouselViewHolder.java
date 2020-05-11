package za.co.entelect.mobile.forum.kindlingapp.ui.profile;

import android.view.View;

import androidx.annotation.NonNull;
import androidx.appcompat.widget.AppCompatImageView;
import androidx.recyclerview.widget.RecyclerView;

import com.squareup.picasso.Picasso;

import za.co.entelect.mobile.forum.kindlingapp.R;

public class ImageCarouselViewHolder extends RecyclerView.ViewHolder {

    public ImageCarouselViewHolder(@NonNull View itemView) {
        super(itemView);
    }

    public void bind(String url) {
        AppCompatImageView imageView = itemView.findViewById(R.id.image);
        Picasso.get().load(url).into(imageView);
    }
}
