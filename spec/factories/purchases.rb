FactoryGirl.define do
  factory :purchase do
    guid { "759e7ac3-73cb-4b2d-bb11-7a6119e00a66" }
    create_date_time { DateTime.parse("2013-03-05T16:02:06") }
    registration_number { 31300177655 }
    name { "Поставка дорожных знаков для нужд ГУП РА \"Кошехабльский ДРСУ\"" }
    purchase_method_code { 18010 }
    purchase_code_name { "Запрос цен" }
    publication_date_time { DateTime.parse("2013-03-05T16:30:49") }
    modification_date { DateTime.parse("2013-03-05T16:30:49") }
    status { "P" }
    version { 1 }
    save_user_id { 8109 }
    examination_place { "385400, Россия, Республика Адыгея, Кошехабльский район, аул Кошехабль, ул. Дружбы Народов, 74" }
    examination_date_time { DateTime.parse("2013-03-13T09:00:00") }
    submission_close_date_time { DateTime.parse("2013-03-12T08:00:00") }
    publication_planned_date { DateTime.parse("2013-03-05") }
  end
end

