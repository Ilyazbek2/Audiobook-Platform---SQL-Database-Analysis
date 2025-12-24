-- User Engagement Analysis
SELECT 
    COUNT(DISTINCT ac.user_id) as total_users,
    COUNT(DISTINCT CASE WHEN ac.progress > ab.duration * 0.1 THEN ac.user_id END) as engaged_users
FROM audio_cards ac
JOIN audiobooks ab ON ac.audiobook_uuid = ab.uuid
WHERE ab.title = 'Coraline';

-- Platform Statistics
SELECT 
    l.os_name, ab.title, 
    COUNT(DISTINCT l.user_id) AS users,
    ROUND(SUM(l.position_to - l.position_from) / 3600, 2) AS hours
FROM listenings l
JOIN audiobooks ab ON l.audiobook_uuid = ab.uuid
WHERE l.is_test = 0
GROUP BY l.os_name, ab.title;

-- Most Popular Book
SELECT ab.title, COUNT(DISTINCT l.user_id) as listeners
FROM listenings l
JOIN audiobooks ab ON l.audiobook_uuid = ab.uuid
WHERE l.is_test = 0
GROUP BY ab.title
ORDER BY listeners DESC LIMIT 1;

-- Completion Rate
SELECT ab.title, COUNT(DISTINCT ac.user_id) as completed
FROM audio_cards ac
JOIN audiobooks ab ON ac.audiobook_uuid = ab.uuid
WHERE ac.state = 'finished'
GROUP BY ab.title
ORDER BY completed DESC LIMIT 1;
```

