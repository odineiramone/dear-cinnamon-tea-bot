# Dear Cinnamon Tea Bot

Chatbot powered by [Lita](lita.io)!

Environment dependencies:

  -  Ruby 2.5.1
  -  Lita 4
  -  Redis 2.6

# Setup

  - Install dependencies

    ```shell
    bundle install
    ```
  - Dotenv file

  ```shell
  mv .env.example .env
  ```

  - Run server

  ```shell
  lita start
  ```

# How to use

For now, the bot respond this three questions

  - Check wheater *
  ```
  Dear Cinnamon Tea, weather please
  ```

  - Search on Giphy
  ```
  Dear Cinnamon Tea, giphy doge
  ```

  - Replies that what it is going to do today
  ```
  Dear cinnamon tea, what do you want to do today?
  ```

  \* Available only in Brazil. You need to check your city code to configure this feature. To do this, go to Climatempo API docs, [search on API for your city](http://apiadvisor.climatempo.com.br/doc/index.html#api-Locale-GetCityByNameAndState) and then put the code in `.env` file.
