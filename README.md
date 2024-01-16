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

### Prerequisites

Make sure you have the following installed on your system:

- Ruby
- Rails
- SQLite or your preferred database system

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your_username/artemis-job-tracker.git
   ```

2. Navigate to the project directory:
   ```bash
   cd Artemis
   ```

3. Install dependencies:
   ```bash
   bundle install
   ```

4. Set up the database:
   ```bash
   rails db:create
   rails db:migrate
   ```

5. Start the server:
   ```bash
   rails server
   ```

6. Open your web browser and go to [http://localhost:3000](http://localhost:3000) to access Artemis.

### TODO features

1. Create "Job Listings" section to add job description.
2. Upload and manage your resumes in the "Resume Storage" section.
3. Set up section for important deadlines. Include tags such as: deadline, interview, phone_call.
