<p align="center">
<img src="https://github.com/Kawyanethma/2ndYearProject/assets/92635894/61a45141-7e29-4ae9-8b26-7f0186e00c06" width='200px' alt="logo">
 <p/>

# Vaccine Wallet

**“Vaccine Wallet”** is a fully computerized vaccination details system to replace the vaccination card system in Sri Lanka. “Vaccine Wallet” has a simple user interface for registration and usage of the system. This enhanced online vaccination system will completely bring down the forgetting of vaccination details and time period.**“Vaccine Wallet”** also check the availability of vaccines from the hospitals and allows the user to find a location for the vaccination process.
(Mobile App Design and implementation by me, You can contact by my email)

This project contain with,
1. **Flutter App** - For public users (This repo) 📱
   (Mobile App Design and implementation by me, You can contact by my email)
3. [**Dashboard** - For hospital staff (Click to go to the repo)](https://github.com/sanduweera/Dashboard) 💻

# Flutter App overview 📱
<p align="center">
  <img src="https://github.com/Kawyanethma/2ndYearProject/assets/92635894/2c919ab8-e7cc-463b-8493-abcbb0afa274" width='500px' alt="logo">
  <img src="https://github.com/Kawyanethma/2ndYearProject/assets/92635894/44e37b18-96e2-4c38-be8e-b3b04c0cda25" width='500px' alt="logo">
<p/>

# Dashboard overview 🖥️
<p align="center">
  <img src="https://github.com/Kawyanethma/2ndYearProject/assets/92635894/4759aaaa-61c4-42e3-b913-07bf121b86d4" width='500px' alt="logo">
  <img src="https://github.com/Kawyanethma/2ndYearProject/assets/92635894/2f079a45-6fa4-46d6-8611-b55ff86dc6c6" width='500px' alt="logo">
<p/>

## Technology
- **Flutter** - Flutter is used to design the frontend of the “Vaccine Wallet” mobile app (iOS and Android).
- **JS | HTML | CSS** - These are used to design the Frontend of the “Vaccine Wallet” admin web interface.
- **Firebase** - Firebase is used to build up the database of the “Vaccine Wallet”.

<p align="center">
<img src="https://github.com/Kawyanethma/2ndYearProject/assets/92635894/4a6b4816-8096-4956-afee-cc68f7fe5e0a" width='500px' alt="logo">
<p/>

## Interface Design
### Fonts and Color Family

<p align="center">
<img src="https://github.com/Kawyanethma/2ndYearProject/assets/92635894/84cb3a34-d63d-40c5-9758-ae0f03f18863" width='500px' alt="logo">
<p/>
  
<hr>

# Project Aim
The aim of this project is to **research, design, activate and evaluate a digital vaccine description application for digitizing the vaccine system** to make it easier to obtain information on vaccination locations, times, dates, and vaccines obtained.

# Enhanced Vaccination System

##  Detailed Process Flow of Enhanced-Vaccination System

### Level Data Flow Diagram

<p align="center">
<img src="https://github.com/Kawyanethma/2ndYearProject/assets/92635894/5241ae13-7479-49e8-b47c-a5b93e30d45c" width='500px' alt="logo">
<p/>

The general overview of the enhanced vaccination system is represented through this diagram which is being analyzed or modeled. This diagram is easily understood as it is designed to get a basic idea of the enhanced vaccination system at-a-glance view.
High-level entities and process flow of enhanced vaccination system are:
- Managing all users
- Managing all admins
- Managing all vaccine details
- Managing all notifications
- Managing stocks

### 1<sup>st</sup> - Level Data Flow Diagram
<p align="center">
<img src="https://github.com/Kawyanethma/2ndYearProject/assets/92635894/5d5cfcc6-c12e-4984-b23d-055e33b98dad" width='500px' alt="logo">
<p/>

The first level data flow diagram of the enhanced vaccination system is visualized in figure where the system is divided into subsystems. The first level data flow diagram is a more detailed version of the zerolevel data flow diagram of the enhanced vaccination system. Functionalities of the vaccination system are represented here by in or out data flows.

### 2<sup>nd</sup> - Level Data Flow Diagram
<p align="center">
<img src="https://github.com/Kawyanethma/2ndYearProject/assets/92635894/3131494f-636e-408c-8c0b-2414969d2160" width='500px' alt="logo">
<p/>

Figure above illustrates the 2nd level data flow diagram of the enhanced vaccination system. This diagram is a deeper version of the 1st level data flow diagram of the vaccination system which contains further details on vaccines, users, admins, and so on.

## Entity Relationship Diagram
<p align="center">
<img src="https://github.com/Kawyanethma/2ndYearProject/assets/92635894/865c1403-c5a5-43dd-bc15-4520c0105d09" width='500px' alt="logo">
<p/>

Above figure illustrates the ER diagram for the Enhanced Vaccination System depicting various entities, attributes, and their relationships. This diagram will be useful when designing the database of the Enhanced Vaccination System.

## Class Diagram

Below figure illustrates the Class diagram for the enhanced vaccination system where the structure of the system is depicted with classes, attributes, methods, and the relationships among objects.
Classes of the enhanced vaccination system:
- System Database
- Account
- Vaccine
- Children
- Date
- Admin Account
- User Account

<p align="center">
<img src="https://github.com/Kawyanethma/2ndYearProject/assets/92635894/7831c3e3-af50-499d-b963-8338f68fb2f2" width='500px' alt="logo">
<p/>

# System Design

The "Vaccine Wallet" digitalizes the current vaccine card system. This automated system was created as a mobile application for users and a web portal for administrators. The simple user interface of “Vaccine Wallet” system makes it easy to register, examine vaccination records, and find the nearest vaccination center.

## Overall System Architecture

### Software Architecture 

<p align="center">
<img src="https://github.com/Kawyanethma/2ndYearProject/assets/92635894/586eba5e-5c63-4b96-9fef-7c36ef53beb8" width='500px' alt="logo">
<p/>

The diagram shows two main activities.
#### 1. View Vaccine data (user)
Registered users can view their vaccine records and their children vaccine records.
#### 2. Update/ View data (admin)
when user get vaccinated admin can update the system. as well as they can view users’ vaccine records. (Medical staff)

### Module Architecture of the proposed system
### [Module 1: Architecture] – Admin Module
<p align="center">
<img src="https://github.com/Kawyanethma/2ndYearProject/assets/92635894/c099ca62-4d98-44a9-ac4b-45a69ba8bd00" width='500px' alt="logo">
<p/>

- Login to system - Admins can login using their user id and password.
- Manage Users - Admin can add or remove users.
- Manage Admins - Existing admins can add new admins.
- View Vaccine details - Admins can view users’ vaccine details (hospital staff).

### [Module 2: Architecture] – User Module

<p align="center">
<img src="https://github.com/Kawyanethma/2ndYearProject/assets/92635894/47e4d35e-fa19-4069-b4ec-2681ffb18694" width='500px' alt="logo">
<p/>

- **Login to system** - Users can login using their National ID and password.
- **Signup** - Users can sign up with their preregistered national ID.
- **View Vaccine details** - Users can view their and their children vaccination history and next vaccination details.
  
## Data Design 
Vaccine Wallet system has one centralized database for the user registration, store vaccine details and store vaccination centers.

### Conceptual Data Design of the Proposed System
 This diagram displays the entities, attributes, and relationships of the Vaccine wallet system.
 The entities and attributes of the EER diagram are as follows:
 - **User** – Age, date of birth, mobile number, NIC number and name divided as first name and last name, is a composite attribute of the user. NIC number is the primary key of the user.
 - **Children** – Children ID (Birth certificate number), date of birth and name as first name and last name, is a composite attribute of the children. Child ID is the primary key of the children.
 - **Admin** – Admin ID is the primary key of the here. Admin role, admin id, mobile number, and name as first name and last name is a composite attribute of the of the admin.
 - **Vaccine** – Number of vaccines, vaccine name and vaccine id are the attributes of vaccine. Vaccine id is the primary key here.

<p align="center">
<img src="https://github.com/Kawyanethma/2ndYearProject/assets/92635894/865c1403-c5a5-43dd-bc15-4520c0105d09" width='500px' alt="logo">
<p/>

The relationships between the entities of the EER diagram are as follows:
- One user has many children.
- Many users manage many admins.
- One admin updates many vaccines (one specific admin dedicated for the manage vaccine).
- Many users get many vaccines.
- Many children get many vaccines

### Normalization
Normalization is the process of organizing data in a database. This includes creating tables and establishing relationships between those tables according to rules designed both to protect the data and to make the database more flexible by eliminating redundancy and inconsistent dependency. In the
NoSQL database, there are no rules of normalization to consider and follow. The reason for it is NoSQL databases don’t relationally store data. we are using Firebase store data that use NoSQL. So, there is no need to normalize our database
