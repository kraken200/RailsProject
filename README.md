# README

## Team Members

- Krishnakanth Gudur
- Venkatesh Nettem
- Subhani Pathan
- Viswateja Pentyala

## Instructions to run the project

- Clone the repo/ open the downloaded zip folder and cd into the navu-f22 folder
- Run bundle install on the terminal
- Make sure postgres is running
- run rails db:migrate:reset db:seed
- If you run into an error that says "fatal: no live threads left. Deadlock?" Please run rails:db:migrate:reset and then rails db:migrate:reset db:seed. It should work.
- Open in app in browser from localhost:3000
- feel free to experiment with the app.

## Information to replicate demo video (M2)

- Log in using username- bob@email.com, password- password
- If you log in with any other user, that will not effect your ability to replicate the demo. The credentials are available in db/seeds.rb
- In case of user sign up, please fill in all the information since most of it is required to complete sign up.
- No further information is required to replicate the demo. You can simply follow the video. link - https://youtu.be/1We_7irgV8s
