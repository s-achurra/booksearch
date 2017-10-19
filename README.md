# Book Search

## Features

- Book search indexes a library on initialization
- Setup is conducted in O(n) where n is the number of words in all books' titles and descriptions
- It removes punctuation [. , ? ! -] from the index
- It searches words against the index in O(1)
- The provided JSON is used as the default library

## Instructions

- Navigate to the folder via terminal
- Run 'bundle' to install dependencies
- To run specs
  - Run 'bundle exec rspec'
- To run the program
  - Run 'ruby lib/booksearch.rb'
  - Follow the prompts by entering a word or list of words
  - Example: 'rain england young' (quotes are not required)
  - Enter q to exit
