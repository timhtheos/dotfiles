# Promet's dynamic drush aliases
 
## Parameters
As used in drushrc file `promet.aliases.drushrc.php`.

1. $env
  - This can be `local`, `dev`, or `stage`.
  - A null or empty value is considered `local` by default.

2. $project
  - Project name, e.g. martincounty.
  - Project name can be obtained from either:
    a. The value of `project` from your project's Vagrantfile, or
    b. Just trip away `.dev` from the url of your working local environment. For example, the local url for Martin County is `martincounty.dev`. The project name would then be `martincounty`.

3. $param1
  - Promet's defined shell aliases to do commonly recognized shell commands inside the server.  For example, `authorize`.

## Format

#### Legend
- The use of `{` and `}` means, it is a variable.
- The use of `[` and `]` means, it is optional.

#### Format
```
drush @promet.{project}[.{env}] {drush-command(s)}
```

`{drush-command(s)}` can be any drush command(s) or any custom drush shell aliases defined by Promet.

## Example(s)
Based on the given format above, here's the example for Martin County.

1. Execute drush in local vagrant:

  ```
  drush @promet.martincounty st
  ```
  or
  ```
  drush @promet.martincounty.local st
  ```
  `.local` can be omitted to execute drush in local vagrant.

2. Execute drush in Promet Dev server:

  ```
  drush @promet.martincounty.dev st
  ```

3. Execute drush in Promet Stage server:

  ```
  drush @promet.martincounty.stage st
  ```

## Dependencies
Unfortunately, this requires the following:

1. `expect` command.

  Install using brew:

  ```
  brew install expect
  ```

  If installation failed, and it instructs you to tap something, please tap it, and re-install again.

2. `Remote Login` turned-on.

  Go to `System Preferences` > `Sharing` and mark checked the `Remote Login` found in the left side column.

  This is important to authorize Promet's drush aliases to access your vagrant.  Noteworthy, that you may turn `Remote Login` off when you are done with `authorize`.

## Getting started
1. Make sure you have `expect` command and `Remote Login` turned-on (see Dependencies).
2. Make sure that you have installed drush on your host machine.
3. Make sure that you have ssh keypair on your host machine.
4. Download all the files in this directory and put it inside your `~/.drush` directory on you host machine.
5. Execute `drush cc drush` to clear drush.
6. Test Promet's drush aliases by:
  1. `vagrant up` any of Promet's project using `promet_wheezy*` box.
  2. For example, the project is Martin County, so the project name would be, `martincounty`. Run, `drush @promet.martincounty st`.  You should get:

    ```
    Permission denied (publickey,password).
    ```

    That's just normal.  Please proceed to the next section to get authorized.

## Getting authorized
Getting authorized is a one time action per project/vagrant.  This doesn't need to be done every time.  But, doing this the 2nd time, after being authorized already, is just fine.

Furthermore, this is only applicable to local environment where we use vagrant, and not to dev and stage environments.

#### Format
```
drush @promet.{project} authorize
```

#### Example
Still using Martin County's:

```
drush @promet.martincounty authorize
```

At first, you will be prompted and asked to turn on `Remote Login` in your `System Preferences > Sharing`.  When you are done, confirm the prompt by typing `1` and press the return key (enter).

Then, you will be asked of your host machine's password.  This is the password when you logged-in to your machine.  This is the same password you enter when you do `sudo` on your terminal.

Make sure that you get the following message:

```
Your host public key has been installed.
```

Doing this the 2nd time or multiple times, will give you the following message:

```
Your host public key is already authorized in Martin County.
```

In case you received the following message, please ask help from others.
```
SSH failed.  Your host public key has not been installed.
```

#### Test other drush commands
After you have authorized yourself, test the following drush commands.

```
drush @promet.martincounty st
drush @promet.martincounty cc all
drush @promet.martincounty sql-connect
```

When there are no errors returned, your setup is good.

## Promet's custom shell aliases
We have already used one, i.e., `authorized`.
