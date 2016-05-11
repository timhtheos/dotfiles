# Promet's dynamic drush aliases
 
## Parameters
As used in this drushrc file.

```
$env:
```

  - This can be `local`, `dev`, or `stage`.
  - A null or empty value is considered `local` by default.

```
$project:
```

  - Project name, e.g. martincounty.
  - Project name can be obtained from either:
    a. The value of `project` from your project's Vagrantfile, or
    b. Just trip away `.dev` from the url of your working local environment. For example, the local url for Martin County is `martincounty.dev`. The project name would then be `martincounty`.

```
$param1:
```

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
