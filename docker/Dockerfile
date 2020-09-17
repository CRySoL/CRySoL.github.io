FROM jekyll/jekyll:3.8

RUN gem install kramdown && \
    gem uninstall kramdown --version 1.17.0 --force && \
    gem uninstall kramdown --version 2.1.0 --force
