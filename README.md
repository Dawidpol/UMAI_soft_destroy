# UMAI_soft_destroy

After you start this you will see the preview of the soft_destroy feature.

The source code for the feature is located here:
```ruby
lib/soft_destroy.rb
lib/soft_destroy/override_methods.rb
```

Tests are located in:

```ruby
test/soft_destroy/soft_destroy_test.rb
```
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

For soft version:
```ruby
Book.destroy
Book.destroy(:soft)
Book.soft_destroy
```

For hard version:
```ruby
Book.destroy(:hard)
Book.hard_destroy
```

