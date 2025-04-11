-- Influencers
INSERT INTO influencers(name, platform, followers, engagement_rate, niche) VALUES
('@fitbylara', 'Instagram', 220000, 4.5, 'Fitness'),
('@techguru91', 'Youtube', 1500000, 2.1, 'Tech'),
('@stylewithemma', 'TikTok', 82000, 6.2, 'Fashion'),
('@mindfulluke', 'Instagram', 58000, 5.8, 'Wellness'),
('@gamemasterJ', 'Twitch', 430000, 3.7, 'Gaming');

-- Bios
INSERT INTO	bios(influencer_id, bio_text, link_in_bio) VALUES
(1, '🏋️ Certified PT | Use code LARA10 for GymShark 💪', 'gymshark.com/lara'),
(2, 'Reviews & tech breakdowns. Sponsored by Logitech 🎧', 'bit.ly/techguru-deals'),
(3, 'Fashion fits 🔥 Use my link for SHEIN discount', 'linktr.ee/stylewithemma'),
(4, 'Meditation, breathwork & better living 💆‍♂️', 'mindfulbrand.org/luke'),
(5, 'Gaming setups. Code GMJ15 on Razer gear!', 'razer.com/gamemasterj');

-- Brand Links
INSERT INTO brand_links (brand_name, domain) VALUES
('GymShark', 'gymshark.com'),
('Logitech', 'logitech.com'),
('SHEIN', 'shein.com'),
('MindfulBrand', 'mindfulbrand.org'),
('Razer', 'razer.com');