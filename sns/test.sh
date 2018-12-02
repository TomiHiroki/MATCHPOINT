
rails g model user name:string　email:string password_digest:string
rails g controller users
rails g model post content:string user:references
rails g controller posts

rails g controller session

rails g model user_follow
rails g controller user_follows

rails g model user_favorite
rails g controller user_favorites




