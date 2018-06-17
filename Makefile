build:
	rm -rf public
	hugo

deploy: build
	aws s3 sync public/ s3://featuredlisting.forsale --acl public-read --delete
	aws configure set preview.cloudfront true
	aws cloudfront create-invalidation --distribution-id E1MN1U6BY5IH7F --paths '/*'
