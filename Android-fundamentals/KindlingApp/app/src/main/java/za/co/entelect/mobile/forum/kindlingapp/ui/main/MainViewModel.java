package za.co.entelect.mobile.forum.kindlingapp.ui.main;

import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.ViewModel;

import za.co.entelect.mobile.forum.kindlingapp.data.member.model.Member;


public class MainViewModel extends ViewModel {

    private MutableLiveData<Member> currentMember = new MutableLiveData<>();

    public void getFilteredProspect() {
        //Todo - move to repository
        currentMember.setValue(createGirl1Member());
    }

    private Member createGirl1Member() {
        Member member = new Member();
        member.setEntityId(0);
        member.setAge(25);
        member.setName("Scarlet");
        member.setSurname("Johansen");
        member.getImageList().add("girl1");
        return member;
    }

    private Member createGirl3Member() {
        Member member = new Member();
        member.setEntityId(0);
        member.setAge(25);
        member.setName("Alexandra");
        member.setSurname("Dedario");
        member.getImageList().add("girl3");
        return member;
    }

    public LiveData<Member> getCurrentMember() {
        return currentMember;
    }

    public void likeMember(Member currentMember) {
        this.currentMember.setValue(createGirl3Member());
    }

    public void lightAFire(Member currentMember) {
        this.currentMember.setValue(createGirl3Member());
    }

    public void nopeMember(Member currentMember) {
        this.currentMember.setValue(createGirl3Member());
    }
}
