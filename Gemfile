source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails-controller-testing'

group :development, :test do
  gem 'pg'
  gem 'shoulda-matchers', '~> 5.0'
end

gemspec
