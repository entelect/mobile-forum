package za.co.entelect.mobile.forum.kindlingapp.ui.main;

import android.location.Location;

import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.ViewModel;

import za.co.entelect.mobile.forum.kindlingapp.data.Result;
import za.co.entelect.mobile.forum.kindlingapp.data.member.MemberRepository;
import za.co.entelect.mobile.forum.kindlingapp.data.member.MemberRepositoryImpl;
import za.co.entelect.mobile.forum.kindlingapp.data.member.model.Member;


public class MainViewModel extends ViewModel {

    private MutableLiveData<Member> currentMember = new MutableLiveData<>();
    private MemberRepository memberRepository = new MemberRepositoryImpl();

    public void getFilteredProspect() {
        Result<Member> memberResult = memberRepository.getProspectiveCandidate();
        currentMember.setValue(((Result.Success<Member>) memberResult).getData());
    }

    public LiveData<Member> getCurrentMember() {
        return currentMember;
    }

    public void likeMember(Member currentMember) {
        Result<Member> memberResult = memberRepository.likeMember(currentMember);
        this.currentMember.setValue(((Result.Success<Member>) memberResult).getData());
    }

    public void lightAFire(Member currentMember) {
        Result<Member> memberResult = memberRepository.lightAFire(currentMember);
        this.currentMember.setValue(((Result.Success<Member>) memberResult).getData());
    }

    public void nopeMember(Member currentMember) {
        Result<Member> memberResult = memberRepository.nopeMember(currentMember);
        this.currentMember.setValue(((Result.Success<Member>) memberResult).getData());
    }
}
