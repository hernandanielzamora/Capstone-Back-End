# Capstone-Back-End

## Getting Started

This project was built using Ruby on Rails. It is the backend of a booking app that allows users to register and log in, and create reservations for specific rooms. It also allows users to see the reservations they have made and the rooms they have booked.

<a name="readme-top"></a>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
- [💻 Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Setup](#setup)
  - [Usage](#usage)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [❓ FAQ](#faq)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 Capstone-Back-End <a name="about-project"></a>

The **Capstone-Back-End** project sends data to the front-end through the use of api-endpoints. These endpoints are mostly private so the users can only read and manipulate the data if they are autheticated and authorized to do so. The project was built using Ruby on Rails and deployed on Render.

## Kanban Board

### Current state

[Kanban Board](https://github.com/users/hernandanielzamora/projects/4/views/1)

### Initial State

![image](https://camo.githubusercontent.com/06ae0b8a6d178a32902c22e9de37ebe10b28d5298f1f3dde4ffa022d785dffde/68747470733a2f2f692e706f7374696d672e63632f6662506a4351594c2f6769746875622d636f6d2d75736572732d6865726e616e64616e69656c7a616d6f72612d70726f6a656374732d342d76696577732d312e706e67)

<br>

### Final Team: 

4 members (all mentioned in the authors section)

### Frontend Repo

Click this [link](https://github.com/hernandanielzamora/Capstone-Front-End/tree/main) to visit the frontend repository.



## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
<summary>Server</summary>
  <ul>
    <li>Deployed on Render <a href="https://rails-b62y.onrender.com/">Capstone-Back-End</a></li>
  </ul>
</details>

<details>
<summary>Franwork</summary>
  <ul>
    <li><a href="https://rubyonrails.org/">Ruby on Rails</a></li>
  </ul>
</details>


<!-- Features -->

### Key Features <a name="key-features"></a>

> Key features of the repository.

- **Was created with RoR** 
- **Has a login and registration authentication system with the help of devise**
- **Has a database that stores the records of it's rooms, branches, users and reservations**
- **Users have roles and only admins can manipulate the rooms and braches**
- **Has a private api endpoint that allows users to see their reservations and rooms**
- **Has Rubocop to enforce best ruby practices**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

Follow these steps in order to run ruby code.

### Prerequisites

First you need to ensure that you have ruby installed in your computer. 

### Install

It varies depending on your operating system so here are some links to help you install it on [Windows](https://gorails.com/setup/windows/10) and on [Ubuntu](https://www.ruby-lang.org/en/documentation/installation/#apt). 

For MacOS run the following commands

```sh
  brew install rbenv ruby-build
  # Add rbenv to bash so that it loads every time you open a terminal
  echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
  source ~/.bash_profile

  # Install Ruby
  rbenv install 3.0.1
  rbenv global 3.0.1
  ruby -v
```

This example shows how to install Ruby 3.0.1 which was the latest version in April 2021, but you can check to see if there is a newer version [here](https://www.ruby-lang.org/en/downloads/releases/). Iy is also assumed that you have [homebrew](https://brew.sh/) already installed on your Mac.

Next you'll want to intall Rails and postgreSQL by running the following commands, but you can also use any SQL application of your choice

```shell
  gem install rails -v 7.0.6

  sudo apt install postgresql libpq-dev
```

And start postgreSQL and the app with 

```shell
  sudo service postgresql start

  rails server
```

### Setup

Once you have ruby installed, run this command to get the project on your local machine.

```sh
  git clone git@github.com:hernandanielzamora/Capstone-Back-End.git
```

### Usage

Once you have the project installed, access the project's root directory usign this command 

```sh
  cd Capstone-Back-End
```

Before running your application you'll want to create a master key. To do so you'll need to remove config/master.key and config/credentials.yml.enc if they exist. Then in your terminal run:
```sh
  EDITOR="code --wait" rails credentials:edit 
```

Close the editor that opens. This command will create a new master.key and credentials.yml.enc if they do not exist. Lastly, run this command to see the project in in your browser.

```sh
  rails server
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

> Here is a mention all of the collaborators of this project.

👤 **Author 1**

- GitHub: [@hernandanielzamora](https://github.com/hernandanielzamora)
- LinkedIn: [Hernán Zamora](https://www.linkedin.com/in/hernan-zamora-03a697236/)

👤 **Author 2**

- GitHub: [@zamcham](https://github.com/zamcham)
- Twitter: [@ZamChamGames](https://twitter.com/zamchamgames)
- LinkedIn: [Cristian Zambrano](https://www.linkedin.com/in/cristian-zamcham/)

👤 **Author 3**

- GitHub: [@fredo509](https://github.com/fredo509)
- LinkedIn: [Fredo st fleur](https://www.linkedin.com/in/fredo-st-fleur-0b41a122a/)

👤 **Author 4**

- GitHub: [@jlvFlores](https://github.com/jlvFlores)
- Twitter: [@JoseVaz44312762](https://twitter.com/JoseVaz44312762)
- LinkedIn: [Jose (Luis) Vazquez](https://www.linkedin.com/in/jose-luis-vazquez/)


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

> The following are the future features that will be added to the project.

- [ ] **Add further security measures, such as email confirmation**
- [ ] **Change the deployment site**
- [ ] **It will probably not take over the world**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project you can give me a hand by recommending me to potential employers! 😉🤝

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

We would like to thank those who have motivated us to keep on fighting despite how tough the journey may become.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
