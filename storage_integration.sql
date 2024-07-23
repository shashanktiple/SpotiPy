CREATE OR REPLACE STORAGE INTEGRATION spotify_final_project
    TYPE = EXTERNAL_STAGE
    STORAGE_PROVIDER = S3
    ENABLED = TRUE
    STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::035527339877:role/spotify_sf_final_project'
    STORAGE_ALLOWED_LOCATIONS = ('s3://spotipy-etl-project/transformed_data/')
    COMMENT = 'connecting aws s3 with snowflake for load'




DESC  INTEGRATION spotify_final_project;


//STORAGE_AWS_EXTERNAL_ID  and
//STORAGE_AWS_IAM_USER_ARN in aws role.ß