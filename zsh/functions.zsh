# ----- #
# shell #
# ----- #

# create a new directory and enter it
function mkd() {
  mkdir -p "$@" && cd "$@"
}

# touch a file and create path
function supertouch() {
  if [ $# -lt 1 ]; then
      echo "Missing argument";
      return 1;
  fi

  for f in "$@"; do
      mkdir -p -- "$(dirname -- "$f")"
      touch -- "$f"
  done
}

# --- #
# git #
# --- #

function gcm() {
  args=$@
  git commit -m "$args"
}
function gca() {
  args=$@
  git commit --amend -m "$args"
}

# git commit / twitter
# function gcmt {
#   git commit -m "$1"
#   ruby -e 'require %(jumpstart_auth);ARGV.join(" ").scan(/.{1,140}/).each { |tweet| JumpstartAuth.twitter.update(tweet)}' $1
# }

# ----- #
# rails #
# ----- #

function rails_pg() {
  rails new $1 -T -B --database=postgresql

  cd $1

  add_rails_gems
  bundle
  rails generate rspec:install

  git init
  git add .
  git commit -m "initial commit"

  subl .;
}

function add_rails_gems() {

echo "

group :test, :development do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'pry-rails'
  gem 'awesome_print'
end

" >> Gemfile;

}
