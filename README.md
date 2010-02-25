## Heroku Deployment

    heroku create yourdomain-my-google-forms
    git push heroku master
    heroku rake db:migrate

Two optional environment variables:

    heroku config:add GOOGLE_ANALYTICS='YOURCODE'

If specified, Google Analytics will be included on all pages (including the custom Google Forms page).

    heroku config:add EXPECTED_DOMAIN='some.yourdomain.com'

If specified, 'yourdomain-my-google-forms.heroku.com/someform' automatically redirects to 'some.domain.com/someform'. 

For example, for http://forms.mocra.com we used:

    heroku config:add GOOGLE_ANALYTICS='UA-5370510-4'
    heroku config:add EXPECTED_DOMAIN='forms.mocra.com'