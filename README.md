
# LinkedIn-Autocomplete

A simple demonstration of how to use jQuery, jQueryUI to create an autocomplete similar to what LinkedIn does.  This took a while to figure out so here it is.  Hope it save someone some time.  In my opinion it is a nice UX element to have in your toolbelt.  It's based on, not surprisingly, jQueryUI.

## What it does

Type in a letter or two and render people whose names match your input string:

 * thumbnail image
 * name
 * email
 * company

You can select multiple people generating a comma delimited list.


## Notes

Since this was written LinkedIn has open sourced [cleo] (https://github.com/linkedin/cleo) a Java based "flexible, partial, out-of-order and real-time typeahead search library".  This is what LinkedIn actually uses. That was/is a bit heavy for my Rails needs. Hence this repo.

## Usage

1. clone
2. bundle install
3. db:setup and seed (needs name)
4. rails s

![screenshot of LinkedIn Autocomplete](/app/images/screenshot.png)