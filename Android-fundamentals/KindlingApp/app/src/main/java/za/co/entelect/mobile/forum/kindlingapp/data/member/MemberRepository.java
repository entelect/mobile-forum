package za.co.entelect.mobile.forum.kindlingapp.data.member;

import za.co.entelect.mobile.forum.kindlingapp.data.Result;
import za.co.entelect.mobile.forum.kindlingapp.data.member.model.Member;

public interface MemberRepository {
    Result<Member> getProspectiveCandidate();

    Result<Member> likeMember(Member currentMember);

    Result<Member> lightAFire(Member currentMember);

    Result<Member> nopeMember(Member currentMember);
}
