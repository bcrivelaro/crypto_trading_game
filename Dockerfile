FROM ruby:2.7.2-alpine
LABEL maintainer="bcrivelaro"

RUN apk --update add build-base nodejs yarn postgresql-client postgresql-dev \
  tzdata bash less chromium chromium-chromedriver python3 python3-dev py3-pip \
  && rm -rf /var/cache/apk/

ENV APP_HOME /crypto_trading_game
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# Install gems
COPY Gemfile Gemfile.lock $APP_HOME/

RUN gem install bundler:2.2.9
RUN bundle install -j "$(getconf _NPROCESSORS_ONLN)" --retry 5

COPY . $APP_HOME

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
