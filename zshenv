export PATH=/Users/jaimeledesma/.local/bin:$PATH


# Path for Mosh-Server
PATH=/opt/homebrew/bin/:PATH


function exists() {
  # `command` -v is similar to `which`
  #
  command -v $1 > /dev/null 2>&1
}

export PATH=/Users/jaimeledesma/.local/bin:$PATH

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
