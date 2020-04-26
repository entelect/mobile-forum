package za.co.entelect.mobile.forum.kindlingapp.data.login;

import java.io.IOException;

import za.co.entelect.mobile.forum.kindlingapp.data.Result;
import za.co.entelect.mobile.forum.kindlingapp.data.member.model.Member;

/**
 * Class that handles authentication w/ login credentials and retrieves user information.
 */
public class LoginDataSource {

    public Result<Member> login(String username, String password) {

        try {
            // TODO: handle loggedInUser authentication
            Member fakeUser = createMaleMember();
            return new Result.Success<>(fakeUser);
        } catch (Exception e) {
            return new Result.Error(new IOException("Error logging in", e));
        }
    }

    private Member createMaleMember() {
        Member member = new Member();
        member.setEntityId(0);
        member.setAge(51);
        member.setFullName("Hugh (Wolverine) Jackman");
        member.getImageList().add("https://i.imgur.com/7HnFi2V.jpg");
        member.getImageList().add("https://i.imgur.com/oTfkM.png");
        return member;
    }

    public void logout() {
        // TODO: revoke authentication
    }
}
