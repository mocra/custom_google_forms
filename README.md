# Customize Google Forms

<img src="http://img.skitch.com/20100225-rm11rdpj6qib6ukbwdi87ewd76.preview.jpg" alt="Google Form Customized" style="float: right; width: 200px"/>

Google Forms are a great, free way to collect information for anyone, stored directly into a Google Spreadsheet, and then have Google notify you each time a form is submitted (optionally). The downside is that you can only use one of their pre-packaged themes. You can't have your company logo and corporate "look".

Pooey to Google, I say.

Want to truly customized Google Forms? Fork this repository, customize the CSS, DOM and images, and deploy to Heroku. You can then host/customize any number of Google Forms.

For example, here is an original [bare Google Form](http://spreadsheets.google.com/a/mocra.com/viewform?formkey=dFo0LXQyYmlEV2dXcVJ6WjRweW9vRnc6MA) and here is a [fully customized version](http://forms.mocra.com/railsdev), including errors and thank you page.

## How to use Google Forms

Perhaps read [this docco](http://docs.google.com/support/bin/answer.py?hl=en&amp;answer=87809)? Essentially if you can access Google Spreadsheets, you can create a Google Form (which automatically creates and updates a Google Spreadsheet based on the fields and form submissions).

## Fork and Customize

It's really simple to play with and customize Google Forms:

    gem install github
    cd ~/Sites
    gh clone mocra/my-google-forms yourdomain-google-forms
    cd yourdomain-google-forms
    script/server

Go to [http://localhost:3000/google_forms/new](http://localhost:3000/google_forms/new) and add a Google Form:

<img src="http://img.skitch.com/20100225-msfc5a8gk5rnm5pm7qdy9fd6x6.jpg" alt="My Google Forms - New" style="width: 100%"/>

The "Slug" is the URL path people will follow. That is, a slug "railsdev" maps to [http://forms.mocra.com/railsdev](http://forms.mocra.com/railsdev).

The "Form Key" field takes either the [Form URL](http://spreadsheets.google.com/a/mocra.com/viewform?hl=en&amp;formkey=dFo0LXQyYmlEV2dXcVJ6WjRweW9vRnc6MA) or just the formkey parameter (e.g. dFo0LXQyYmlEV2dXcVJ6WjRweW9vRnc6MA) from when you view the live form.

Press "Create" and follow the slug url to view your Google Form through your own customized style.

Well, initially you'll see the Mocra style. Let's fix that.

# Default Theme

First, fork the github repository so that you can push your style changes to your own repo.

    gh fork

Now, edit public/stylesheets/style.css to your tastes.

Please don't reuse our style. Aside from having the :mocra logo at the top, it would be weird if your form looked like our forms. I guess you might as well have used the default Google Form themes?

# Heroku Deployment

Let's not get fancy, let's just deploy your fork to Heroku. It's free. It's simple. You'll be done in two minutes.

To get your copy of the application deployed to [heroku](http://heroku.com):

    gem install heroku
    heroku create yourdomain-google-forms
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


