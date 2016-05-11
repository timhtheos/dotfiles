<?php
/**
 * Promet's dynamic drush aliases.
 *
 * Please see README.md file for more info.
 * /timhtheos
 */

// Get command.
$command = $_SERVER['argv'];

// Set default environment.
$env = 'local';

// Get project and environment.
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

// Array holder for environments.
$envs = array(
  'local' => '.dev',
  'dev'   => '.prometdev.com',
  'stage' => '.prometstaging.com'
);

// Define common alias to be altered later as per environment, if needed.
$aliases[$project . '.' . $env] = array(
  'root' => '/var/www/sites/' . $project . $envs[$env] . '/www',
  'uri' => $project . $envs[$env],
  'remote-host' => $project . $envs[$env],
);

switch ([$env, $param1]) {
  // Authorize user to access local vagrant.
  // (Not yet authorized.)
  case ['local', 'authorize']:
    drush_print('
IMPORTANT: Please read "README.md" file\'s "Dependencies" before
you proceed.

This is just a one time request. After you have authorized
yourself, you can use any drush commands to any Promet\'s
project in your local vagrant, prometdev, and prometstaging
using just your host machine.

In addition, you can take advantage of performing server tasks
inside your vagrant, such as restarting apache2, nxing, mysql,
among others, as well as rebuilding your site with drush build
or install.sh, and even performing compass compile/watch.

"He who never begins, will never end." - Italian Proverb

If you are done with all the dependencies, confirm it below.
');

    $proceed = drush_choice(
      array(
        'yes' => 'Yes',
      ),
      'Do you want to proceed? '
    );

    if ($proceed == 'yes') {
      drush_print('
Please supply the password for your host machine.
');

      // Set drush alias for host machine.
      $aliases[$project . '.' . $env] = array(
        'root' => '/',
        'uri' => '127.0.0.1',
        'remote-host' => '127.0.0.1',

        // Define shell alias `authorize`.
        'shell-aliases' => array(
          'authorize' => '!~/.drush/promet.aliases.sh ' . $project,
        ),
      );
      $aliases[$project] = $aliases[$project . '.' . $env];
    }
    else {
      drush_print('
Aborted', 'Request aborted.');
      exit();
    }
  break;

  // Perform drush commands inside vagrant from host machine.
  // (Already authorized.)
  case ['local', $param1]:
    // Set drush alias for local.
    $aliases[$project . '.' . $env]['remote-user'] = 'vagrant';
    $aliases[$project] = $aliases[$project . '.' . $env];
  break;
}

// Common service ops.
/* $options['shell-aliases'] = array( */
/*   'service' => '!~/.drush/promet.aliases.service.sh ' . $project, */
/* ); */
