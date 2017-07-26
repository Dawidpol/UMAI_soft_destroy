# UMAI_soft_destroy

If you want to see the preview of the soft_destroy feature you need to just start this app and go to url:
```ruby
https://localhost:3000/authors
```
The source code for the feature is located in:
```ruby
lib/soft_destroy.rb
lib/soft_destroy/override_methods.rb
```
Feature's tests are located in:
```ruby
test/soft_destroy/soft_destroy_test.rb
```
If you want to add your own model class with feature. You need to follow the instructions below.
To add soft destroy feature you need to add enable_soft_destroy in model class
```ruby
class Book < ApplicationRecord
  enable_soft_destroy
end
```
Then you need to add column in the table using migration
```ruby
class AddSoftDeleteToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :deleted, :boolean, :default => false
  end
end
```
Then you can use it like that

Soft version:
```ruby
Book.destroy
Book.destroy(:soft)
Book.soft_destroy
```

Hard version:
```ruby
Book.destroy(:hard)
Book.hard_destroy
```
