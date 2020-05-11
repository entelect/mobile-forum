package za.co.entelect.mobile.forum.kindlingapp.data.member;

import za.co.entelect.mobile.forum.kindlingapp.data.Result;
import za.co.entelect.mobile.forum.kindlingapp.data.member.model.Member;

public interface MemberRepository {
    Result<Member> getProspectiveCandidate();

    Result likeMember(Member currentMember);

    Result lightAFire(Member currentMember);

    Result nopeMember(Member currentMember);
}
