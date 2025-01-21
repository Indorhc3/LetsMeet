### Konzeptuelles Datenmodell
   
    User - Beschreibung: Speichert Informationen über Benutzer.
        user_id (Primärschlüssel): Eindeutige Identifikation eines Benutzers.
        email, password: Anmeldeinformationen des Benutzers.
        first_name, last_name: Persönliche Daten des Benutzers.
        gender, interested_in: Angaben zur Identität und Präferenzen.
        registration_date, last_updated: Zeitstempel zur Nachverfolgung der Kontodaten.

    Friendship - Beschreibung: Verwalten der Freundschaftsbeziehungen zwischen Benutzern.
        friendship_id (Primärschlüssel): Eindeutige Identifikation einer Freundschaft.
        user_id_1, user_id_2: Verknüpfen zwei Benutzer, die Freunde sind.
        status: Status der Freundschaft (z. B. "bestätigt", "ausstehend").
        created_at: Zeitstempel, wann die Freundschaft erstellt wurde.

    Like - Beschreibung: Speichert Likes zwischen Benutzern (z. B. bei Dating-Apps).
        like_id (Primärschlüssel): Eindeutige Identifikation eines Likes.
        sender_id: Benutzer, der den Like sendet.
        receiver_id: Benutzer, der den Like erhält.
        status: Status des Likes (z. B. "akzeptiert", "ignoriert").
        timestamp: Zeitpunkt, zu dem der Like gesendet wurde.

    Message - Beschreibung: Speichert Nachrichten, die zwischen Benutzern gesendet werden.
        message_id (Primärschlüssel): Eindeutige Identifikation einer Nachricht.
        sender_id: Benutzer, der die Nachricht sendet.
        receiver_id: Benutzer, der die Nachricht erhält.
        content: Inhalt der Nachricht.
        timestamp: Zeitpunkt, zu dem die Nachricht gesendet wurde.
        conversation_id: Gruppiert Nachrichten zu einer Konversation.

    Hobby - Beschreibung: Speichert allgemeine Informationen über Hobbys.
        hobby_id (Primärschlüssel): Eindeutige Identifikation eines Hobbys.
        hobby_name: Name des Hobbys.
        hobby_category: Kategorie, zu der das Hobby gehört (z. B. "Sport", "Kunst").

    Userhobby - Beschreibung: Verknüpft Benutzer mit ihren Hobbys.
        user_id: Verknüpft zu einem Benutzer.
        hobby_id: Verknüpft zu einem Hobby.
        priority: Priorität oder Vorlieben für ein Hobby (z. B. Lieblingshobby).

    HobbyPreference - Beschreibung: Speichert die Bewertungen von Hobbys durch Benutzer.
        preference_id (Primärschlüssel): Eindeutige Identifikation einer Bewertung.
        user_id: Benutzer, der das Hobby bewertet.
        hobby_id: Hobby, das bewertet wird.
        rating: Bewertung des Hobbys (z. B. Skala von 1 bis 5).

    Image - Beschreibung: Speichert Bilder, die Benutzer hochladen.
        image_id (Primärschlüssel): Eindeutige Identifikation eines Bildes.
        user_id: Verknüpft zu einem Benutzer.
        data: Bilddaten (z. B. als Blob gespeichert).
        description: Beschreibung des Bildes.
        updated_at: Zeitstempel, wann das Bild zuletzt aktualisiert wurde.
        is_profile_image: Gibt an, ob es sich um ein Profilbild handelt.

    Profile - Beschreibung: Verknüpft Benutzer mit ihrem Profil.
        profile_id (Primärschlüssel): Eindeutige Identifikation eines Profils.
        user_id: Verknüpft zu einem Benutzer.
        profile_image_id: Verknüpft zu einem Bild, das als Profilbild dient.

### Beziehungen zwischen den Tabellen

    User ↔ Friendship:
        Beziehungstyp: 1:N (ein Benutzer kann mehrere Freundschaften haben).
        Beschreibung: user_id_1 und user_id_2 in Friendship verweisen auf user_id in User.

    User ↔ Like:
        Beziehungstyp: 1:N (ein Benutzer kann viele Likes senden und empfangen).
        Beschreibung: sender_id und receiver_id in Like verweisen auf user_id in User.

    User ↔ Message:
        Beziehungstyp: 1:N (ein Benutzer kann viele Nachrichten senden und empfangen).
        Beschreibung: sender_id und receiver_id in Message verweisen auf user_id in User.

    User ↔ Userhobby:
        Beziehungstyp: N:M (ein Benutzer kann mehrere Hobbys haben, und ein Hobby kann mehreren Benutzern gehören).
        Beschreibung: user_id in Userhobby verweist auf user_id in User.

    Hobby ↔ Userhobby:
        Beziehungstyp: N:M (ein Hobby kann zu mehreren Benutzern gehören).
        Beschreibung: hobby_id in Userhobby verweist auf hobby_id in Hobby.

    User ↔ HobbyPreference:
        Beziehungstyp: 1:N (ein Benutzer kann viele Bewertungen abgeben).
        Beschreibung: user_id in HobbyPreference verweist auf user_id in User.

    Hobby ↔ HobbyPreference:
        Beziehungstyp: 1:N (ein Hobby kann von mehreren Benutzern bewertet werden).
        Beschreibung: hobby_id in HobbyPreference verweist auf hobby_id in Hobby.

    User ↔ Image:
        Beziehungstyp: 1:N (ein Benutzer kann mehrere Bilder hochladen).
        Beschreibung: user_id in Image verweist auf user_id in User.

    Profile ↔ User:
        Beziehungstyp: 1:1 (ein Benutzer hat ein Profil).
        Beschreibung: user_id in Profile verweist auf user_id in User.

    Profile ↔ Image:
        Beziehungstyp: 1:1 (ein Profil kann ein Profilbild haben).
        Beschreibung: profile_image_id in Profile verweist auf image_id in Image.

