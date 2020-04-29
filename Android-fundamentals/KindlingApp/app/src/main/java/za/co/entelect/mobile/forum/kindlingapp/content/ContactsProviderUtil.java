package za.co.entelect.mobile.forum.kindlingapp.content;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.provider.ContactsContract;

public class ContactsProviderUtil {

    public Cursor getContactsCursor(Context context) {
        Uri uri = ContactsContract.Contacts.CONTENT_URI;
        ContentResolver contentResolver = context.getContentResolver();
        Cursor contactsCursor = contentResolver.query(uri, null, null,
                null, ContactsContract.Contacts.DISPLAY_NAME + " ASC ");
        return contactsCursor;
    }

}
