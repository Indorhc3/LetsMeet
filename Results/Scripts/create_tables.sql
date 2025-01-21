-- Table: User
CREATE TABLE "User" (
    user_id SERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    address VARCHAR(255),
    phone VARCHAR(15),
    gender VARCHAR(10),
    interested_in VARCHAR(10),
    date_of_birth DATE,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: Image
CREATE TABLE "Image" (
    image_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    data BYTEA NOT NULL,
    description VARCHAR(255),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_profile_image BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES "User" (user_id) ON DELETE CASCADE
);

-- Table: Profile
CREATE TABLE "Profile" (
    profile_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    profile_image_id INT,
    FOREIGN KEY (user_id) REFERENCES "User" (user_id) ON DELETE CASCADE,
    FOREIGN KEY (profile_image_id) REFERENCES "Image" (image_id) ON DELETE SET NULL
);

-- Table: Friendship
CREATE TABLE "Friendship" (
    friendship_id SERIAL PRIMARY KEY,
    user_id_1 INT NOT NULL,
    user_id_2 INT NOT NULL,
    status VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id_1) REFERENCES "User" (user_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id_2) REFERENCES "User" (user_id) ON DELETE CASCADE
);

-- Table: Like
CREATE TABLE "Like" (
    like_id SERIAL PRIMARY KEY,
    sender_id INT NOT NULL,
    receiver_id INT NOT NULL,
    status VARCHAR(50),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES "User" (user_id) ON DELETE CASCADE,
    FOREIGN KEY (receiver_id) REFERENCES "User" (user_id) ON DELETE CASCADE
);

-- Table: Hobby
CREATE TABLE "Hobby" (
    hobby_id SERIAL PRIMARY KEY,
    hobby_name VARCHAR(100) NOT NULL,
    hobby_category VARCHAR(100)
);

-- Table: UserHobby
CREATE TABLE "UserHobby" (
    user_id INT NOT NULL,
    hobby_id INT NOT NULL,
    priority INT,
    PRIMARY KEY (user_id, hobby_id),
    FOREIGN KEY (user_id) REFERENCES "User" (user_id) ON DELETE CASCADE,
    FOREIGN KEY (hobby_id) REFERENCES "Hobby" (hobby_id) ON DELETE CASCADE
);

-- Table: HobbyPreference
CREATE TABLE "HobbyPreference" (
    preference_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    hobby_id INT NOT NULL,
    rating INT,
    FOREIGN KEY (user_id) REFERENCES "User" (user_id) ON DELETE CASCADE,
    FOREIGN KEY (hobby_id) REFERENCES "Hobby" (hobby_id) ON DELETE CASCADE
);

-- Table: Message
CREATE TABLE "Message" (
    message_id SERIAL PRIMARY KEY,
    sender_id INT NOT NULL,
    receiver_id INT NOT NULL,
    content TEXT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    conversation_id INT,
    FOREIGN KEY (sender_id) REFERENCES "User" (user_id) ON DELETE CASCADE,
    FOREIGN KEY (receiver_id) REFERENCES "User" (user_id) ON DELETE CASCADE
);