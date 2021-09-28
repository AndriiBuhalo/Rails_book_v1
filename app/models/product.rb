class Product < ApplicationRecord
     validates_presence_of :title, :description, :image_url, :price
         # validates_presence_of це перевірка на наявність ведення в HTML цих даних якщо юзер не вів то буде помилка
     validates :title, uniqueness: true
          # uniqueness унікальні слова будуть в заголовках
     validates :price, numericality: {greater_than_or_equal_to: 0.01}
    # greater_than_or_equal_to (больше чем или равно) значение 0.01
    validates :image_url, allow_blank: true, format: {
        with: %r{\.(gif|jpg|png)\Z}i,
        message: 'URL должен указывать на изображение формата GIF, JPG или PNG.'
        }
    # метод format:  который определяет
    # соответствие значения поля регулярному выражению. В данный момент мы
    # просто проверим, что URL-адрес заканчивается одним из расширений: .gif,
    # .jpg или .png.
end
