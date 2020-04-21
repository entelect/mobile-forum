package za.co.entelect.mobile.forum.kindlingapp.data.member.model;

import android.location.Location;

import java.util.ArrayList;
import java.util.List;

public class Member {

    private long entityId;
    private String Name;
    private String Surname;
    private int age;
    private Location location;
    private String shortBio;
    private String longBio;
    private String profilePictureUrl;
    private List<String> imageList;

    public Member() {
    }

    public long getEntityId() {
        return entityId;
    }

    public void setEntityId(long entityId) {
        this.entityId = entityId;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getSurname() {
        return Surname;
    }

    public void setSurname(String surname) {
        Surname = surname;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public Location getLocation() {
        return location;
    }

    public void setLocation(Location location) {
        this.location = location;
    }

    public String getShortBio() {
        return shortBio;
    }

    public void setShortBio(String shortBio) {
        this.shortBio = shortBio;
    }

    public String getLongBio() {
        return longBio;
    }

    public void setLongBio(String longBio) {
        this.longBio = longBio;
    }

    public String getProfilePictureUrl() {
        return profilePictureUrl;
    }

    public void setProfilePictureUrl(String profilePictureUrl) {
        this.profilePictureUrl = profilePictureUrl;
    }

    public List<String> getImageList() {
        if(imageList == null) {
            imageList = new ArrayList<>();
        }
        return imageList;
    }

    public void setImageList(List<String> imageList) {
        this.imageList = imageList;
    }
}
