CREATE TABLE  communities_note(
    note_id SERIAL,
    descrip_note TEXT,
    media_file_id INT UNSIGNED NOT NULL,  
    date_note DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX date_note_idx (date_note),
    FOREIGN KEY (note_id) REFERENCES communities (id),
    FOREIGN KEY (media_file_id) REFERENCES media_types (id)
);
-- Создадим таблицу для хранения игр в социальной сети.
-- Не будем использовать внешние ключи, так как в каталогах они не используются.
-- games_name это название игры, а games_rang это отзыв по игре, так же добавлен INDEX для упрощённого поиска по названию игры.

CREATE TABLE games_all(
    games_id SERIAL PRIMARY KEY,
    games_name VARCHAR(20) NOT NULL UNIQUE,
    games_rang ENUM('3','4','5') NOT NULL,
    INDEX games_all_name (games_name)
);
-- Создадим таблицу для хранения связки, какой пользователь и какие игры себе добавил.
-- Так как пользователь одну и туже игру может добавить только один раз, добавим первичный ключ на связку user_id_gm(пользователь)
-- games_name_gm(название игры), и добавим внешнии ключи на проверку пользователей (чтобы данные брались из уже созданной таблицы 
-- пользователей) user_id_gm на users (id) и на проверку игры, что бы они существовали games_name_gm на games_all.

CREATE TABLE user_games(
    user_id_gm BIGINT UNSIGNED NOT NULL UNIQUE,
    games_name_gm VARCHAR(20) NOT NULL UNIQUE,
    PRIMARY KEY (user_id_gm, games_name_gm),
    CONSTRAINT user_games FOREIGN KEY (user_id_gm) REFERENCES users (id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT namegames_gamesall FOREIGN KEY (games_name_gm) REFERENCES games_all (games_name) 
);
