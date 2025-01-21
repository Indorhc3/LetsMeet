### Logisches Datenmodell

    User {
        user_id int [pk]
        email varchar
        password varchar
        first_name varchar
        last_name varchar
        address varchar
        phone varchar
        gender varchar
        interested_in varchar
        date_of_birth date
        registration_date datetime
        last_updated datetime
    }

    Friendship {
        friendship_id int [pk]
        user_id_1 int [ref: > User.user_id]
        user_id_2 int [ref: > User.user_id]
        status varchar
        created_at datetime
    }

    Hobby {
        hobby_id int [pk]
        hobby_name varchar
        hobby_category varchar
    }

    Userhobby {
        user_id int [pk, ref: > User.user_id]
        hobby_id int [pk, ref: > Hobby.hobby_id]
        priority int
    }

    HobbyPreference {
        preference_id int [pk]
        user_id int [ref: > User.user_id]
        hobby_id int [ref: > Hobby.hobby_id]
        rating int
    }

    Like {
        like_id int [pk]
        sender_id int [ref: > User.user_id]
        receiver_id int [ref: > User.user_id]
        status varchar
        timestamp datetime
    }

    Message {
        message_id int [pk]
        sender_id int [ref: > User.user_id]
        receiver_id int [ref: > User.user_id]
        content text
        timestamp datetime
        conversation_id int
    }

    Image {
        image_id int [pk]
        user_id int [ref: > User.user_id]
        data blob
        description varchar
        updated_at datetime
        is_profile_image bool
    }

    Profile {
        profile_id int [pk]
        user_id int [ref: > User.user_id]
        profile_image_id int [ref: > Image.image_id]
    }

### Beziehungen zwischen Tabellen

[User] -- (1:N) -- [UserHobby] -- (N:1) -- [Hobby]
[User] -- (1:N) -- [HobbyPreference] -- (N:1) -- [Hobby]
[User] -- (1:N) -- [Message]
[User] -- (1:N) -- [Friendship] -- (N:1) -- [User]
[User] -- (1:N) -- [Like]
[User] -- (1:N) -- [Image]
[User] -- (1:1) -- [Profile] -- (1:1) -- [Image]