# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements
- [x] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
-  -  - `/movies/random_movie_picker` has a `next suggestion` button that uses a jQuery .getJSON call, then uses prototype functions to build out the show-card div and display a random movie's show page
- [ ] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
- [x] Include at least one has_many relationship in information rendered via JSON and appended to the DOM.
-  -  - The `random_movie_picker` loads a movie, which `has many actors`, and a prototype function loops through each actor to build their link and append it to the right div
- [x] Include at least one link that loads or updates a resource without reloading the page.
-  -  - On a movie's show page, clicking 'yes' loads the new viewing form via AJAX without reloading the page. Then choosing a rating will update the viewing resource and display a star rating.
- [ ] Translate JSON responses into js model objects.
- [x] At least one of the js model objects must have at least one method added by your code to the prototype.
-  -  - When we 'view' a movie, it creates a JS object called Viewing. Viewing's prototype has methods called 'showRating' and 'countStars'

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message