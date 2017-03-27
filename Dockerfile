FROM ruby:2.4.1

RUN apt-get update
RUN apt-get install -y build-essential curl libpq-dev nodejs postgresql-client

ENV APP_HOME /farmacia

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

ENV RAILS_ENV production
ENV RACK_ENV production

ENV BUNDLE_GEMFILE $APP_HOME/Gemfile
ENV BUNDLE_JOBS 5
ENV BUNDLE_PATH /bundle

ADD Gemfile $APP_HOME/
ADD Gemfile.lock $APP_HOME/

RUN gem install bundler
RUN bundle install --jobs 5 --retry 5 --with=production --without=development test

ADD . $APP_HOME

RUN bundle exec rails tmp:clear
RUN bundle exec rails assets:clean

RUN bundle exec rails assets:precompile

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*