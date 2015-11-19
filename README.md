## WaitList
### WaitList is simple web application for managing appointment's and send easy reminder via SMS to guest's.

## To Run

1. Navigate to the root directory of the app in your command line.
2. Type 'bundle install'
3. Type 'be rake db:drop' (incase there is a local instance of a database)
4. Type 'be rake db:create'
5. Type 'be rake db:migrate'
6. Set Twilio API key's( TWILIO_SID and TWILIO_TOKEN) in enviroment
7. Update sender's number in application_controller.rb
8. Type rails s
9. Open your browser and navigate to [http://localhost:3000/](http://localhost:3000)

## Things to implement
 1. Link to profile edit page.
 2. Create new migration for new cloum in user for Storing default message for sending sms to contact.
