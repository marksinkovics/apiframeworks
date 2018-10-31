# API validation

Validating the final version of REST API implementations is essential for this project, because the its goal is to compare source code in different frameworks and languages.
Under scripts folder, a validate.rb script is found which make possible to run same validation steps on frameworks.

The validation script is found under `scripts` folder with name `validate.rb`. This command only runs servers and doesn't update or compile anything. By default, it runs all test cases for all frameworks but with certain arguments a scope can be defined such as using `--vapor` means run tests only for Vapor framework. More information about the available arguments can be found under the help menu (`./scripts/validate.rb --help`).

In order to make server up-to-date and testable, the compilation process should be taken before validation. This command in only update and compile REST servers. The build script is found under `scripts` folder with name `build.rb`. By default, it updates and compiles all frameworks but with certain arguments a scope can be defined such as using `--vapor` means update and compile application only for Vapor framework. More information about the available arguments can be found under the help menu (`./scripts/build.rb --help`).

Furthermore, each framework contains two scripts in their folder with name `validator.rb` and `builder.rb`. These scripts are responsible for building and validating the current framework and they will be called during global building and testing phases.

### Update and build

The `builder.rb` script updates dependencies such as npm or swift packages and in the case of swift compiles a release configured binary.
In order to create a new build step for a new framework the `scripts/utils/builder.rb` should be used to make a subclass where `update` and `build` are responsible updating dependencies and building the program.

### Validate

The `validator.rb` script starts servers each by each and tests REST interfaces with [httpie](https://httpie.org) command. Tests are based on [API document](api.md).
In order to create a new validation step for a new framework, the `scripts/utils/validator.rb` should be used to make a subclass where the `start` need to be overwritten. In this function, some parameters namely `@server_cmd` and `@working_dir` must be initialized before calling `super`.
