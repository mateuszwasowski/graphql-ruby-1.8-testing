FROM ruby:2.5.3
ENV LANG C.UTF-8

RUN apt-get update && \
    apt-get install -y nodejs \
                       vim \
                       --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

ENV BUILD_PACKAGES \
    sqlite-dev

ENV RUNTIME_PACKAGES \
    sqlite-libs

#Cache bundle install
WORKDIR /tmp
ADD ./Gemfile Gemfile
ADD ./Gemfile.lock Gemfile.lock
RUN bundle install

ENV APP_ROOT /workspace
RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT
COPY . $APP_ROOT

EXPOSE  3000
CMD ["rails", "server", "-b", "0.0.0.0"]
