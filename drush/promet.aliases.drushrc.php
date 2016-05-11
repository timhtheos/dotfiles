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
      $env = $test[2];
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
  drush_print('Make sure you turned on \'Remote Login\' in your System Preferences\' Sharing');
  drush_print('To turn it on, go to  \'System Preferences > Sharing\'  and mark checked the');
  drush_print('\'Remote Login\'.');
  drush_print('');
  drush_print('This is just a one time request, and \'Remote Login\' can be turned back off.');
  drush_print('');
  drush_print('If you are done, confirm it below.');
  drush_print('');

  $proceed = drush_choice(
    array(
      'yes' => 'Yes',
    ),
    'Do you want to proceed? '
  );

  if ($proceed == 'yes') {
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
    drush_print('');
    drush_set_error('Aborted', 'Request aborted.');
    exit();
  }
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

// Common service ops.
/* $options['shell-aliases'] = array( */
/*   'service' => '!~/.drush/promet.aliases.service.sh ' . $project, */
/* ); */
