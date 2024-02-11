![example workflow](https://github.com/5568ke/ZiyouBackend/actions/workflows/ci.yml/badge.svg)

# Ziyou Backend Project

## Introduction
Ziyou Backend is a backend service framework specifically designed to receive requests and call C++ executables to generate and return problem PDFs. It aims to offer flexibility in development and reliability in the future.Utilizing Docker containerization, automated testing, and Continuous Integration/Continuous Deployment (CI/CD) strategies 
## Installation Guide
1. **Prerequisites**: Ensure your system has Docker and Docker Compose installed.
2. **Clone the Project**: Use the git command to clone the project to your local machine.
    ```
    git clone https://example.com/ZiyouBackend-master.git
    ```
3. **Environment Setup**: Navigate to the project directory and modify environment variables in the `.env` file as necessary.

## Usage Instructions
1. **Start Services**: In the project's root directory, run the following command to start all services:
    ```
    docker-compose up -d
    ```
2. **Run Tests**: Execute the unit tests with the following command:
    ```
    python test.py
    ```

## Docker Support
This project includes a `docker-compose.yml` file, defining the services required by the project. This allows for easy management and operation of multiple containers for the project using Docker Compose.

## Development Workflow
As this is a team project and team members may not be familiar with Git, here is a simplified development workflow:
1. **Clone the project** to your local machine as shown in the Installation Guide.
2. **Create a new branch** for your feature or bug fix (`git checkout -b feature/YourFeatureName`).
3. **Make changes** and **commit** them to your branch (`git commit -am "Add your feature"`).
4. **Push your branch** to the repository (`git push origin feature/YourFeatureName`).
5. Discuss with the team and **merge your changes** into the main branch once approved.

## Version Control
This project is version-controlled with Git. You can view the available versions in the project's [repository](https://example.com/ZiyouBackend-master).


## To-Do Features
- ✅ **Understanding the Old Web Backend Behavior**
- ✅ **Migrating Data from the Old Database to the New Design**
- ❌ **Designing the Question Generation API**  (In progress)
- ❌ **PDF Output Adjustment via Parameters**: Implement functionality to adjust the generated PDF outputs through parameters.
- ❌ **Integration with Educational Cloud Accounts**: Enable account integration with 教育雲 account.
- ❌ **Connection to C++ Based Question Recommendation System**: Integrate with a C++ backend system for question recommendations.
- ❌ **Continuous Deployment**: Establish continuous deployment workflows to streamline updates and releases.
- ❌ **Comprehensive Unit Testing**: Expand the unit testing suite for more thorough coverage.
- ❌ **Integration with Vue.js Frontend**: Integrate the backend with a Vue.js frontend for a seamless user experience.
- ❌ **Redis Implementation (Potential Requirement)**: Set up Redis for enhanced caching and session management.
- ❌ **Integration with the Xiaoxuetang Mobile App**: Connect the backend with the 小學堂 mobile app for extended functionalities.



```

                       _oo0oo_
                      o8888888o
                      88" . "88
                      (| -_- |)
                      0\  =  /0
                    ___/`---'\___
                  .' \\|     |// '.
                 / \\|||  :  |||// \
                / _||||| -:- |||||- \
               |   | \\\  -  /// |   |
               | \_|  ''\---/''  |_/ |
               \  .-\__  '-'  ___/-. /
             ___'. .'  /--.--\  `. .'___
          ."" '<  `.___\_<|>_/___.' >' "".
         | | :  `- \`.;`\ _ /`;.`/ - ` : | |
         \  \ `_.   \_ __\ /__ _/   .-` /  /
     =====`-.____`.___ \_____/___.-`___.-'=====
                       `=---='

                 小學堂真的會超渡我= =

     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
```
