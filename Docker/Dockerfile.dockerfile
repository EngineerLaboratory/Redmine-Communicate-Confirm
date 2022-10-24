FROM redmine:latest

# CORS
RUN apt-get update -y
RUN apt-get install git -y

# install lib for CORS.
RUN echo "gem 'rack-cors'" >> /usr/src/redmine/Gemfile && bundle install

# 
RUN { \
    echo "Rails.application.config.middleware.insert_before 0, Rack::Cors do"; \
    echo "  allow do"; \
    echo "    origins '*'" ; \
    echo "    resource '*', headers: :any, methods: [:get, :post, :patch, :put, :options]" ; \
    echo "  end" ; \
    echo "end" ; \
    echo; \
} >> /usr/src/redmine/config/initializers/cors.rb
