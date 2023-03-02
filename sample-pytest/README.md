# sample-pytest
___
Your guide to run the first Python + PyTest test with reporting to Zebrunner.
___
## Prerequisites
Before you start performing PyTest automation testing with Selenium, you would need to be installed:
- Python 3.7 or higher - you can download [here](https://www.python.org/downloads/)
___
## Configuration
### _Step 1: Basic project setup_
Do the following steps:
- Clone the Zebrunner's [samples](https://github.com/zebrunner/python-agent-samples) repository, 
- Navigate to the code directory,
- Create [virtual environment](https://docs.python.org/3/library/venv.html#),
- Activate virtual environment,
- Install all dependencies to virtual environment

as shown below:

```
git clone https://github.com/zebrunner/python-agent-samples.git &&
cd python-agent-samples/sample-pytest &&
python3 -m venv venv &&
source venv/bin/activate &&
pip install -r requirements.txt
```
> Please note that on different systems this set of commands may vary


### _Step 2: Setup your authentication_
In Zebrunner:
- Navigate to "Account and profile" section by clicking on the User icon from the top right side;
- Click on "API Tokens" tab;
- Press "Token" button, create a token and copy it before closing the dialog (you won't be able to see the token later).

### _Step 3: Select project for your launches_
In Zebrunner:
- Click on "Projects" dropdown from the top left side;
- Select "View all Projects";
- Find out a project where you would like to see your launches and copy its `KEY`.

> You need to be an Admin of the workspace to have the ability to create projects

### _Step 4: Configure your .env file_
The `.env` file holds all the required configuration to enable reporting of your tests on Zebrunner.

- Open the file located inside root directory of cloned repository;
- Update the `sample-pytest/.env` config file with:
  - `REPORTING_SERVER_HOSTNAME` with your Zebrunner workspace;
  - `REPORTING_SERVER_ACCESS_TOKEN` with `token` from step #2;
  - `REPORTING_PROJECT_KEY` with `KEY` from step #3 (if not defined, `DEF` will be used by default);
  - `REPORTING_RUN_DISPLAY_NAME` with launch name you wish to see in Zebrunner.
  - `ZEBRUNNER_SELENIUM_GRID`
      
    In Zebrunner:
    - Navigate to "Automation -> Launches" page by selecting the menu from left sidebar;
    - Click on `key` icon from the top right side on Launches page;
    - You will see 'Hub Access' popup where you can copy URL of remote Selenium Grid;

#### **`.env`**
```
REPORTING_SERVER_HOSTNAME=_server_hostname_
# demo token below is auto-generated and will expire in 60 minutes
REPORTING_SERVER_ACCESS_TOKEN=_token_
REPORTING_ENABLED=true
REPORTING_PROJECT_KEY=_key_
REPORTING_RUN_DISPLAY_NAME=_run_name_
REPORTING_RUN_BUILD=1.0
REPORTING_RUN_ENVIRONMENT=LOCAL
ZEBRUNNER_SELENIUM_GRID=_zebrunner_selenium_grid_url_
```

### _Step 5: Run sample test_

Run a sample test with Zebrunner reporting:
```
pytest tests/base_test.py
```
___
For more information about framework refer to PyTest [documentation](https://docs.pytest.org/).<br>
For more information about reporting refer to Zebrunner [documentation](https://zebrunner.com/documentation/reporting/pytest/).
___