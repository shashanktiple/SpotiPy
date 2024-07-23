CREATE OR REPLACE FILE FORMAT spotify_file_format;


DESC  file format spotify_file_format;


ALTER FILE FORMAT spotify_file_format
    SET SKIP_HEADER = 1
        FIELD_DELIMITER = '"'
        error_on_column_count_mismatch=false;