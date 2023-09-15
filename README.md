# Task_Flutter_Test

## System requirements

Dart SDK Version 2.18.0 or greater.
Flutter SDK Version 3.3.0 or greater.

### Application structure
After successful build, your application structure should look like this:

```
.
├── android                         - It contains files required to run the application on an Android platform.
├── assets                          - It contains all images and fonts of your application.
├── ios                             - It contains files required to run the application on an iOS platform.
├── lib                             - Most important folder in the application, used to write most of the Dart code..
    ├── main.dart                   - Starting point of the application
    ├── core
    │   ├── app_export.dart         - It contains commonly used file imports
    │   ├── constants               - It contains static constant class file
    │   └── utils                   - It contains common files and utilities of the application
    ├── module                      - It contains widgets of the screens
    └── widgets                     - It contains all custom widget classes
```

## Project Setup

### Clone Repository

To clone this repo:

1) Open a new terminal/powershell window.
2) Move to the directory where you want to be. For example:
   ```bash
   cd C:\Users\yourname\MyFlutterProjects
   ```
3) Clone the repo:
   ```
   git clone link
   ```
4) Open VS Code, then from the top menu `File > Open` Folder and navigate to task_folder.

### Setup Instructions

Please, refer to these documents for each module setup.

`flutter pub get`
`flutter run`

## Maintain The Codebase

- Before creating a new branch, make sure you are on dev, and run:
```bash
git pull
```
- If you're already on a branch and some new changes have been pushed to dev, run:
```bash
git pull origin dev
```

### Walk Through The Main Branches

Refer to the following main branches to get familiar with the code base.

* *master* contains production code. **Please, do not pull or push any code to this branch**
* *dev* where the action is happening. This branch contains code under development where we build, improve, test, and debug the project apps.

## Contribute to This Project

### Repo Issues

If you find a bug throughout your development or testing process, please do not hesitate to file an issue describing the bug you noticed.

### How to File an Issue?

Here is how you create an issue:

* Go to the issues tab.
* Click on "New issue".
* Add an informative title following the naming convention below.
* Add a detailed description with the suggested solution if possible.
* Select applicable labels after reading each label's description.
* Try to label the issue priority to the best of your knowledge -this might change based on the current project milestone-.

### Creating a New Branch

Once you're assigned to an issue or want to start working on a new feature, create a new branch with a descriptive title preceded with your name as `@yourname/new-feature-title`.

_Note: branch names ar all small case seprated by a dash `-`, e.g. `@shreyjotangiya/new-bug`_

### Conventions

#### Commits

The commit message should be structured as follows:

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

The commit contains the following structural elements, to communicate intent to the consumers of your library:

* **fix:** a commit of the type `fix` patches a bug in the codebase.

* **feat:** a commit of the type `feat` introduces a new feature to the codebase.

* **BREAKING CHANGE:** a commit that has a footer `BREAKING CHANGE:`, or appends a `!` after the type/scope, introduces a breaking change.

* types other than fix: and feat: are allowed, for example `build:`, `chore:`, `ci:`, `docs:`, `style:`, `refactor:`, `perf:`, `test:`, and others.


#### Dart File Naming
* Small letters only.
* Use underscore as delimiters.
* Keep it short, clear and simple.
