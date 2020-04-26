package za.co.entelect.mobile.forum.kindlingapp.ui.login;

import androidx.annotation.Nullable;

import za.co.entelect.mobile.forum.kindlingapp.data.member.model.Member;

/**
 * Authentication result : success (user details) or error message.
 */
class LoginResult {
    @Nullable
    private Member success;
    @Nullable
    private Integer error;

    LoginResult(@Nullable Integer error) {
        this.error = error;
    }

    LoginResult(@Nullable Member success) {
        this.success = success;
    }

    @Nullable
    Member getSuccess() {
        return success;
    }

    @Nullable
    Integer getError() {
        return error;
    }
}
