<?php

/**
 * Promet local vagrant drush aliases.
 */

// Get command.
$command = $_SERVER['argv'];

// Get project.
foreach ($command as $arg) {
  $test = explode('.', $arg);

  if ($test[0] == '@promet') {
    $project = $test[1];

    if (isset($test[2])) {
      $param1 = $test[2];
    }
  }
}

// Get drush first param.
$temp = implode(' ', $command);
$temp = explode('@', $temp);
$temp = explode(' ', $temp[1]);
$param1 = $temp[1];

// Prompt password is asking for authorize.
if ($param1 == 'authorize') {
  drush_print('');
  drush_print('Please supply the password for your host machine.');
  drush_print('');

  $aliases[$project] = array(
    'root' => '/',
    'uri' => '127.0.0.1',
    'remote-host' => '127.0.0.1',
  );
}
else {
  // Generic template to vagrant.
  $aliases[$project] = array(
    'root' => '/var/www/sites/' . $project . '.dev/www',
    'uri' => $project . '.dev',
    'remote-host' => $project . '.dev',
    'remote-user' => 'vagrant',
  );
}

// Authorize.
$options['shell-aliases'] = array(
  'authorize' => '!~/.drush/promet.aliases.sh ' . $project,
);
