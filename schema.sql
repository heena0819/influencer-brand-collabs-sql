CREATE TABLE influencers(
	id SERIAL PRIMARY KEY,
	name VARCHAR(100),
	platform VARCHAR(50),
	followers INT,
	engagement_rate DECIMAL(4, 2),
	niche VARCHAR(50)
);

CREATE TABLE bios(
	influencer_id INT REFERENCES influencers(id),
	bio_text TEXT,
	link_in_bio VARCHAR(255)
);

CREATE TABLE brand_links(
	brand_id SERIAL PRIMARY KEY,
	brand_name VARCHAR(255),
	domain VARCHAR(100)
);

CREATE TABLE brand_collabs(
	influencer_id INT REFERENCES influencers(id),
	brand_id INT REFERENCES brand_links(brand_id),
	match_type VARCHAR(20)
);