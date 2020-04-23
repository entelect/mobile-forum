package za.co.entelect.mobile.forum.kindlingapp.data.member;

import java.util.ArrayList;
import java.util.List;

import za.co.entelect.mobile.forum.kindlingapp.data.Result;
import za.co.entelect.mobile.forum.kindlingapp.data.member.model.Member;

public class MemberRepositoryImpl implements MemberRepository {

    int index = 0;
    private List<Member> members;

    public MemberRepositoryImpl() {
        this.index = 0;
        createMemberList();
    }

    private void createMemberList() {
        members = new ArrayList<>();
        members.add(createGirl1Member());
        members.add(createGirl2Member());
    }

    @Override
    public Result<Member> getProspectiveCandidate() {
        Member member = members.get(index++);
        return new Result.Success(member);
    }

    @Override
    public Result<Member> likeMember(Member currentMember) {
        return getProspectiveCandidate();
    }

    @Override
    public Result<Member> lightAFire(Member currentMember) {
        return getProspectiveCandidate();
    }

    @Override
    public Result<Member> nopeMember(Member currentMember) {
        return getProspectiveCandidate();
    }

    private Member createGirl1Member() {
        Member member = new Member();
        member.setEntityId(0);
        member.setAge(25);
        member.setName("Scarlet");
        member.setSurname("Johansen");
        member.getImageList().add("https://i.imgur.com/SkiFvBY.jpg");
        return member;
    }

    private Member createGirl2Member() {
        Member member = new Member();
        member.setEntityId(0);
        member.setAge(25);
        member.setName("Alexandra");
        member.setSurname("Dedario");
        member.getImageList().add("https://i.imgur.com/4JvHQZQ.jpg");
        return member;
    }
}
