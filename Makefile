install:
	bundle install

test:
	rake test

start-rake:
	bundle exec rake

lint:
	bundle exec rubocop .

.PHONY: test