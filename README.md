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

## Contribution Guide
We welcome and appreciate any contributions from community members. If you wish to contribute, please follow these steps:
1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Version Control
This project is version-controlled with Git. You can view the available versions in the project's [repository](https://example.com/ZiyouBackend-master).

## Contact Information
If you have any questions, please contact us through:
- Email: support@example.com
- GitHub Issue Tracker: https://example.com/ZiyouBackend-master/issues

## To-Do Features
- [ ] **PDF Output Adjustment via Parameters**: Implement functionality to adjust the generated PDF outputs through parameters.
- [ ] **Integration with Educational Cloud Accounts**: Enable account integration with educational cloud services.
- [ ] **Connection to C++ Based Question Recommendation System**: Integrate with a C++ backend system for question recommendations.
- [ ] **Continuous Deployment**: Establish continuous deployment workflows to streamline updates and releases.
- [ ] **Comprehensive Unit Testing**: Expand the unit testing suite for more thorough coverage.
- [ ] **Integration with Vue.js Frontend**: Integrate the backend with a Vue.js frontend for a seamless user experience.
- [ ] **Redis Implementation (Potential Requirement)**: Set up Redis for enhanced caching and session management.
- [ ] **Integration with the Xiaoxuetang Mobile App**: Connect the backend with the Xiaoxuetang mobile app for extended functionalities.



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
