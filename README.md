# Job Box App
Flutter assessment to code from the given UI designs. This application for user to search for the job and apply for it, it has features:
- Login
- Register
- Job Listing
- Nearby Job Listing
- Applied Jobs
- Profile

## Table of Contents
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Project Architecture](#project-architecture)

## Getting Started
### Usage for Frontend 
In this project, the source codes can be found under `/lib`

No data inputs are required, as the codes are purely for UI purposes. 

1. Run the app in Debug Mode

2. **Login** / **Sign Up** with the default user credentials (Adrian Severin)

* *Note: Text Fields are disabled, thus it can't be changed*

3. Apply Jobs in **Job Listing Section**

* *Note: You may toggle edit mode and switches to include resume*

4. Check **Applied Jobs** Section for the recently added applied job.

5. Go to **Profile** to view personal information about the default user

### Project Set Up
Follow these steps to set up and run the project on your local machine.

1. **Clone the project**:
   `git clone https://github.com/draconra/jobbox_flutter`
2. **Install Dependencies for Flutter**:
   `flutter pub get`

## Usage
 - Run Flutter on Emulator**:
   `flutter run -d emulator-5554`
     
## Project Architecture
**Data Source**
- Data : the data that we get is in here 

**View Model**
- Jobs Model Data : in here we set for jobs data to render it
- User Model Data : in here we set for user data to render it

**UI**
- Views : in here we set the screen
