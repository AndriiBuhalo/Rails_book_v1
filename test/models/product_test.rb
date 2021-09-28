require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products # підтягне шаблон з test/fixtures/products
  def new_product(image_url)
    Product.new(
    title:
    "My Book Title",
    description:
    "yyy",
    price: 1,
    image_url: image_url)
  end
    test "image url" do
      # url изображения
      ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
      http://a.b.c/x/y/z/fred.gif }
      bad = %w{ fred.doc fred.gif/more fred.gif.more }
      ok.each do |name|
        assert new_product(name).valid?, "#{name} shouldn't be invalid"
        # не должно быть неприемлемым
      end

      bad.each do |name|
          assert new_product(name).invalid?, "#{name} shouldn't be valid"
          # не должно быть приемлемым
      end
    end

    test "product is not valid without a unique title" do
      # если у товара нет уникального названия, то он недопустим
        product = Product.new(title: products(:ruby).title,
          description: "yyy",
          price: 1,
          image_url: "fred.gif")
          
      assert product.invalid?

      assert_equal ["has already been taken"], product.errors[:title]
      end
      # уже было использовано

end
  
    # Утверждение — это обычный вызов метода, в котором среде тестирования сообща-
    # ется, что именно для нас является истиной. 
    # якщо assert вказуєщо саме для нас являється істиною якщо true тоді все ок
    # якщо один false то зупиняється виконання метода тестування 

