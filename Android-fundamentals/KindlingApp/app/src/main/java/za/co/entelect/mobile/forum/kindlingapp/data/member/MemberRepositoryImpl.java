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
        if(index < members.size()) {
            Member member = members.get(index++);
            return new Result.Success(member);
        }
        return new Result.Error(new Exception());
    }

    @Override
    public Result likeMember(Member currentMember) {
        return new Result.Success(null);
    }

    @Override
    public Result lightAFire(Member currentMember) {
        return new Result.Success(null);
    }

    @Override
    public Result nopeMember(Member currentMember) {
        return new Result.Success(null);
    }

    private Member createGirl1Member() {
        Member member = new Member();
        member.setEntityId(0);
        member.setAge(35);
        member.setFullName("Scarlett Johansson");
        member.getImageList().add("https://i.imgur.com/SkiFvBY.jpg");
        member.getImageList().add("https://i.imgur.com/SxNeQA6.png");
        member.getImageList().add("https://i.imgur.com/6egqplg.jpg");
        member.getImageList().add("https://i.imgur.com/AiD80uV.jpg");
        member.getImageList().add("https://i.imgur.com/1vhTLzP.jpg");
        member.getImageList().add("https://i.imgur.com/6ID3noQ.jpg");

        return member;
    }

    private Member createGirl2Member() {
        Member member = new Member();
        member.setEntityId(1);
        member.setAge(24);
        member.setFullName("Alexandra Daddario");
        member.getImageList().add("https://i.imgur.com/4JvHQZQ.jpg");
        member.getImageList().add("https://i.imgur.com/7lGuU74.jpg");
        member.getImageList().add("https://i.imgur.com/JO3FQlX.jpg");
        member.getImageList().add("https://i.imgur.com/HkiGpde.jpg");
        member.getImageList().add("https://i.imgur.com/KdVmzc0.jpg");
        member.getImageList().add("https://i.imgur.com/GXe5YWy.jpg");
        return member;
    }
}
