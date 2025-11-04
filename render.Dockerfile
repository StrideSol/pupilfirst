FROM ruby:3.2.2-slim
RUN apt-get update && apt-get install -y build-essential libpq-dev nodejs git
WORKDIR /app
COPY . .
RUN gem install bundler:2.5.11
RUN bundle config set --local without 'development test'
RUN bundle install --jobs 4 --retry 3
ENV RAILS_ENV=production
CMD bundle exec rails server -b 0.0.0.0 -p $PORT
