FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /app
WORKDIR /app

#COPY Gemfile /app/Gemfile
#COPY Gemfile.lock /app/Gemfile.lock

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs

# yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -\
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
&& apt-get update \
&& apt-get install -y yarn mc
RUN gem update --system
RUN gem install bundler -v 1.17.1
#RUN bundle install

EXPOSE 3000