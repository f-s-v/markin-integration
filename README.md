1. Create an heroku application.
2. Store secrets to heroku applicaiton settings with prefix 'MARKIN_'
3. Check ansible/group_vars/all for settings
4. Run `bundle install --gemfile capistrano/Gemfile`
4. Install ansible
5. Run `ansible-playbook -i ansible/production.ini ansible/application.yml`