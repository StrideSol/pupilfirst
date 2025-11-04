FROM ruby:3.2
WORKDIR /app
COPY . .
RUN gem update --system && bundle install --jobs 4
EXPOSE $PORT
ENV RAILS_ENV=production
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "$PORT"]
