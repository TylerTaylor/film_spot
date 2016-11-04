# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project

- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) 
      - movie has many roles, actors through roles, ratings
      - director has many movies
      - actor has many roles, movies through roles
      - user has many ratings, viewings

- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
      - movie belongs to director
      - rating/viewing belongs to user, movie
      - role belongs to actor, movie

- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
      - movie has many actors through roles
      - actor has many movies through roles

- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
      - user submits rating attribute for viewing

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
      - movie, viewing

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
      - Movie.most_viewed, /movies/most_viewed shows the movies with the most viewings

- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
      - new movie form also creates actors and directors

- [x] Include signup (how e.g. Devise)
- [x] Include login (how e.g. Devise)
- [x] Include logout (how e.g. Devise)

- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
      - Used Devise

- [x] Include nested resource show or index (URL e.g. users/2/recipes)
      - directors/:id/movies
      
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
      - directors/:id/movies/new?director_id=:id

- [x] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate