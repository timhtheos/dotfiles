#!/bin/bash

cd ~

# Get project.
project=$1

# Check brew.
# which -s brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Check expect.
# which -s expect || brew install expect

# Check public key.
if [[ ! -f ~/.ssh/id_rsa.pub ]]; then
  echo
  echo 'No public key found.  Please generate your key-pair.'
  echo 'Go to: https://help.github.com/enterprise/11.10.340/user/articles/generating-ssh-keys/'
  echo
  exit 0
fi

# Get public key.
pkey=$(cat ~/.ssh/id_rsa.pub);

# Temporarily copy authorized_keys from vagrant to host.
expect -c "
  spawn -noecho scp -q vagrant@$project.dev:~/.ssh/authorized_keys /tmp/
  expect {
    -re \"password:\" {send \"vagrant\r\"; expect eof}
  }
"

# Check if already authorized.
authorize=false
if grep -q "$pkey" "/tmp/authorized_keys"; then
  authorize=true
fi

# Remove authorized_keys from host.
rm /tmp/authorized_keys

# Authorize.
if [[ $authorize == false ]]; then
  expect -c "
    spawn -noecho ssh vagrant@$project.dev -t \"echo $pkey >> /home/vagrant/.ssh/authorized_keys\"
    expect {
      -re \"password:\" {send \"vagrant\r\"; expect eof}
    }
    if [catch wait] {
      puts \" \"
      puts \"SSH failed.  Your host public key has not been installed.\"
      exit 1
    } else {
      puts \" \"
      puts \"Your host public key has been installed.\"
      exit 0
    }
  ";
else
  echo
  echo "Your host public key is already authorized in $project."
  exit 0
fi
