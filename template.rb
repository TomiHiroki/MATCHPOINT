@app_name = ask('アプリ名を入力してください')

gem 'bcrypt'
gem 'carrierwave'
gem 'rmagick'
gem 'cloudinary'

gem 'activeadmin', github: 'gregbell/active_admin'
gem 'devise'

gem_group :development do
  # エラー画面をわかりやすく整形してくれる
  gem 'better_errors'

  # better_errorsの画面上にirb/pry(PERL)を表示する
  gem 'binding_of_caller'
end

gem_group :production do
  gem 'pg', '0.21.0'
end


run "bundle install --without production"

run "cp ../database.yml config/"
gsub_file 'config/database.yml', /APP_NAME/, @app_name

rails_command 'db:create'

generate(:model, "user name:string email:string password_digest:string img:string content:text")

generate(:model, " post content:text user:references img:string title:string" )

generate(:model, " comment content:string post:references ")

rails_command 'db:migrate:reset'

generate(:model, "user_follow user_id:integer follow_id:integer")

generate(:model, "user_favorite user_id:integer favorite_id:integer")

generate(:model, "user_join user_id:integer join_id:integer")

rails_command 'db:migrate:reset'

run 'cp -r ../sns/app/models  app/'

run 'cp -r ../sns/app/controllers  app/'

run 'cp ../sns/config/routes.rb config/'

run 'cp -r ../sns/app/views app/'

run 'cp -r ../sns/app/uploaders app/'

run 'cp ../sns/app/helpers/sessions_helper.rb app/helpers/'

gsub_file 'app/views//layouts/application.html.erb', /APP_NAME/, @app_name