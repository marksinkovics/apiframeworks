# API validation

Validating the final version of REST API implementations is essential for this project, because the its goal is to compare source code in different frameworks and languages.
Under scripts folder, a validate.sh script is found which make possible to run same validation steps on frameworks.

The validation script is found under `scripts` folder with name `validate.sh`. This command is only run servers and not update or compile anything. Some parameters should be given in order to define the scope of the validation (e.g. `./scripts/validate.sh --vapor` means run only test cases for Vapor framework) The possible program arguments can be found under the help menu (`./scripts/validate.sh --help`).

In order to make server up-to-date and testable, the compilation process should be taken before validation. This command in only update and compile REST servers. The build script is found under `scripts` folder with name `build.sh`. Some parameters should be given in order to define the scope of the building (e.g. `./scripts/build.sh --vapor` means run only test cases for Vapor framework) The possible program arguments can be found under the help menu (`./scripts/build.sh --help`).

Furthermore, each framework contains two scripts in their folder with name `validate.sh` and `build.sh`. These scripts are responsible for build and validate the current framework and it will be called during global building and testing.


### Update and build

The `build.sh` script updates dependencies such as npm or swift packages and in the case of swift compiles a release configured binary.

### Validate

The `validate.sh` script starts servers each by each and tests REST interfaces with [httpie](https://httpie.org) command. Tests are based on [API document](api.md).
