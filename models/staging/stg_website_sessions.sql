WITH website_sessions AS (
 SELECT *
 FROM {{ source('basket_craft', 'website_sessions') }}
),
stg_website_sessions AS (
 SELECT
   website_session_id,
   user_id,
   is_repeat_session,
   utm_source,
   utm_campaign,
   utm_content,
   device_type,
   http_referer,
   created_at AS website_session_created_at,  
   CURRENT_TIMESTAMP AS loaded_at            
 FROM website_sessions
)
SELECT * FROM stg_website_sessions