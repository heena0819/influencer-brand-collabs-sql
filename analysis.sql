-- Match brands using link_in_bio
SELECT i.name, bl.brand_name, bl.domain, 'link_in_bio' AS match_type
FROM influencers i
JOIN bios b ON i.id = b.influencer_id
JOIN brand_links bl ON b.link_in_bio ILIKE '%' || bl.domain || '%';

-- Match brands using bio_text
SELECT i.name, bl.brand_name, bl.domain, 'bio_text' AS match_type
FROM influencers i
JOIN bios b ON i.id = b.influencer_id
JOIN brand_links bl ON b.bio_text ILIKE '%' || bl.brand_name || '%';

-- Classify influencers by follower and engagement tier
SELECT id, name, followers, engagement_rate,
    CASE 
        WHEN followers < 10000 THEN 'Nano'
        WHEN followers BETWEEN 10000 AND 100000 THEN 'Micro'
        WHEN followers BETWEEN 100001 AND 1000000 THEN 'Macro'
        ELSE 'Mega'
    END AS tier,
	CASE 
      WHEN engagement_rate < 2 THEN 'Low'
      WHEN engagement_rate BETWEEN 2 AND 5 THEN 'Medium'
      ELSE 'High'
    END AS engagement_level
FROM influencers;

-- Top brands by influencer mentions
SELECT bl.brand_name, COUNT(*) AS mention_count
FROM brand_links bl
JOIN bios b ON b.link_in_bio ILIKE '%' || bl.domain || '%'
GROUP BY bl.brand_name
ORDER BY mention_count DESC;

-- Rank influencers by engagement per niche
SELECT name, niche, followers, engagement_rate,
  RANK() OVER (PARTITION BY niche ORDER BY engagement_rate DESC) AS niche_rank
FROM influencers;

-- Average reach per brand
SELECT bl.brand_name,
  AVG(i.followers) AS avg_reach,
  COUNT(*) AS collab_count
FROM influencers i
JOIN bios b ON i.id = b.influencer_id
JOIN brand_links bl ON b.link_in_bio ILIKE '%' || bl.domain || '%'
GROUP BY bl.brand_name
ORDER BY avg_reach DESC;

-- Niche breakdown of brand collaborations
SELECT bl.brand_name, i.niche,
  COUNT(*) AS total_collabs
FROM influencers i
JOIN bios b ON i.id = b.influencer_id
JOIN brand_links bl ON b.link_in_bio ILIKE '%' || bl.domain || '%'
GROUP BY bl.brand_name, i.niche
ORDER BY total_collabs DESC;