# Only Documentation

Only is a lightweight route definition helper that supplants Rails' built-in route constraints. The single mode of operation is to validate that a condition is true — specifically, that a parameter is included in a provided collection.

This makes it easy to use your models and other objects to create flexible routes that don't allow junk parameters to reach your controllers, reducing potential attack vectors and improving the error responses returned to visitors.

### Example

```ruby
# config/routes.rb

Only.allow category: Category.all.map { |c| c.name.downcase }, prefix: :valid, suffix: :for_post

Rails.application.routes.draw do
  only :valid_categories_for_post do
    get '/:category/posts' => 'posts#index'
  end
end
```
