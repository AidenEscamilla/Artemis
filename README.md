# 🏹 Job hunt tracker
## Project Title: Artemis

![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white) \
Artemis is a Ruby on Rails web application designed to help me track and manage my job hunt effectively.

***Currently in development***

## End Goal

- **Job Listings:**
  - Add with the simple copy paste of the url
  - Edit, and delete job listings with details like company, position, and application status.
  - Application status includes: status, phone_call?, made_the_interview?, made_second_round?
- **Important dates:** Keep track of important application deadlines and interviews all in one place.
- **Resume Storage:** Upload and store your resumes for easy access during the application process.

## Getting Started

### Findings

Makeing sure I have the following installed on my system:

- Ruby
- Rails
- Postgres

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/AidenEscamilla/Artemis.git
   ```

2. Navigate to the project directory:
   ```bash
   cd Artemis
   ```

3. Install dependencies:
   Following along the Rails documentation lead me to generate the error below:

   ```bash
   ERROR: While executing gem ... (Gem::FilePermissionError)
   You dont have write permissions for the /Library/Ruby/Gems/2.6.0 directory
   ```

   As I searched for a fix I read [this](https://www.moncefbelyamani.com/the-definitive-guide-to-installing-ruby-gems-on-a-mac/) blog post describing the problem & solution \
   I decided to follow along with the ruby version manager setup the post recommended ([found here](https://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/#read-this-part-only-if-you-are-on-an-apple-silicon-mac-m1m2))\

   Now that ruby is running, I got back to the rails doc. [Getting started](https://guides.rubyonrails.org/getting_started.html)

5. Set up the database:
   ```bash
   rails db:create
   rails db:migrate
   ```

6. Start the server:
   ```bash
   bin/rails server
   ```

7. Open your web browser and go to [http://localhost:3000](http://localhost:3000) to access Artemis.

### Post rails getting-started

1. The lazy programmer in me decided `bin/rails` was too much typing. However, when creating an alias `'rails server' = 'bin/rails server'` I ran into my first
  ```bash
  /Users/{username}/.zshrc:5: bad assignment
  ```
  A more seasoned programmer might have spotted the error already but you shouldn't include unneeded whitespace in scripts. Shoutout to [this article](https://itsfoss.com/solve-zsh-bad-assignment/) for a quick solution and lesson on whitespace in scripts & linux

2. Converted from sqlite to a more familiar & practicle Postgres following [this article](https://www.digitalocean.com/community/tutorials/how-to-use-postgresql-with-your-ruby-on-rails-application-on-macos) for the setup
  - And the because i'm used to uuid's (and they seem more secure) I followed along [this video](https://www.youtube.com/watch?v=P6Kgn6wElPY) to setup uuid for the database & for any models generated. 

### TODO features

1. Create "Job Listings" section to add job description.
2. Upload and manage your resumes in the "Resume Storage" section.
3. Set up section for important deadlines. Include tags such as: deadline, interview, phone_call.
