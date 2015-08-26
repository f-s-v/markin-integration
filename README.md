Setup:

1. Create an heroku application.
2. Store secrets to heroku applicaiton settings with prefix 'MARKIN_'.
3. Check ansible/group_vars/all and capistrano/config/deploy.rb for settings.
4. Install ansible.
4. Run `bundle install --gemfile capistrano/Gemfile`.
5. Run `ansible-galaxy install -r ansible/requirements.txt --force`.
6. Run `ansible-playbook -i ansible/production.ini ansible/application.yml`.

Deploy:

1. Enter to `capistrano` folder.
2. Run `bundle install`
3. Run `bundle exec cap production deploy`
