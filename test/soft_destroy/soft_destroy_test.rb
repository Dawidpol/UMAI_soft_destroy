class SoftDestroyTest < ActionDispatch::IntegrationTest
  test "should soft destroy" do

    assert_difference 'Author.count', 1 do
      author = Author.create(first_name: 'Dawid')

      assert_not author.deleted
      author.soft_destroy
      assert author.deleted

      Author.count
    end
  end

  test "should hard destroy" do
    assert_difference 'Author.count', 0 do
      author = Author.create(first_name: 'Dawid')

      assert_not author.deleted
      author.hard_destroy

      Author.count
    end
  end

  test "should soft destroy cascade" do
    assert_difference ['Author.count', 'Book.count'], 1 do
      author = Author.create(first_name: 'Dawid')
      book = author.book.create(name: 'Universe')

      assert_not author.deleted
      assert_not book.deleted

      author.soft_destroy

      assert author.deleted
      assert book.deleted

      Author.count
    end
  end

  test "should hard destroy cascade" do
    assert_difference ['Author.count'], 0 do
      author = Author.create(first_name: 'Dawid')
      book = author.book.create(name: 'Universe')

      assert_not author.deleted
      assert_not book.deleted

      assert_difference ['Book.count'], -1 do
        author.hard_destroy

        Book.count
      end

      Author.count
    end
  end

  test "should soft destroy cascade multiple" do
    book_amount = 10

    assert_difference ['Book.count'], book_amount do
      author = Author.create(first_name: 'Dawid')

      book_amount.times do
        author.book.create(name: 'Universe')
      end

      assert_not author.deleted

      author.book.all.each do |book|
        assert_not book.deleted
      end

      author.soft_destroy

      assert author.deleted
      author.book.all.each do |book|
        assert book.deleted
      end

      Book.count
    end
  end

  test "should hard destroy cascade multiple" do
    book_amount = 10

    assert_difference ['Book.count'], 0 do
      author = Author.create(first_name: 'Dawid')

      book_amount.times do
        author.book.create(name: 'Universe')
      end

      assert_not author.deleted

      author.book.all.each do |book|
        assert_not book.deleted
      end

      author.hard_destroy

      Book.count
    end
  end
end