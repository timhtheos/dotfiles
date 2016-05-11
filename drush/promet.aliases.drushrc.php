<?php
/**
 * Promet's dynamic drush aliases.
 *
 * **********
 * PARAMETERS
 * **********
 * As used in this drushrc file.
 *
 * $env:
 *  - This can be `local`, `dev`, or `stage`.
 *  - A null or empty value is considered `local` by default.
 *
 * $project:
 *  - Project name, e.g. martincounty.
 *  - Project name can be obtained from either:
 *      a) The value of `project` from your project's Vagrantfile, or
 *      b) Just trip away `.dev` from the url of your working local environment
 *           For example, the local url for Martin County is `martincounty.dev`
 *           The project name would then be `martincounty`.
 *
 * $param1:
 *  - Promet's defined shell aliases to do commonly recognized shell commands
 *      inside the server.  For example, `authorize`.
 *
 * ******
 * FORMAT
 * ******
 * Legend:
 *  - The use of { and } means, it is a variable.
 *  - The use of [ and ] means, it is optional.
 *
 * Format:
 * drush @promet.{project}[.{env}] {drush-command(s)}
 *
 * {drush-command(s)} can be any drush command(s) or any custom drush shell
 *    aliases defined by Promet.
 *
 * *******
 * EXAMPLE
 * *******
 * Based on the given format above, here's the example for Martin County.
 *
 * drush @promet.martincounty st          - Execute drush in local vagrant.
 *
 * drush @promet.martincounty.local st    - `.local` can be ommitted to execute
 *                                            drush in local vagrant.
 *
 * drush @promet.martincounty.dev st      - Execute drush in Promet Dev server.
 *
 * drush @promet.martincounty.stage st    - Execute drush in Promet Stage server.
 */

// Get command.
$command = $_SERVER['argv'];

// Set environment.
$env = 'local';

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

switch ([$env, $param1]) {
  // Prompt password is asking for authorize.
  case ['local', 'authorize']:
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

    // Shell authorize.
    $options['shell-aliases'] = array(
      'authorize' => '!~/.drush/promet.aliases.sh ' . $project,
    );
  break;

  // If already authorized.
  case ['local', $param1]:
    // Generic template to vagrant.
    $aliases[$project] = array(
      'root' => '/var/www/sites/' . $project . '.dev/www',
      'uri' => $project . '.dev',
      'remote-host' => $project . '.dev',
      'remote-user' => 'vagrant',
    );
  break;
}

// Common service ops.
/* $options['shell-aliases'] = array( */
/*   'service' => '!~/.drush/promet.aliases.service.sh ' . $project, */
/* ); */
