# UMAI_soft_destroy

The source code for the feature is located here:

/umaiApp/lib/soft_destroy.rb
/umaiApp/lib/soft_destroy/override_methods.rb


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

