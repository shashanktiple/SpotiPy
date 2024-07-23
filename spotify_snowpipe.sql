CREATE OR REPLACE DATABASE spotify_DB;
CREATE OR REPLACE SCHEMA spotify_schema;




CREATE OR REPLACE STAGE ext_spotify_stage
    url = 's3://spotipy-etl-project/transformed_data/'
    STORAGE_INTEGRATION = spotify_final_project
    FILE_FORMAT = spotify_file_format





CREATE OR REPLACE TABLE tblAlbum (
album_id VARCHAR,
name VARCHAR,
release_date DATE,
total_tracks NUMBER,
url VARCHAR
);

CREATE OR REPLACE TABLE tblArtist(
artist_id VARCHAR,
artist_name	VARCHAR,
external_url VARCHAR
);

CREATE OR REPLACE TABLE tblSongs (
    song_id VARCHAR,
    song_name VARCHAR,
    duration_ms VARCHAR,
    url VARCHAR,
    popularity VARCHAR,
    song_added VARCHAR,
    album_id VARCHAR,
    artist_id VARCHAR
);


LIST @ext_spotify_stage



-- COPY INTO tblAlbum
-- FROM @ext_spotify_stage
-- PATTERN = 'transformed_data/album_data/.*\.csv'
-- FILE_FORMAT = spotify_file_format

-- COPY INTO tblArtist
-- FROM @ext_spotify_stage
-- PATTERN = 'transformed_data/artist_data/.*\.csv'
-- FILE_FORMAT = spotify_file_format;

-- COPY INTO tblSongs
-- FROM @ext_spotify_stage
-- PATTERN = 'transformed_data/songs_data/.*\.csv'
-- FILE_FORMAT = spotify_file_format;

select * from tblAlbum 
    limit 10;
//----------------



CREATE OR REPLACE PIPE spotify_Album_pipe
    auto_ingest = TRUE
    AS 
    COPY INTO tblAlbum
    FROM @ext_spotify_stage
    PATTERN = 'transformed_data/album_data/.*\.csv'
    FILE_FORMAT = spotify_file_format;

CREATE OR REPLACE PIPE spotify_Artist_pipe
    auto_ingest = TRUE
    AS 
    COPY INTO tblArtist
    FROM @ext_spotify_stage
    PATTERN = 'transformed_data/album_data/.*\.csv'
    FILE_FORMAT = spotify_file_format;

CREATE OR REPLACE PIPE spotify_Song_pipe
    auto_ingest = TRUE
    AS 
    COPY INTO tblSongs
    FROM @ext_spotify_stage
    PATTERN = 'transformed_data/album_data/.*\.csv'
    FILE_FORMAT = spotify_file_format;

DESC pipe spotify_Song_pipe;
//use notification_channel to integrate with S3 trigger automation



